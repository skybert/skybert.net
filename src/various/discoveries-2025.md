title: My Discoveries in 2025
date: 2025-12-23
category: various
tags: various

## macOS

For the first time since 2000, I'm not using Linux as my main
workstation. Moving to macOS has been an interesting experience and
I've made many tweaks and hacks to make it a more comfortable Unix
environment. Among other things, I've written
[install-unix-env-on-macos.sh](https://gitlab.com/skybert/my-little-friends/-/blob/master/macos/install-unix-env-on-macos.sh#L1)
which configures many macOS features and installs the applications I
cannot live without.

The biggest change coming from Linux, was to find a decent window
manager. The best I have found, is
[Aerospace](https://nikitabobko.github.io/AeroSpace/guide), it's `i3`
like, but still far from it. It's slower and has lots of bugs. Still,
it makes working on macOS bearable. You may check out [my Aerospace
conf
here](https://gitlab.com/skybert/my-little-friends/-/blob/master/aerospace/.aerospace.toml#L1)

I dearly missed a floating, transparent clock, a minimalistic menu bar
(like `ibar`) and a better resource monitor (`top`) than what ships
with macOS. To close these gaps, I've written the folowing apps:

- [yclock](https://github.com/skybert/yclock) (Swift)
- [ybar](https://github.com/skybert/ybar) (Swift)
- [ytop](https://github.com/skybert/ytop) (Go)

The Swift apps `yclock` and `ybar` were vibe coded, whereas `ytop` was
written without any AI help.
<img
  class="centered"
  src="https://github.com/skybert/yclock/blob/main/doc/yclock-analogue.png"
  alt="yclock"
/>

<img
  class="centered"
  src="https://raw.githubusercontent.com/skybert/ytop/main/doc/screenshot-macos.png"
  alt="ytop"
  style="width: 100%"
/>

<img
  class="centered"
  src="https://github.com/skybert/ybar/blob/main/doc/screenshot.png"
  alt="ybar"
  style="width: 100%"
/>

## Go

I've learned a new programming language, [Go](https://go.dev/), and
must say I like it!

Consequently, I made a number of enhancements to my Emacs
configuation, which I have documented in [this YouTube
video](https://www.youtube.com/watch?v=p_xX_vX8M7g). The Emacs
configuration changes can be found in my
[.emacs](https://gitlab.com/skybert/my-little-friends/-/blob/master/emacs/.emacs#L882)

Picture from my home office where I spent several weekends getting
into Go:
<img
  class="centered"
  src="https://media.hachyderm.io/media_attachments/files/114/336/289/584/163/488/original/7a7555c831071f33.jpg"
  alt="Reading an excellent Go book and coding in Emacs"
/>

I can recommend the book I read, [Learning
Go](https://www.oreilly.com/library/view/learning-go/9781492077206/),
it was my primary learning resource, in addition to [Effective
Go](https://go.dev/doc/effective_go).

## Rego

I've learned a new authorization language, Rego from [Open Policy
Agent](https://www.openpolicyagent.org/docs/policy-language#entrypoint)
(OPA).

For running tests from Emacs, I wrote [the elisp function
tkj/opa-test-current-file](https://gitlab.com/skybert/my-little-friends/-/blob/master/emacs/.emacs#L996)


## Garuda Linux

Arch Linux is my preferred desktop OS, and Debian is the distro I
reach for when installing servers. Still, I cannot but _love_ Garuda
Linux and enjoy [taking it for a
spin](https://hachyderm.io/@skybert/114585497320204119) every now and
then:

<img
  class="centered"
  src="https://media.hachyderm.io/media_attachments/files/114/585/492/343/416/200/original/bb3cc161811991de.png"
  alt="Garuda Linux"
  style="width: 100%"
/>



