title: Emacs on macOS
date: 2026-01-28
category: emacs
tags: emacs, macos

The best Emacs distribution I've found for macOS, is
[emacs-plus](https://github.com/d12frosted/homebrew-emacs-plus).

# Install Emacs Plus

```text
$ brew tap d12frosted/emacs-plus
$ brew install emacs-plus@31 --with-imagemagick
```

# Upgrading Emacs Plus

There's no real upgrade of emacs with brew, so uninstall it first to
ensure the upgrade goes at intended:

```
$ brew uninstall emacs-plus@31
$ brew install emacs-plus@31 --with-imagemagick
```
