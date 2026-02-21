date: 2014-11-22
title: Discoveries

## 2024

### Python

<img
  class="centered"
  src="/graphics/2024/py-spy-flame.png"
  alt="py spy flame graph"
/>

You can investigate the performance of your Python app by using an
external, standalone command line tool called
[py-spy](https://github.com/benfred/py-spy?). You don't need to
instrument your Python code and you don't need to attach via
[gdb](https://wiki.python.org/moin/DebuggingWithGdb).

`py-spy` also gives you a
[top](https://man7.org/linux/man-pages/man1/top.1.html) like live view
of your Python application. Totally awesome!

<img
  class="centered"
  src="/graphics/2024/py-spy-top-like.png"
  alt="py top like view"
/>


### Unix

<img
  src="/graphics/2024/unix-magic.jpg"
  alt="unix wizard poster"
/>

The classic Unix Magic posters [can be download in _full_ quality from
archive.org](https://archive.org/details/unix-magic/Unix%20Views.jpg?).

[Cool, but obscure unix
tools](https://kkovacs.eu/cool-but-obscure-unix-tools/?) 


Simlarly, there's also [Cool, but obscure X11
tools](http://cyber.dabamos.de/unix/x11/?) for us who still enjoy the
likes of
[xeyes](https://www.commandlinux.com/man-page/man1/xeyes.1.html)

### Fun

I used to *love* the User Friendly comic. All the comic strips are now
[downloadable from
archive.org](https://archive.org/details/user-friendly-comic?),
allowing new readers to enjoy and old timers relive those happy days.

### Coding

This is an excellent, old article that has gotten a wee touch up: [Why
Bloat Is Still Software’s Biggest
Vulnerability](https://spectrum.ieee.org/lean-software-development?)


## 2023

### Security
A simple to use, GUI based penetration tool that's actually useful:
[Zaproxy](https://www.zaproxy.org/)

## 2017

### Code

An impressive walk through
of
[what happens when you type 'google.com'` into your browser](https://github.com/alex/what-happens-when/blob/master/README.rst).
This article covers so many things, touching upon most things you're
likely to work with as a programmer - and a good few more too!. A
highly recommended read.

An enjoyable walk down memory lane with the grand master Eric
S. Raymond
himself:
[Things Every Hacker Once Knew](http://www.catb.org/esr/faqs/things-every-hacker-once-knew/).

The famous spelling mistake in the HTTP/1.0 specification, `Referer`
instead of `Referrer` is blamed on the UNIX spell checker not having
neither of them in its dictionary at the time they wrote the
RFC. Check out this [nugget from 1995](https://lists.w3.org/Archives/Public/ietf-http-wg-old/1995JanApr/0107.html).


[Software Engineering Radio](http://www.se-radio.net/)

[Open Source License Business Perception Report](https://writing.kemitchell.com/2017/03/29/OSS-Business-Perception-Report.html)

### Linux & Unix

High quality vim screencasts are available free of charge
at [vimcasts.org/](http://vimcasts.org)

[Top 25 Nginx Web Server Best Security Practices](https://www.cyberciti.biz/tips/linux-unix-bsd-nginx-webserver-security.html) not
only gives you many good hints on tightening the security of nginx
itself but also the machine itself on which it runs.

[What is virtual memory? – Gary explains](http://www.androidauthority.com/what-is-virtual-memory-gary-explains-747960/)

I love when highly skilled engineers can explain something as
advanced as SELinux in an easy understandable way: [SELinux Concepts - but for humans](https://learntemail.sam.today/blog/selinux-concepts-but-for-humans/)

[Do we really need swap on modern systems?](https://www.redhat.com/en/about/blog/do-we-really-need-swap-modern-systems)

[A tcpdump Tutorial and Primer with Examples](https://danielmiessler.com/study/tcpdump/)

Man, I wish I knew about this before, it would save me pulling out
network cables and dongles to get the base system up and running
before installing the wireless card's
firmware:
[Unofficial Debian CD images which includes firmware](http://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/)

Servers can run out of entropy (randomness needed to complete various
tasks such as JAR signing, SSL connections), one way to mitigate this
is to install `haveged`:
http://www.issihosts.com/haveged/downloads.html


#### There's a `timeout` command

In
[GNU coreutils](https://www.gnu.org/software/coreutils/manual/coreutils.html#timeout-invocation),
which means it's installed on virtually all Linux machines, that lets
you specify a maximum time for a command to complete, or else the
command is `kill`ed.

```
$ timeout --signal KILL 10s create-backup
```

This will send the KILL signal (same as `kill -9 <pid>`) to the
process running `create-backup` if it hasn't completed within 10
seconds. 

The signal to send to the process can be any of the ones listed by
`kill -l`.

#### Containers
Docker provides a great developer experience but it leaves many things
to be decided when it comes to taking it into production:
https://www.federacy.com/docker_image_vulnerabilities
https://www.certdepot.net/death-of-docker/

Really interesting to see what's moving in the container world. RedHat
is really shaking things up in the Docker world:
https://www.youtube.com/watch?v=2v-vTH71nSc

https://thehftguy.com/2017/02/23/docker-in-production-an-update/

https://consolia-comic.com/comics/containers-and-docker

Interesting read on containers and challenges of sharing a kernel in
spite of namespace & cgroups:
https://sysdig.com/blog/container-isolation-gone-wrong/

#### Reverse proxies 

Finally got around to upgrade from Varnish 3 to 4. The folks at
Varnish Software have been so nice to provide an upgrade guide which,
albeit not a complete guide, is a good starting point:
https://varnish-cache.org/docs/4.0/whats-new/upgrading.html

https://www.fastly.com/blog/varnish-tip-normalize-host-header
https://www.fastly.com/blog/ab-testing-edge

nginx can do TCP load balancing now, making it an alternative to
HAProxy in my setup:
https://serversforhackers.com/tcp-load-balancing-with-nginx-ssl-pass-thru


#### Fluxbox as a tiling window manager, 2017-07-07
[Fluxbox](http://fluxbox.org) can re-arrange/tile all windows on the
current desktop with the command `ArrangeWindows`. There are also
similar commands like `ArrangeWindowsStackLeft` which lets the focused
window occupy the left half of the screen, while Fluxbox stacks the
others on the right. Now, there's nothing in the tiling window
managers that appeal to me, Fluxbox has these features covered too!

I bound this command to <kbd>Ctrl</kbd> + <kbd>Shift</kbd> +
<kbd>s</kbd> in `~/.fluxbox/keys:
```
Control Shift s :ArrangeWindowsStackRight
```

In the process of learning this,, I was reminded that nothing beats RTFM 🦐

### Windows
An interesting extension to Cygwin: [Babun](http://babun.github.io/)

### JS

[Locally test your npm modules without publishing them to npmjs.org](http://podefr.tumblr.com/post/30488475488/locally-test-your-npm-modules-without-publishing)

### People

[10 Fun Activities to Engage Your Dispersed Team](https://developers.redhat.com/blog/2017/04/07/working-with-a-dispersed-team-part-5-of-7/)


### Fun
This text based space game is awesomely cool! [https://www.youtube.com/watch?v=XKPJs5t9ekI](https://www.youtube.com/watch?v=XKPJs5t9ekI)


http://patorjk.com/software/taag/

I love
this
[Emoji cheat sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet/),
it's the `:word:` style strings that produce cute emojis in clients
like Slack, Signal and Github.

---

## 2016
### Linux & Unix
https://www.youtube.com/watch?v=tc4ROCJYbm0
https://www.cyberciti.biz/faq/how-to-speed-up-apt-get-apt-command-ubuntu-linux/
https://www.youtube.com/watch?v=o5cASgBEXWY
https://thehftguy.com/2016/11/01/docker-in-production-an-history-of-failure/

Excellent live coding video spelling out in big letters what
containers really are (tarballs). They're *not* the same thing a s
virtual macines 😉
https://www.youtube.com/watch?v=gMpldbcMHuI

### Life
http://nymag.com/selectall/2016/09/andrew-sullivan-technology-almost-killed-me.html

### JS
https://snyk.io/

This article made me laugh out loud, making everyone in the metro car
think I was nuts 😉:
https://hackernoon.com/how-it-feels-to-learn-javascript-in-2016-d3a717dd577f

---

### 2016-12-09

[The qemu advent calendar](http://www.qemu-advent-calendar.org/2016/)
is a wonderfully geeky advent calendar, showing off geeky OSes for you
to explore.

### 2016-11-28

Great site for browsing  [emojis](http://www.iemoji.com/view/emoji/),
complete with Unicode references. Good fun.

Nice [CSS reference](http://cssreference.io/).

### 2016-11-25
Web based diagram sketching tool: [https://sketchboard.me](sketchboard.me)

### 2016-10-25

If I asked by a colleague for good BASH resources. There's so much out
there, but most of it are one liners, not really guidance on
programming in the BASH language.

Here, I'll list some of the BASH resources I would recommend that goes
beyond the one liner style:

- [Use the Unofficial Bash Strict Mode (Unless You Looove Debugging)](http://redsymbol.net/articles/unofficial-bash-strict-mode/)
- [Unix shell programming notes](http://cfajohnson.com/shell/) by Chris F. A. Johnson

### 2016-10-11

Status of HA stack in Jessie:
[ral-arturo.org/2016/10/06/debian-jessie-ha.html](http://ral-arturo.org/2016/10/06/debian-jessie-ha.html)


Pearls of wisdom: DB failures: 
[bytebot/lessons-from-database-failures](http://www.slideshare.net/bytebot/lessons-from-database-failures-65650946)

[percona.com/blog/2008/04/28/mysql-replication-vs-drbd-battles/](https://www.percona.com/blog/2008/04/28/mysql-replication-vs-drbd-battles/)

### Expand/collapse in Emacs/markdown files
Why am I surprised, this is logical! To expand and collaps Markdown
sections/headings in Emacs, just push the <kbd>Tab</kbd> key. I've
been wanting this for so long, why didn't I just try to see if
<kbd>Tab</kbd> worked? Duh!

### 2016-10-10
[developers.googleblog.com/2016/10/an-open-source-font-system-for-everyone.html](https://developers.googleblog.com/2016/10/an-open-source-font-system-for-everyone.html)

### 2016-10-09
[hackernoon.com/how-it-feels-to-learn-javascript-in-2016-d3a717dd577f](https://hackernoon.com/how-it-feels-to-learn-javascript-in-2016-d3a717dd577f)

### 2016-10-06
[github.com/jmechner/Prince-of-Persia-Apple-II ](https://github.com/jmechner/Prince-of-Persia-Apple-II )

[speakerdeck.com/stevvooe/heart-of-the-swarmkit-object-model](https://speakerdeck.com/stevvooe/heart-of-the-swarmkit-object-model)

rkt, a better way to run containers (than Docker's runC):
[coreos.com/rkt/docs/latest/rkt-vs-other-projects](https://coreos.com/rkt/docs/latest/rkt-vs-other-projects.html)


### 2016-09-03
https://dzone.com/articles/9-things-in-jdk-9-that-arent-jigsaw

## 2015

### Linux & Unix
https://www.rileybrandt.com/2015/10/15/foss-photo-flow-2015/

### Network
https://www.youtube.com/watch?v=C8orjQLacTo

### Database
https://mathiasbynens.be/notes/mysql-utf8mb4

### Games
http://grumpygamer.com/monkey25

### Various
https://backchannel.com/why-i-m-saying-goodbye-to-apple-google-and-microsoft-78af12071bd
http://www.gq.com/story/president-obama-bill-simmons-interview-gq-men-of-the-year

### Language
https://www.babbel.com/en/magazine/139-norse-words

### 2015-12-14

### Open files faster in Emacs (and prettier)

As all Emacs users know, the shortcut <kbd>Ctrl</kbd> + <kbd>x</kbd>
<kbd>Ctrl</kbd> + <kbd>f</kbd> opens a file. It's pretty neat with
lots of shortcuts and <kbd>Tab</kbd> completion.

<img class="centered" src="/graphics/2015/find-file.png" alt="find-file"/>

Today, I found a great improvement up `find-file`, namely
`ido-find-file`. Lots of people rave about `helm-find-file`, but it
doesn't allow me to <kbd>Tab</kbd> complete may way down the directory
tree and that just drives me nuts! `ido-find-file` on the other hand,
works pretty much as the traditional `find-file`, but enhances it by
fuzzy matching, vertical menu (thanks to `ido-vertical-mode`) and
different colour coding of files directories and:

<img class="centered" src="/graphics/2015/find-file.png" alt="ido-find-file"/>

### Navigate to a function in your Python, C, Java, Elisp file

There are lots of great special purpose extensions for your favourite
language in Emacs (e.g. I use `emacs-eclim` for Java), but there's a
small gem called `imenu` which gives you a lot of this for free
without any setup of any can. 

It scans the source code in your buffer and provides these in a
menu. Combining this with a completion like `helm-imenu`, you have a
really neat simple code navigation for any source file you open. No
setup required.

For the time being, I prefer using vanilla `imenu` together with
`ido-ubiquitous` and `ido-vertical-mode` over `helm-imenu` as ido
gives a faster experience and it doesn't alter my UI too much. Try it
out!

<img class="centered" src="/graphics/2015/imenu-java.png" alt="imenu"/>

## An turbo charged buffer list

I'm experimenting using `helm-mini` instead of the standard
`list-buffers` command for listing the buffers open in Emacs. The
advantage of `helm-mini` over the default option is apart from pretty
colours, fuzzy regexp matching of buffers. For instead, here I filter
the open buffers to only show anything related to shell scripts:

<img class="centered" src="/graphics/2015/helm-mini.png" alt="helm-mini"/>

### 2015-10-29
#### Firefox
##### Navigate to the previous tab

Just like <kbd>Alt</kbd> + <kbd>Tab</kbd> on your desktop, just use
<kbd>Ctrl</kbd>+ <kbd>Tab</kbd> to navigate to the previous tab you
were at.

Except that it doesn't work the way you expect it to. It only cycles
between the tabs.

Enter the "Firefox registry" by writing `about:config` in the address
bar. Then navigate to this key and set it to `true`:
```
browser.ctrlTab.previews
```


##### Quckly find any tab

<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>e</kbd>

And type something matching that tab's title.

### 2015-10-13

Adobe has a really nice font called Source Code Pro, to start Emacs
with this found, you can do:

    emacs -fn 'Source Code Pro:pixelsize=14' &

### 2015-10-08

[Meteor](https://www.meteor.com) a JS framework with persistent
storage and automatic syncing of all clients' and server's
storage. From never having heard about it, to having a working multi
user chat system up and running, it took 30 minutes.

Package repository of Meteor modules:
[AtmosphereJS](https://atmospherejs.com/)

### 2015-10-06

A hidden gem in the <a href="http://fluxbox.org">Fluxbox</a> window
manager is the client menu which gives you a list of all the open
windows on all workspaces. I've bound it to `Ctrl + Shift + y` like
this in my `~/.fluxbox/keys`:

    Control Shift y         :ClientMenu

Finding it was indeed a great discovery and I've happily used it for a
couple of years now. This week, I discovered something equally useful:
You can navigate the client menu (window list) by simply typing the
first letters of its title.

<img src="/graphics/2015/fluxbox-client-menu.png"
     alt="client menu"/>

Here, I've types "emacs" to navigate to the Emacs window.

### 2015-09-11

Discovered that the more I read about character sets and character
encodings, the more I know that I don't know. Nevertheless, I've
learned a **LOT** while preparing for my
[JavaZone](http://javazone.no) talk:

<iframe src="https://player.vimeo.com/video/138873442" width="500"
 height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen
 allowfullscreen>
</iframe>


### 2015-08-25

MySQL's `utf8` encoding type on columns and tables isn't proper UTF-8,
it only supports up to 3 byte characters, not 4 bytes as UTF-8 can grow
to.

To be able to insert the whole spectre of Unicode that UTF-8 supports,
you must set up your MySQL database to use the encoding type called
`utf8mb4`.

A good article [on the topic can be found here](
https://mathiasbynens.be/notes/mysql-utf8mb4)

### 2015-06-24

[Shutter](http://shutter-project.org/preview/screenshots/) is an
excellent tool for creating screenshots on the Linux desktop. For
years, I've used my own made command based on imagemagick, but I've
lately started to use Shutter more and more as it simply has more
features. 

### 2015-03-15

Running `occur` in [Emacs](http://gnu.org/software/emacs) gives you
nice listing of all lines in the current file with an occurances of
your search query. Here, I search for all lines containing
```db.get```:

<img
  src="../../graphics/2015/emacs-occur.png"
  alt="emacs occur"
/>

The hits are both clickable and iteratable with the standard
```next-error``` mechansim (by default bound to ``` C-` ```).

### 2015-03-05

This excellent article at W3C explains [how to center things on a web
page (including images) using the standards](http://www.w3.org/Style/Examples/007/center.en.html#block),
i.e. by **not** using ```<center/>```.

### 2015-02-02

You cannot create files directories on Windows starting with a dot and
no suffix. Try this: create a directory in Windows Explorer
called ".ssh".

Windows will not only fail to do this, but ask you to enter a file
name as if you hadn't written anything at all.

Apparantly this is
[something inherited from the days of old](http://superuser.com/questions/64471/create-rename-a-file-folder-that-begins-with-a-dot-in-windows#comment66479_64471),
i.e. Windows' DOS heritage.

### 2015-01-20

Ugly looking capitalised  music, pictures, documents directories
begone! I prefer to have all my directories and files lower case. It's
easier on my eyes and it reads faster. Thus, I've hated how GNOME and
others enforced a pile of directories with names like "Documents" and
"Music" on me. Deleting them was no good as some kept coming back and
my actual music and document directories didn't get the icon
decoration that their capitalised counterparts got.

As you can understand, I was thrilled when I discovered today that
sanity was a mere text edit away (I thought so!):

    $ vim ~/.config/user-dirs.dir

And then set these to my preferred directories:
```
XDG_DESKTOP_DIR="$HOME/"
XDG_DOWNLOAD_DIR="$HOME/tmp"
XDG_TEMPLATES_DIR="$HOME/tmp"
XDG_PUBLICSHARE_DIR="$HOME/tmp"
XDG_DOCUMENTS_DIR="$HOME/doc"
XDG_MUSIC_DIR="$HOME/music"
XDG_PICTURES_DIR="$HOME/pictures"
XDG_VIDEOS_DIR="$HOME/videos"
```

Logging out and in again in GNOME gave immediate success. The file
manager even had my "pictures" and "music" and "tmp" directories
nicely decorated with meta icons.

### 2015-01-12

[puppet-lint](http://puppet-lint.com/) will not only spot errors and
deviations from Puppet Lab's best practices, it will also fix many of
these issues for you:

``` $ puppet-lint --fix init.pp ```

---

## 2014
### 2014-12-23

When using [GNU sed](https://www.gnu.org/software/sed), you can use
much more powerful regular expressions by passing the
```--regexp-extended``` switch to ```sed```.

Passing ```--regexp-extended```, or just ```-r```, also makes some of
the syntax easier as you don't have to escape group parenthesis and I
find ```sed``` overall becomes more predictable using this switch.


### 2014-12-22

<div>
  <a href="http://de.wikipedia.org/wiki/Markdown">
  <img
    src="http://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Markdown-mark.svg/208px-Markdown-mark.svg.png"
         style="height: 200px;"
         alt="markdown"
     />
   </a>
</div>

It's easy writing presentation slides using Markdown and generate
these into beautiful HTML5 slides with CSS3 transitions from
[reval.js](https://github.com/hakimel/reveal.js/)  by using
[pandoc](http://johnmacfarlane.net/pandoc/demo/example9/producing-slide-shows-with-pandoc.html)

Previously, I've been using an exporter to Emacs org, but ```pandoc```
is so much more stable and flexible.

### 2014-12-18

[PlantUML](https://yar.fruct.org/projects/plantuml-deb) is a great
command for generating diagrams from plain text files. It also sports
a Confluence plugin - among other things.

### 2014-12-12

This presenter at [Computerphile](http://youtube.com/user/Computerphile),
he's absolutely brilliant. It's rare to find someone so technical in
computer science being so good at presenting.

<iframe width="560" height="315" src="//www.youtube.com/embed/MijmeoH9LT4" frameborder="0" allowfullscreen></iframe>
### 2014-11-26

[Flask](https://github.com/mitsuhiko/flask): Impressed with what I've
read and tried out so far. In less than 20 lines of code, I've a
standalone micro service Python application which routes different
HTTP URLs to internal methods, reads user input and outputs JSON
objects.

From the (first hour) look at it, it seems that Flask strikes just the
right balance between simplicity and bare bones Python on the one hand
and support for real world world features like security, complex
objects, templating, database integration, application types, error
handling, logging and easy deployment on the other.

<div>
  <a href="http://flask.pocoo.org">
    <img src="http://flask.pocoo.org/static/logo/flask.png"
         style="height: 200px;"
         alt="flask"
    />
  </a>
</div>
### 2014-11-22

I've read about these
[free HTML grids before,](http://www.smashingmagazine.com/2013/08/07/type-grids-free-template/)
but I didn't check them out to see how simple and beautiful they were
before now.

<div>
  <a href="http://www.smashingmagazine.com/2013/08/07/type-grids-free-template/">
    <img
      src="http://media.mediatemple.netdna-cdn.com/wp-content/uploads/2013/08/typeandgrids_05.png"
      alt="html grids"
      style="height: 200px;"
    />
  </a>
</div>

### 2014-11-12
Excellent geeky comic strips: [commitstrip](http://www.commitstrip.com/)

<div>
  <a href="http://www.commitstrip.com/">
    <img
      src="http://www.commitstrip.com/wp-content/uploads/2014/11/Strip-Départ-Adrien-650-finalenglish1.jpg"
      alt="commit strip comic"
      style="height: 200px;"
    />
  </a>
</div>

### 2014-11-10
[Idle highlight](http://www.emacswiki.org/cgi-bin/wiki/IdleHighlight)
mode gives you IDEA/Eclipse-like highlighting of other uses of the
variable/method under your cursor. It only triggers after a slight
delay, which is excellent.

<div>
  <img src="http://i.imgur.com/YJs5WeZ.png"
       alt="idle highlight"
       style="height: 200px;"
  />
</div>

### Politics
http://www.economist.com/news/leaders/21608752-any-ceasefire-will-be-temporary-unless-israel-starts-negotiating-seriously

---


## 2013

[Scaling communication: email vs shared documents](http://blog.vivekhaldar.com/post/40018875700/scaling-communication-email-vs-shared-documents) by Vivek Haldar.

---

## 2010

### Code
http://nvie.com/posts/a-successful-git-branching-model/

---

## 2008

### Coding

[Steve Yegge](http://steve-yegge.blogspot.com) is as always dead
on. This post explains why every coder worth his or her salt should
learn to
type:
[Programming's Dirtiest Little Secret](http://steve-yegge.blogspot.com/2008/09/programmings-dirtiest-little-secret.html)


