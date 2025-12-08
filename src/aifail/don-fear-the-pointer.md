title: Don't Fear the Pointer
date: 2025-12-05
category: aifail
tags: aifail, go, ai, llm

I'm currently developing my own
[top](https://www.man7.org/linux/man-pages/man1/top.1.html) like
resource monitor. I'm doing this because I'm currently working on
macOS, and I don't like the macOS `top`. I've tried out both `htop`
and `btop` and they're great. However, they're not what I want, so I
set out to write my own top like app in [Go](https://go.dev/) so that
I can use it on Linux too.

The first version of my resource monitory, I called it
[ytop](https://github.com/skybert/ytop) since the `y` was available, was coded
in Emacs without an AI assistant, like Copilot. However, I *did* use
Copilot in a browser window to get code snippets for things like
"create a table using this TUI framework" and so on. Using Copilot as
my co-consultant, sped up my development for sure and within a few
days (well, hours, you see, parents don't really have much more than
one hour after the kid has gone to bed and you're done with your
chores), I had a working implementation. Happy times!

Now, I decided to rewrite the whole thing, learning from my past
mistakes, getting the structure right and last, but not least, not use
AI for any purpose, not even research. My tools were just the editor,
auto completion with [gopls](https://go.dev/gopls/) and the [Bubbletea
TUI library documention](https://github.com/charmbracelet/bubbletea).

After an hour or two, I had rewritten the whole thing, this time
structuring the app far better, writing the code the way I think is
the clearest and most maintainable. With this, I know exectly what's
happening everywhere in the code, I can quickly fix it and extend it
with new features.

There was just this one problem. It didn't work. The process table
came up, the headlines were all correct, but there was no processes
listed. I went through each line of my app and didn't find anything
wrong. I compared with my previous implementation and couldn't work
out what it was. I then changed my re-implementation to, block by
block, be that of the original verison of the app. Still no
success. Until there were only five lines of difference. And then I
saw it. The problem was:

```go
func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	switch msg := msg.(type) {
..
	case refreshMsg:
		m.updateTable([]pkg.Process(msg))
		return m, refreshCmd()
..
}

func (m model) updateTable(processe []Process) {
   rows := ...
   m.table.SetRows(rows)
..
}
```

Did you spot the error? I surely didn't. I looked at this code (100
times more lines than the above, but still) many, many, _many_ times.

The problem, of course, was that I'd forgotten that these kind of
functions in Go, called [value
receivers](https://go.dev/tour/methods/8), don't let you modify the
object (yes, I know it's called a struct, old words die hard) that
you're "on", `m` in this case. Value receivers are by far the most
common "receiver" functions, but if you need to alter the state of the
`m` struct here, you must use a [pointer
receiver](https://go.dev/tour/methods/8):

```go
func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	switch msg := msg.(type) {
..
	case refreshMsg:
		m.updateTable([]pkg.Process(msg))
		return m, refreshCmd()
..
}

func (m *model) updateTable(processe []Process) {
   rows := ...
   m.table.SetRows(rows)
..
}
```

With that one, ONE, character change, my code now worked. `ytop`
displayed processe in all their glory.

When I realised the error, I remembered all of a sudden that I had
encountered this before. During the coding of my first implementation
of `ytop`. The thing was, back then, I quickly copied all errors or
problems into my Copilot chat window and got ready answers back on how
to fix them. For this very problem, I had just copied and pasted my
entire Go program into the chat and asked: "No processes are showing
up, fix it" (I didn't add "please" since that'll consume more energy
on the AI machine).

<a href="/graphics/2025/ytop-with-copilot.png">
  <img
    class="centered"
    src="/graphics/2025/ytop-with-copilot.png"
    style="width: 1024px"
    alt="Emacs and Copilot in a web browser"
  />
</a>

After two seconds, Copilot fixed it while dilligently explaning what
was wrong and how it solved the problem.

The thing was, since I didn't go through the 2-3 day (that's, 2-3
hours 21:30 in the evening for tired parents) pain of debugging, I
didn't really learn from it. I didn't feel the pain, so I didn't learn
from my mystake. When I one week later encountered the same problem, I
had nothing to counter it with.

My takeway from all of this, is that using AI tools takes away some
things from you as a developer. First off, is the the pure joy of
programming and solving problems on your own. Yes, I've heard "AI is
just another abstraction layer" and "AI is just another tool"
arguments. I do follow the line of reasoning, but I don't quite accept
them. If we instead of "artificial intelligence" called it "guessing
machine" we would all be in a more sound placce to discuss this new
and arguably exciting technology.

Anyways, AI takes away another thing from coders that's just as bad as
the joy of coding itself, and this is my main point in this article:
*AI makes you sloppy*. I could've chosen many words, but I think
"sloppy" fits the bill perfectly. You don't become a worse
programmer. You can still buckle up and get back into it. But you
become lazy. Sloppy.

So am I not using AI then? No, not at all. I will not stop using AI
tools, but for apps that I care about, that I am to _maintain_ with a
high level of effectiveness and quality, I will do the coding
myself. I will use AI for resarch (always cross checking with actual
references. AI regularly dreams up code that calls APIs that don't
exist) and brain storming. I'll let it create PoCs and I will use it
for code I don't really care about, like "create a JSON structure from
these 20 Go structs" or "this package lacks unit tests, write some
that make sense, not just silly ones". I will continue to enjoy using
[Copilot CLI](https://github.com/github/copilot-cli) to bootstrap
projects, fix messy or abandoned code. But for coding the core of the
systems I'm responsible for, I will continue to write that myself,
thank you very much.

I've spent 25 years getting as fast as possible. Fast at touch typing,
which btw, is [Programming's Dirtiest Little
Secret](http://steve-yegge.blogspot.com/2008/09/programmings-dirtiest-little-secret.html),
and honing my skills, and optimising my editor and and programming
tool, what [Franklin
Covey](https://www.franklincovey.com/courses/the-7-habits/habit-7/) in
his famous book calls "sharpen the saw". All of this makes me
fast. Very fast.

Of course, the AI robot can produce code even faster than me. Much
faster. Of course it can, it's a robot after all! But for starters,
it's not always it takes the solution into the direction I want it to
go. It doesn't necessarily choose my _style_ of programming, choosing
the solution which makes the new code blend in with the existing
one. Or sometimes, _I have problems_ comprehending what the robot did
because it doesn't follow my line of thinking. If I'm then pressed for
time, or am demotivated from all the vibing, I might just commit the
code and forget about it. When there's a problem in this new code, I
just vibe code some more. Which of course makes me drift further away
from the code.

Regardless of all of this, what's for sure, is that I will always need
to review what the robot did, and potentially rewrite it. It's not
like the AI writes some code and that's the end of the story. Thus,
when considering the entire flow of implementing a feature: thinking
through the problem, designing a solution, writing code to implement
it, testing the feature, reviewing the code changes, documenting it,
fixing bugs and ironing out corner cases, and later extending the
code; the speed gains of having AI code inserted into your editor is
not that relevant IMO.

And of course,, as any senior developer will tell you, the coding part
is not what you spend most of your time at work doing anyway. For
that's meetings!

Happy <s>vibe</s> coding anyone!

<a href="/graphics/2025/ytop.png">
  <img
    class="centered"
    src="/graphics/2025/ytop.png"
    alt="ytop resource monitor"
    style="width: 1024px"
  />
</a>
