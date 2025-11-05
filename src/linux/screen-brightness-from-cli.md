title: Adjust the screen brightness from the command line
date: 2025-08-25
category: linux
tags: linux, laptop

## Find your laptop graphics card in /sys/devices

On my system, the internal, laptop screen is called `eDP-1`, so I
search for `card1-eDP-1`:

```text
$ find /sys/devices -name card1-eDP-1
/sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-eDP-1
```

If you get no hits, search for `card1` instead and see what cards are present:
```text
$ find /sys/devices -name card1
/sys/devices/pci0000:00/0000:00:02.0/drm/card1
```

When you've found it, `cd` into the dir and follow the steps below:
```text
$ cd /sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-eDP-1
```

## Find the max brightness

```text
$ cat ./intel_backlight/max_brightness
1060
```

## Find the current brightness

```text
$ cat ./intel_backlight/brightness
1060
```

## Adust the brightness

Here, I decrease the brightness, which was at `1060`:
```text
$ echo 900 | sudo tee ./intel_backlight/brightness
900
```

## Set max brightness
```text
$ cat ./intel_backlight/max_brightness | sudo tee ./intel_backlight/brightness
960
```

