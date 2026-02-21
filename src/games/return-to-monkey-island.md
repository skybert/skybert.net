title: Return to Monkey Island
date: 2022-09-26
category: life
tags: games, linux

<div class="pictures">
  <a href="/graphics/2022/rtmi/20220922211850_1.jpg">
    <img
      src="/graphics/2022/rtmi/20220922211850_1.jpg"
      alt="Return to Monkey Island"
      style="width: 250px"/>
  </a>
  <a href="/graphics/2022/rtmi/20220922212040_1.jpg">
    <img
      src="/graphics/2022/rtmi/20220922212040_1.jpg"
      alt="Return to Monkey Island"
      style="width: 250px"
    />
  </a>
  <a href="/graphics/2022/rtmi/20220922212416_1.jpg">
    <img
      src="/graphics/2022/rtmi/20220922212416_1.jpg"
      alt="Return to Monkey Island"
      style="width: 250px"
    />
  </a>
  <a href="/graphics/2022/rtmi/20220922213337_1.jpg">
    <img
      src="/graphics/2022/rtmi/20220922213337_1.jpg"
      alt="Return to Monkey Island"
      style="width: 250px"
    />
  </a>
  <a href="/graphics/2022/rtmi/20220923225540_1.jpg">
    <img
      src="/graphics/2022/rtmi/20220923225540_1.jpg"
      alt="Return to Monkey Island"
      style="width: 250px"
    />
  </a>
  <a href="/graphics/2022/rtmi/20220923230006_1.jpg">
    <img
      src="/graphics/2022/rtmi/20220923230006_1.jpg"
      alt="Return to Monkey Island"
      style="width: 250px"
    />
  </a>
  <a href="/graphics/2022/rtmi/20220923230021_1.jpg">
    <img
      src="/graphics/2022/rtmi/20220923230021_1.jpg"
      alt="Return to Monkey Island"
      style="width: 250px"
    />
  </a>
  <a href="/graphics/2022/rtmi/20220923230735_1.jpg">
    <img 
      src="/graphics/2022/rtmi/20220923230735_1.jpg"
      alt="Return to Monkey Island"
      style="width: 250px"
    />
  </a>
  <a href="/graphics/2022/rtmi/20220923231351_1.jpg">
    <img
      src="/graphics/2022/rtmi/20220923231351_1.jpg"
      alt="Return to Monkey Island"
      style="width: 250px"
    />
  </a>
  <a href="/graphics/2022/rtmi/20220925222403_1.jpg">
    <img
      src="/graphics/2022/rtmi/20220925222403_1.jpg"
      alt="Return to Monkey Island"
      style="width: 250px"
    />
  </a>
</div>

I feel like I'm 14 again playing the latest [Monkey Island
game](https://returntomonkeyisland.com/) from the brilliant [Ron
Gilbert](https://grumpygamer.com/). Every evening after the wee one
sleeps, I go back to the world of Monkey Island. Playing it slowly,
savouring the atmosphere, the characters, the humour, the music, the
puzzles.  May it never end.

## To get Return to Monkey Island to run on Linux

After installing RtMI through Steam and selecting to use experimental
Proton to run it, it started up just fine with music and all, but no
graphics. The window was just black. Running the game fullscreen or
windowed made no difference. Helpful folks on the Steam forums
suggested different workarounds, one of worked for me. It involved two
things: 1) using Proton tricks and switching to DirectX rendering:

First off, I installed `protontricks`:

```text
# pacman -Sy chaotic-aur/protontricks-git
```

Then, I applied  a tweak for the game:
```text
$ protontricks 2060130 d3dcompiler_47
```

Finally, I instructed Proton to use DirectX for rendering instead of Vulkan:
```text
$ mkdir -p "~/.steam/steam/steamapps/compatdata/2060130/pfx/drive_c/users/steamuser/AppData/Roaming/Terrible\ Toybox/Return\ to\ Monkey\ Island/"
$ echo 'renderer: "directx"' > "~/.steam/steam/steamapps/compatdata/2060130/pfx/drive_c/users/steamuser/AppData/Roaming/Terrible\ Toybox/Return\ to\ Monkey\ Island/Prefs.json"
```

I also did what proton suggested when running it, hopefully that'll
make the graphics run smoothly. I don't actually know if this made a
difference, but running the game (admittedly with reduced resolution)
gives a super smooth experience:

```text
# sysctl dev.i915.perf_stream_paranoid=0
```



