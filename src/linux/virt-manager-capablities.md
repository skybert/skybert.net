title: virt-manager add KVM guests because libvirtd cannot find arch capabilities
date: 2026-08-08
category: linux
tags: linux, kvm

If KVM guests in `virt-manager` doesn't work, tail the journal for `libvirtd`:

```text
root@mithrandir ~ # journalctl -f -u libvirtd
Aug 08 22:13:02 mithrandir systemd[1]: Started libvirt legacy monolithic daemon.
Aug 08 22:13:54 mithrandir libvirtd[6138]: libvirt version: 12.6.0
Aug 08 22:13:54 mithrandir libvirtd[6138]: hostname: mithrandir, uid: 0
Aug 08 22:13:54 mithrandir libvirtd[6138]: invalid argument: could not find capabilities for arch=x86_64
^OAug 08 22:16:25 mithrandir systemd[1]: libvirtd.service: Deactivated successfully.
```

I remedied the error above by installing the `quemu-desktop` package:

```text
# root@mithrandir ~ # pacman -S qemu-desktop
```
