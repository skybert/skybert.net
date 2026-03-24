title: Rip an Audio CD from the Command Line
date: 2026-03-24
category: linux
tags: arch, linux, audio

Yes, every now and then, in 2026, I still need to rip an audio CD.

```text
$ sudo pacman -S cdparanoia lame
$ paru -S abcde
$ paru -S cd-discid
$ paru -S aur/python-eyed3
```

Finally, I could rip the CD with:
```text
$ abcde -o mp3 -d /dev/sr0
```


