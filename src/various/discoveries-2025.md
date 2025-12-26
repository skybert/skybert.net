title: My Discoveries in 2025
date: 2025-12-23
category: various
tags: various, ai, emacs, go, rego 

## macOS

For the first time since 2000, I'm not using Linux as my main
workstation. Moving to macOS has been an interesting experience and
I've made many tweaks and hacks to make it a comfortable Unix
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
here](https://gitlab.com/skybert/my-little-friends/-/blob/master/aerospace/.aerospace.toml#L1).

I dearly missed a floating, transparent clock, a minimalistic menu
bar (like `i3bar`), the ability to quickly jump to any window using fuzzy search
(like `rofi`), as well as a better resource monitor (`top`). To close these gaps, I wrote the apps myself since I
couldn't find any existing ones that did _exactly_ what I wanted:

- [ybar](https://github.com/skybert/ybar) (Swift)
- [yclock](https://github.com/skybert/yclock) (Swift)
- [yjump](https://github.com/skybert/yjump) (Swift)
- [ytop](https://github.com/skybert/ytop) (Go)

The Swift apps `yjump`, `yclock` and `ybar` were vibe coded (I didn't
care about the code, I just wanted to get apps that did what I wanted
them to), whereas `ytop` was written without any AI assistance.

### yclock
<a href="/graphics/2025/yclock-analogue.png">
  <img
    class="centered"
    src="/graphics/2025/yclock-analogue.png"
    alt="yclock"
    style="width: 40%"
  />
</a>

### ytop
<a href="/graphics/2025/ytop.png">
  <img
    class="centered"
    src="/graphics/2025/ytop.png"
    alt="ytop"
    style="width: 70%"
  />
</a>

### ybar
<a href="/graphics/2025/ybar.png">
  <img
    class="centered"
    src="/graphics/2025/ybar.png"
    alt="ybar"
    style="width: 70%"
  />
</a>

### yjump
<a href="/graphics/2025/yjump.png">
  <img
    class="centered"
    src="/graphics/2025/yjump.png"
    alt="yjump with fuzzy search for windows"
    style="width: 70%"
  />
</a>

## Go

I've learned a new programming language, [Go](https://go.dev/), and
must say I like it! As for learning ressources, I can recommend the book, [Learning
Go](https://www.oreilly.com/library/view/learning-go/9781492077206/).
It was my primary learning resource, in addition to [Effective
Go](https://go.dev/doc/effective_go). For the first couple of months,
I refrained from using AI in any form to assist me as I wanted to
learn Go the hard way as it [makes me better remember what I
learn](https://skybert.net/aifail/dont-fear-the-pointer/).

Naturally, I made a number of enhancements to my Emacs configuation to
make it into a powerful editor for writing Go programs. I have documented
all these steps in [this YouTube
video](https://www.youtube.com/watch?v=p_xX_vX8M7g). The Emacs
configuration changes can be found in my
[.emacs](https://gitlab.com/skybert/my-little-friends/-/blob/master/emacs/.emacs#L882).

Picture from my home office where I spent several weekends getting
into Go:
<img
  class="centered"
  src="https://media.hachyderm.io/media_attachments/files/114/336/289/584/163/488/original/7a7555c831071f33.jpg"
  alt="Reading an excellent Go book and coding in Emacs"
  style="width: 70%"
/>


## Rego

I've learned a new authorization language, Rego from [Open Policy
Agent](https://www.openpolicyagent.org/docs/policy-language#entrypoint)
(OPA).

Emacs/Eglot together with the Regal language server makes for a decent editing environment. It didn't provide an easy way to run tests, so to run Rego tests from Emacs, I wrote [this elisp function](https://gitlab.com/skybert/my-little-friends/-/blob/master/emacs/.emacs#L996).


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
  style="width: 70%"
/>

## AI

AI is being shoved down our throuts whether we want it or not. I've
thought long and hard about how to use AI and what AI assisted coding
(vibing included) does to us. I've written this article about it,
called [Don't fear the
pointer](https://skybert.net/aifail/dont-fear-the-pointer/).

I think [this article on AI in
art](https://theoatmeal.com/comics/ai_art) and [this
graphic](https://hachyderm.io/@VeroniqueB99@mastodon.social/114411941307880367)
sums it up perfectly:

<img
  class="centered"
  src="https://media.hachyderm.io/cache/media_attachments/files/114/411/941/281/223/057/original/6db843dab8c1df4b.png"
  alt="quote about AI ending up doing the interesting things and humans doing the chores"
/>

For the record, I use AI every day: For resarch, to explain code
(e.g. "what does the bit shifting in this `tcpdump` command do?") and
to review code I've just written (e.g. "can this be written more
pythonic?"), and code where I don't care about the details (like tests
and converting between different data formats). For the cases where I
"just want to make it work". I've gotten extensive experience in using
[GitHub Copilot CLI](https://github.com/features/copilot/cli/),
developing three full apps from scratch with it, and using it to fix
failing test cases. I've also have had AI completion configured in my
editor for a couple of years already, it sure is fun in the beginning
(I've turned it off, though).

## Thanks!

And with that, I'm signing off, looking forward to new technological
challenges in 2026. TTFN!





