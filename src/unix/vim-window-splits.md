title: Window splits in VIM
date: 2026-01-14
category: unix
tags: unix, vim

Recently, I learned how to use window splits and open more files without
exiting vim first, lol, what a n00b!


## Splitting windows
Create a horizontal split:
```perl
:split
```

Or a vertical split:
```perl
:vsplit
```

You can optionally provide a file name to be visible in the split. If
you have the file open in vim (in one of several buffers), you can tab
complete the name:

```perl
:vpslit .vimrc
```


## Moving between splits
Moving between the splits can be done with `C-w <hjkl>`, so
<kbd>Ctrl</kbd> + <kbd>w</kbd> <kbd>l</kbd> to jump to the window
split on the right. On Stack Overflow there were many other
suggestions, but the above works out of the box and you don't have to
move your hands away to use the arrow keys.

Mapping these makes it a lot faster, though:

```perl
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
```
