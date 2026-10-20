title: spicedb the hard way
date: 2026-10-08
category: identity
tags: identity


```text
$ brew install authzed/tap/spicedb authzed/tap/zed
```

## Starting the thing

The doc says to start it like this:

```text
$ spicedb serve --datastore-conn-pool-read-max-open 50
..
1:35PM ERR terminated with errors error="required flag(s) \"grpc-preshared-key\" not set"
```

Ok, let's pass a pre-shared key:

```text
$ spicedb serve --datastore-conn-pool-read-max-open 50 --grpc-preshared-key asdfadfs
..
1:37PM ERR terminated with errors error="failed to create gRPC server: failed to listen on addr for gRPC server: listen tcp :50051: bind: address already in use"
```

Something else is running on port `50051`?

```text
❯ sudo lsof -nP -iTCP -sTCP:LISTEN | grep 50051
Password:
launchd       1           root    8u  IPv6 0x7e88492295394464      0t0  TCP *:50051 (LISTEN)
launchd       1           root   10u  IPv4 0xfe29e5878d806e3e      0t0  TCP *:50051 (LISTEN)
```

Indeed. The init system, `launchd` is.

Ok, then, let's start spicedb on a different port. To find out what the port parameter was, I did:
```text
$ spicedb serve --help | grep 50051
      --grpc-addr string                      address to listen on to serve gRPC (default "50051")
```

Ok, so let's change this to something that's not taken:

```text
$ spicedb serve --datastore-conn-pool-read-max-open 50 --grpc-preshared-key foobarbaz --grpc-addr :9901
..
1:45PM INF http server started serving addr=:9090 insecure=true service=metrics
..
```

That looks better.  Turns out, it's now listening on _two_ ports, the one I specified and one more:

```text
$ lsof -nP -iTCP -sTCP:LISTEN | grep spicedb
spicedb 61495 torstein    4u  IPv6 0x99013ee09ce4c918      0t0  TCP *:9901 (LISTEN)
spicedb 61495 torstein    7u  IPv6  0x472ed0712bca149      0t0  TCP *:9090 (LISTEN)
```

In the doc, I spotted `--http-enabled`, thinking it would be useful, I included it too and now got three TCP sockets listening for inbound connections:

```text
$ spicedb serve --datastore-conn-pool-read-max-open 50 --grpc-preshared-key foobarbaz --grpc-addr :9901 --http-enabled
..
1:47PM INF grpc server started serving addr=:9901 insecure=true network=tcp service=grpc workers=0
..
1:47PM INF http server started serving addr=:8443 insecure=true service=http
1:47PM INF http server started serving addr=:9090 insecure=true service=metrics
..
```

`lsof` confirms this:
```text
$ lsof -nP -iTCP -sTCP:LISTEN | grep spicedb
spicedb 62041 torstein    4u  IPv6 0x99013ee09ce4c918      0t0  TCP *:9901 (LISTEN)
spicedb 62041 torstein    7u  IPv6 0xc1e16da20285958f      0t0  TCP *:8443 (LISTEN)
spicedb 62041 torstein    8u  IPv6 0x5cccabf65dca7727      0t0  TCP *:9090 (LISTEN)
```

Now, let's do something with this spicy process.

## Configure the spicedb client, zed

```text
$ zed context set localhost localhost:9901 foobarbaz --insecure
```

Define a few entities:

```perl
zed schema write <(cat << EOF
definition user {}
definition post {
    relation reader: user
    relation writer: user
    permission read = reader + writer
    permission write = writer
}
EOF
)
```

Create some relationships between these entities:
```text
$ zed relationship create post:1 writer user:emilia
$ zed relationship create post:1 reader user:beatrice
```

## Check some permissions

```text
$ zed permission check post:1 read  user:emilia  # true
$ zed permission check post:1 write user:emilia  # true
$ zed permission check post:1 read  user:beatrice # true
$ zed permission check post:1 write user:beatrice # false
```


