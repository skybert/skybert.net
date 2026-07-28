title: Set macOS timezone from the command line
date: 2026-07-28
category: mac-os-x
tags: mac-os-x, macos, unix

First, list all avaiable time zones:
```
$ sudo systemsetup -listtimezones
```

Find the one you want and then set it:

```text
$ sudo systemsetup -settimezone Europe/Oslo
```

Verify that the system has picked it up:
```text
$ date
Tue Jul 28 10:55:02 CEST 2026
```

Here, you can see the timezone used by `date` is `CEST`, which is
what's beeing used in `Europe/Oslo`.
