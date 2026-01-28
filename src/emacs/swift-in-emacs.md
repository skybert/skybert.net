title: Swift development in Emacs
date: 2026-01-28
category: emacs
tags: emacs, swift, macos

## Install the Swift toolchain

You need to have the Swift toolchain installed. This is typcially
bundled inside of xcode. To find the location of the Swift LSP server,
run the following command:

```text
$ xcrun --find sourcekit-lsp
/Library/Developer/CommandLineTools/usr/bin/sourcekit-lsp
```

## Install Swift mode

Install [swift-mode](https://github.com/swift-emacs/swift-mode) to
make Emacs Swift aware.

## Tell Emacs to use it

To try this out manually, open `.swift` file and invoke:

```text
M-x eglot
```

When asked which LSP server to run, type in the one you found above:

```text
/Library/Developer/CommandLineTools/usr/bin/sourcekit-lsp
```

Emacs, or `sourcekit-lsp` needs a minute (on my machine, this was
_literally_ a minute) to wire up things, eventually, you'll see that
Emacs springs to life again, with inline code hints, auto completion
and other coding goodness.

To make this permant, add the following to your `~/.emacs`:
```lisp
(use-package swift-mode
  :ensure t
  :init
  (add-to-list
   'eglot-server-programs
   '(swift-mode . ("/Library/Developer/CommandLineTools/usr/bin/sourcekit-lsp")))
  )
```


Happy coding!
