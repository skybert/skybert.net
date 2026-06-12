title: Identify all packages installed from AUR
date: 2026-06-12
category: linux
tags: arch, linux

The way to find packages installed from AUR, is to search for
"foreign" packages. [man
pacman](https://man.archlinux.org/man/pacman.8) says:

```text
     -m, --foreign
         Restrict or filter output to packages that were not found
         in  the  sync  database(s).  Typically these are packages
         that were downloaded manually and  installed  with  --up‐
         grade.
```

So that means performing a search like this will in practice list all
packages from AUR, plus any other packages you may have created
installed manually. For me, and I expect most users, these will all be
from AUR:

```text
# pacman -Qm
```

Happy searching!
