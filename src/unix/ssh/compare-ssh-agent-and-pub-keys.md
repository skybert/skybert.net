title: Compare keys in ssh-agent with the pub keys
date: 2026-06-04
category: unix
tags: ssh, unix, linux, security

I like having one key per environment I connect to, including each
forge I push code to. It's a good security measure.

So for instance, I have one key for Github, one for Gitlab, one for
Azure Dev Ops and so on. To make effortlessly with `ssh`
authentication, which is my preferred transport for `git` as well as
logging onto servers, I have them all in my
[ssh-agent](https://man.openbsd.org/ssh-agent):

```text
$ ssh-add -l
3072 SHA256:AEFWADFSFADSasdfasfdfasfasd+adsfafwwwwqasd torstein@bar (RSA)
256 SHA256:IrN6COBlIUXdQWDERWQQWOobU8hnkIj6s+asdfadfsd torstein@foo (ED25519)
256 SHA256:rmFWhSDQEFWRSAFDYHJSFSAasASDFFASDFQQWEWW/9s torstein@mithrandir (ED25519)
```

The problem is only, from which key in `~/.ssh` does this come? The
contents of a `~/.ssh/id_ed25519.pub` is completely different:

```text
$ cat ~/.ssh/id_ed25519.pub
ssh-ed25519 AAASDFASDFASDFAFSDqq/adsfadfs/adsfkjw torstein@some.other
```

Turns out, you easily see hte SHA256 fingerprint of your `.pub` file with:
```text
$ ssh-keygen -lf 
$ ssh-keygen -lf ~/.ssh/id_ed25519.pub
256 SHA256:IrN6COBlIUXADUQSXkROobU8hnasdfQ+WQAS torstein@some.other (ED25519)
```

With that, it's easy to see which key pair in `~/.ssh` have been added
to `ssh-agent`:

```bash
$ ssh-add -l |
  awk '{print $2}' |
  while read sig; do
    find ~/.ssh -name "*.pub" |
      while read key; do
        echo -n $key ' ';
        ssh-keygen -lf ~/.ssh/$(basename "$key" .pub)
      done | grep $sig ;
  done
```

Happy hacking!



