title: Lightning Fast Scrolling in X
date: 2025-10-15
category: linux
tags: linux, x, i3

Ever wanted your Emacs or `less` pager to move faster down a huge
file, keep pressing the down arrow just doesn't go fast enough? There
is a actually an easy way to make the cursor go as fast as you want.

To get fast scrolling in all apps under X.org, you can use the `xset r
rate <n> <m>` command, for example:

```perl
$ xset r rate 200 60
```

The first number is the delay before repeating of the current key
press starts

The second number is how many repeated key presses will be sent per
second.

You can set it in the script that starts up your window manager or
desktop environment,
e.g. [.xsession](https://gitlab.com/skybert/my-little-friends/-/blob/master/x/.xsession#L44)
or
[.config/i3/config](https://gitlab.com/skybert/my-little-friends/-/blob/master/i3/config#L218).

Happy scrolling!


