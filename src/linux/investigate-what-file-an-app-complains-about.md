title: Investigate what file(s) an app opens
date: 2022-10-17
category: linux
tags: linux, strace

Sometimes, it's important to know what files an app opens. Like today,
I had this Maven plugin that checks for known vulnerabilities. It
bailed out after a couple of seconds complaining that a cache file was
corrupt. However, even in the deepest `Caused by` block in the stack
trace, there was no hint of *which* file it hard problems reading:

```text
$ mvn --batch-mode org.owasp:dependency-check-maven:6.0.3:check -Dformats=html,json
..
Caused by: java.lang.IllegalStateException: File corrupted in chunk 1416, expected page length 4..512, got 1117444 [1.4.199/6]
    at org.h2.mvstore.DataUtils.newIllegalStateException (DataUtils.java:883)
    at org.h2.mvstore.MVStore.readBufferForPage (MVStore.java:1055)
    at org.h2.mvstore.MVStore$ChunkIdsCollector.visit (MVStore.java:1606)
    at org.h2.mvstore.Page$1.run (Page.java:282)
    at java.util.concurrent.Executors$RunnableAdapter.call (Executors.java:515)
    at java.util.concurrent.FutureTask.run (FutureTask.java:264)
    at java.util.concurrent.ThreadPoolExecutor.runWorker (ThreadPoolExecutor.java:1128)
    at java.util.concurrent.ThreadPoolExecutor$Worker.run (ThreadPoolExecutor.java:628)
    at java.lang.Thread.run (Thread.java:829)
```

`strace` to the rescue. I first ran it without any filter (`-e <system
call>`):
```text
$ strace -f mvn --batch-mode org.owasp:dependency-check-maven:6.0.3:check -Dformats=html,json
..
```

but quickly discovered that all files opened by the Maven Java process
used `openat` to read files, so I reran it with `-e openat`:

```text
$ content-engine $ strace -f -e openat  mvn --batch-mode org.owasp:dependency-check-maven:6.0.3:check -Dformats=html,json
..
```

The still produced a lot of output. To narrow it down, I made an
educated guess that the cache file in question was in my home
directory. Since `strace` writes its output to standard error, I
redirected standard err to standard out so that I could `grep` the
output:

```
$ strace -f -e openat \
  mvn --batch-mode org.owasp:dependency-check-maven:6.0.3:check -Dformats=html,json 2>&1 | \
  grep $HOME
..
[pid 3175768] openat(AT_FDCWD, "/home/torstein/.m2/repository/org/owasp/dependency-check-data/5.0/odc.mv.db", O_RDWR|O_CREAT, 0666) = 151
..
[pid 3178086] openat(AT_FDCWD, "/home/torstein/.m2/repository/org/owasp/dependency-check-data/5.0/odc.trace.db", O_RDWR|O_CREAT, 0666) = 153
[pid 3178086] openat(AT_FDCWD, "/home/torstein/.m2/repository/org/owasp/dependency-check-data/5.0/odc.trace.db", O_WRONLY|O_CREAT|O_APPEND, 0666) = 153
```

There, I know knew which files it complained about. Nice, eh?
