title: Scraps of TLS and mTLS
date: 2026-08-26
category: network
tags: network, ssl, tls

## CN vs SAN

[CN]() is the old id of who owns the certificate. Noone checks it
anymore, but instead use the X509v3 extension, [SAN](), Subject
Alternative Name.

To check the SAN of a certificate, do:

```text
openssl x509 -in etc/certs/server.crt -noout -text | grep -A 1 'Subject Alternative Name'
            X509v3 Subject Alternative Name: 
                DNS:localhost, DNS:mellon.local, IP Address:127.0.0.1
```

Unlike `CN`, the `SAN` field can contain multiple values. They can be
several types, one of which is `DNS:`.


## References

When diving into TLS and mTLS, I found these resources useful:

- [X.509](https://en.wikipedia.org/wiki/X.509) on Wikipedia, the spec
  itself is [hard to read](https://www.itu.int/rec/T-REC-X.509).
- [Public key
  certificate](https://en.wikipedia.org/wiki/Public_key_certificate)
  on Wikipedia.
