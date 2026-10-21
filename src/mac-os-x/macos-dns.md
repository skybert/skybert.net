title: DNS lookup on macOS
date: 2026-10-21
category: mac-os-x
tags: mac-os-x

## Flush the macOS DNS cache

```text
$ sudo dscacheutil -flushcache
$ sudo killall -HUP mDNSResponder
```

## Watch DNS traffic

Watch all DNS quries to [skybert.net](skybert.net) using `tcpdump`:

```text
$ sudo /usr/sbin/tcpdump -l  -n -k -i pktap,all port 53 | grep skybert.net
```

# mDNSResponder

On macOS, DNS requests don't go to the DNS server directly, but
instead the [com.apple.mDNSResponder]() sub system. Since it caches
all the queries, it's often more interesting to watch its logs than
the capturing outgoing packages on port `53`:

```text
$ log stream --predicate 'subsystem == "com.apple.mDNSResponder"'
```

This will list both IPv4 and IPv6 entries. To limit this to only IPv4,
expand the query with:

```text
$ log stream --predicate '
    subsystem == "com.apple.mDNSResponder"
    AND eventMessage CONTAINS "qtype: A,"
  '
```

You can extend this further to incldue the name of the program calling
`mDNSResponder`. My program here was called `dnsreq`:

```text
$ log stream \
  --predicate '
    subsystem == "com.apple.mDNSResponder" AND
    eventMessage CONTAINS "qtype: A," AND
    eventMessage CONTAINS "(dnsreq)"
'
..
Timestamp                       Thread     Type        Activity             PID    TTL
2026-10-21 14:01:48.245878+0200 0x155d     Default     0x0                  689    0
    mDNSResponder:
    [com.apple.mDNSResponder:Default] [R342318] DNSServiceQueryRecord START --
    qname: <private> <dn:6oGD/g>, qtype: A, flags: 0x15000, interface index: 0,
    client pid: 79074 (dnsreq), name hash: <dn:6oGD/g>
```
