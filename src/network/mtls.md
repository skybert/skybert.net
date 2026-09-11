title: Scraps of TLS and mTLS
date: 2026-08-26
category: network
tags: network, ssl, tls, mtls

## CN vs SAN

[CN]() is the old id of who owns the certificate. Noone checks it
anymore, but instead use the X509v3 extension, [SAN](), Subject
Alternative Name.

To check the SAN of a certificate, do:

```text
$ openssl x509 -in server.crt -noout -ext subjectAltName
X509v3 Subject Alternative Name:
    DNS:localhost, DNS:mellon.local, IP Address:127.0.0.1
```

Unlike `CN`, the `SAN` field can contain multiple values. They can be
several types, like `DNS:` and `IP Address:`.


# Which CAs will the server accept?

```perl
$ openssl s_client -connect localhost:8888 -CAfile etc/certs/ca.crt  < /dev/null
..
Acceptable client certificate CA names
CN=mellon, O=moria, C=no
```

# What is ALPN?

The client can tell wich HTTP versions it speaks to establish a TLS
connection, e.g. `h2` for HTTP/2 and `http/1.1` for
HTTP/1.1. [ALPN](https://en.wikipedia.org/wiki/Application-Layer_Protocol_Negotiation)
is made in such a way that the client and server can agree on the
protocol to use without additional roundtrips back and forth:

```text
$ openssl s_client -alpn h2,http/1.1 -connect skybert.net:443 < /dev/null
..
ALPN protocol: h2
```

## References

When diving into TLS and mTLS, I found these resources useful:

- [X.509](https://en.wikipedia.org/wiki/X.509) on Wikipedia, the spec
  itself is [hard to read](https://www.itu.int/rec/T-REC-X.509).
- [Public key
  certificate](https://en.wikipedia.org/wiki/Public_key_certificate)
  on Wikipedia.
