title: ps
date: 2026-10-12
category: mac-os-x
tags: mac-os-x

After an upgrade recently, I discovered there was a process called
`Siri AI` running. I found this odd, since I've explitly turned off
all AI features in macOS, including Siri.

This prompted me to find out how much CPU and memory has this `Sire
AI` process consumed. I first got the process ID:

```perl
pgrep -lf 'Siri AI' | awk '{print $1}'
```

Then, I read the `ps` man page to find out how I can list explicit
properties of a given process:

```text
$  ps -o pid,%cpu,%mem,etime,rss,command -p <pid>
```

With those two commands in store, I could now combine them to find out
how much this Siri AI process was consuming and how long it had been
running:

```text
$ ps -o pid,%cpu,%mem,etime,rss,command -p $(pgrep -lf 'Siri AI' | awk '{print $1}')
  PID  %CPU %MEM     ELAPSED    RSS COMMAND
38430   0.0  0.4 05-21:13:12 212480 /System/Applications/Siri AI.app/Contents/MacOS/Siri AI
```

