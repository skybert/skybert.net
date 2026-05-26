title: macOS keeps disabling accesility settings of app
date: 2026-05-07
category: mac-os-x
tags: mac-os-x, macos

macOS kept disabling the accessibility settings of Aerospace, making it close to impossible to start, requiring 8-20 attempts of re-enabling it in the Accessibility settings.

To solve this, I reset the Accessibility database with:
```text
$ tccutil reset Accessibility
```

The only caveat is that after doing this, you must re-enable all apps
that you want to do special things on your desktop, like OBS studio
and window managers such as Aerospace. Apart from that, it's a safe
operation to do and doesn't require a restart.


