title: Switching from tmux to opentmux
date: 2026-09-15
category: unix
tags: unix, linux

I've switched to the
[opentmux](https://codeberg.org/opentmux/opentmux) fork of `tmux` on
all my machines. It's early days, so it's not packaged up yet, hence I
build it from source like this:

```text
$ git clone https://codeberg.org/opentmux/opentmux.git
$ meson setup build --wipe -Dutf8proc=enabled
$ compile -C build
$ ./build/tmux
```
