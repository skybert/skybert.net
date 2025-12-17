title: Beware of the case sensitivity in macOS
date: 2025-12-17
category: mac-os-x
tags: mac-os-x

Let's see what kind of file system this is:
```perl
$ diskutil info / | grep 'File System Personality'
   File System Personality:   APFS
```

Is it case sensitive?
```perl
$ touch /tmp/{foo,Foo,FoO,fOO}
```

This looks good, the `touch` command produced different files:

```perl
$ ls /tmp/{foo,Foo,FoO,fOO}
-rw-r--r--  1 torstein  wheel     0B Dec 17 13:12 /tmp/FoO
-rw-r--r--  1 torstein  wheel     0B Dec 17 13:12 /tmp/Foo
-rw-r--r--  1 torstein  wheel     0B Dec 17 13:12 /tmp/fOO
-rw-r--r--  1 torstein  wheel     0B Dec 17 13:12 /tmp/foo
```

Let's check that they can contain different things as well:

```perl
$ for el in /tmp/{foo,Foo,FoO,fOO}; do echo $RANDOM > $el; done
$ cat /tmp/{foo,Foo,FoO,fOO}
22247
22247
22247
22247
```

Woot?! The same integer in all of them?

Let's check the inodes of the files:

```perl
$ stat -f %i /tmp/{foo,Foo,FoO,fOO}
24362032
24362032
24362032
24362032
```

Argh! It's the same inode. So although macOS shows four files, they're
all pointing to the same storage unit. Good grief.
