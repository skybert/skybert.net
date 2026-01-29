title: Code Folding in Emacs
Date: 2026-01-28
category: emacs
tags: emacs

This week I learned Emacs has code folding built in (of course it
has!). It's called [Hide
Show](https://www.gnu.org/software/emacs/manual/html_node/emacs/Hideshow.html)
and you enable it with `hs-minor-mode` and toggle function, class or
comment folding/unfolding with `hs-cycle`. There's many other commands
to try: `hs-hide-all`, `hd-show-all` and so on.

<img
  class="centered"
  src="/graphics/emacs/2026/emacs-code-folding.png"
  alt="emacs code folding"
/>

The default bindings look pretty wild, like <kbd>C-c</kbd>
<kbd>@</kbd> <kbd>C-s</kbd>, but you know what? For the most part,
I've stopped learning new shortcuts the last ten years or so and just
use <kbd>M-x</kbd> with fuzzy search. Works well enough for me, even
for things I use regularly, like `eglot-rename` and
`delete-trailing-white-space`.

Using [smex](https://github.com/nonsequitur/smex) ensures I always
have the last recently used at the top.

Happy folding!
