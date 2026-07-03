title: Convert BASH Array to a Comma Separated List of Values
date: 2026-07-03
category: bash
tags: bash, unix


There's a simple way in bash to add commas between all array elements:

```bash
fruits=(apple orange apple)
IFS=, echo "${fruits[*]}"
```

It turns out, the array-to-string expression, `${fruits[*]}`, will use
the first value of `IFS` as the separator. That's why the default
behaviour of `"${fruits[*]}"` will be a space separated list, because
the first character in default `IFS` is space.

`IFS` in front of the (echo) command makes it local to only that
command execution.

Code tested on:
```text
$ bash --version
GNU bash, version 5.3.15(1)-release (aarch64-apple-darwin25.4.0)
```

Happy hacking!
