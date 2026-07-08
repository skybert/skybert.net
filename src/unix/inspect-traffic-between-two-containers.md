title: Inspect the Traffic Between Two Containers
date: 2026-06-30
category: unix
tags: unix

I wanted toinspect traffic between my Kong and OPA containers.
First, I got the Kong container in question

```perl
$ docker ps | grep kong-pongo | xargs
bf27b7cfe909 kong-pongo-2.26.0:3.14.0.2 /pongo/pongo_entryp… 17 minutes ago Up 17 minutes (unhealthy) 8000-8004/tcp, 8443-8447/tcp pongo-213cda56-kong-run-6d54c73b2e9c
```

I then use the value in the last column as input to this command:

```perl
$ name=$(docker ps \
           --filter name="${name}" \
           --format json |
           jq -r .Names)
$ docker \
  run \
  --rm \
  --net container:${name} \
  nicolaka/netshoot \
  tcpdump -i eth0 -U -w - 'tcp port 8181 or tcp port 8182' |
  wireshark -k -i -
```


