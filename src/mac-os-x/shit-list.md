date:    2012-10-07
category: mac-os-x
title: My Mac OS X Shit List

## Foreword

I'm no Mac guru, it could be that I've missed something really obvious
somewhere, but these are nevertheless some issues that I find hugely
annoying and keep me from using my Mac OS X more than absolutely
necessary. 

This article was written in 2012, hopefully some things have been
remedied when you read this in
<script>document.writeln(new Date().getFullYear());</script>

## Updates Are Done On a Per Application Basis

Every piece of software installed have their own update
notifications when a newer version of that piece is
available. This is first of all hugely annyoing and
ineffecient.


Added to that, I've missed out on important software updates
because I hadn't used that application in a while
(Skype). When I one day needed it, I assumed that I had the
latest version and was taken by a bad surprise when I needed
it (Video conferencing with multiple users). Since the meeting
had to start precise, I had to do without the video feature.

## Symlinks are not exposed as full worthy directories

It's a <strong>HUGELY</strong> pain in the butt that symlinked
directories don't show up in the various application's open
file dialogues. I cannot believe this can be! It's amazingly
stupid, in order to access files on symlinked location, I
must, well, not use the symlink at all.

## The Window Maximize Event is Faulty

Using a 3rd party program, I've managed to get a shortcut for
maximizing the current window. However, the un-maximize event
doesn't work on all windows (e.g. the Terminal and GNU Emacs),
which is rather annoying.


From what I can understand, Mac OS X does not have the concept
of maximizing a window, only a document. This leads to funny
behaviour like this. As a user, I cannot understand how
difficult it can be to introduce this concept if Mac doesn't
already have it, but what do I know :-)

## No fast way to switch between keyboard layouts 

I have not found a way to fast switch between different
keyboard layouts. I use three layouts every day: American for
programming and Norwegian &amp; German for writing colleagues,
partners and customers. Hence, I constantly find myself
switching back and forth. On Linux, it is a doodle to get this
working, but on Mac, I have so far settled with:


- Stop typing (of course)
- Move my right hand to the mouse.
- Click once to select the layout menu
- Click again to select the other layout.

Being able to have a self defined shortcut, that is easily hit
without moving the hands off the main part of keyboard has a
lot to say for my daily operation speed and I wish there is an
easy way to do this on Mac, without writing my own program.

## Impossible to Remove the Window Decoration

When I'm working in one application for a long time, I
normally turn off the window decoration (including the window
title) to get more space on the screen for the important
thing, namely the window contents.


However, this doesn't seem to be easily done with Mac OS, but
if you know of a solution, please give me a shout! What I want
is one shortcut which allows me to toggle the window
decoration of the current window.

## Hard to re-map the keyboard into sanity

Re-mapping is probably possible, but it's not as straight
forward as all other Unixes makes it.

## Doesn't follow the file hierarchy standard

Another hugely annoying thing for someone used to other Unixes and
Unix like operation systems.

It's equally annoying since Mac OS X claims to be a modern
Unix, and is in some respects, a very old and silly
incarnation of it.

- `/Volumes` not `/mnt` or `/media`
- `/Users` not `/home`

It's close to impossible to change this as well. `/home` is on Mac,
unlike any other Unix on the planet I've used, not the default home
area for users, but a special area for users that log in using SSH.

I found it close to impossible to change this behaviour so that my
user had its `$HOME` under `/home`.

## Spaces

When Mac got this "revolutionary" technology that Unix and
Linux has had since the break of dawn, it looks very nice at
first sight. However, one thing that came to annoy me, and is
still a big problem, is that I have to choose between three
pre-set keyboard shortcut combination to cycle between them.


All of these three combinations are useful for other
applications and I therefore have to alter the behaviour of
several of my favourite applications in order to use the
shortcuts to change workspace. This is just one more thing
making it impossible for me to work fast (as fast as I am used
to on Linux) in Mac OS X.

## Terminal
### Double/tripple clicking doesn't consider the terminal contents

After using <a
href="http://software.schmorp.de/pkg/rxvt-unicode.html">urxvt</a> for
years, I've gotten rather spoiled with its grandour. One such detail,
is the click intelligence. It always does what I want: double clicking
on a URI in the terminal should select it. However. Terminal just
highlight the entire line, even thoug there is no text on the entire
line.

Hence, Terminal doesn't consider the actual contents of the
window when applying click events to it.

## Ports is Bad

Before getting a Mac, I constantly heard people saying that
Mac had the belove feature we're used to from the Linux and
BSD world: a command line tool wich allows for easy install,
upgrade and removal of software and their dependencies.


However, after using `ports` for a bit I must say it's ... perhaps ok
if you're used to REHL, but if you're used to something like Debian's
`apt-get` and `.deb` architecture, it's just slow, stupid and utterly
limiting.


And now I didn't mentioned all the loop holes you need to go
through in order to install ports (because it's no way near
standard software on the Mac).

## Network Status Incosinstency

The nice GUI network utility can get quite confused, without
trying too hard (I just wanted to set up VPN, which only
worked for certain types of VPN), I ended up with this
inconsistency:

<a href="/graphics/2012/mac_osx_inconsistency_between_preferences_and_ifconfig.png">
  <img src="/graphics/2012/mac_osx_inconsistency_between_preferences_and_ifconfig.png"
    alt="Notice the IP of the primary network interface. It's different!"
    width="1024"
    class="centered"
  />
</a>

Notice the IP of the wireless network interface, ```eth1```, it's
different!

## Final Words

If you have solution to any of the above issues, please give a
shout, I'll love to get these things working.

