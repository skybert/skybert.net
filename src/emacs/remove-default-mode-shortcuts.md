title: Remove Default Mode Shortcuts
date: 2026-10-14
category: emacs
tags: emacs

Sometimes you find that a mode grabs a shortcut you've already defined
for something else, or that you want to override. This could be `C-c`
shortcuts, which are supposed to be free for the end user to configure
but some mode set anyway, or something else.

Today, I set up an LSP server for my Markdown files and discovered my
code action shortcut `M-RET` didn't work, but instead inserted another
Markdown list item. To remedy this, I did the following to remove it
from the mode keymap in question:

```lisp
(use-package markdown-mode
  :bind (:map markdown-mode-map ("M-RET" . nil)))
```

With that, using LSP servers in Markdown is just as smooth as in other
modes. To remedy an LSP marked problem, I hit `M-RET` and `Tab`
complete the action I want.

Happy writing!


## PS:

If you're not using `use-package`, you can do:

```lisp
(with-eval-after-load 'markdown-mode
  (keymap-unset markdown-mode-map "M-RET" t))
```

