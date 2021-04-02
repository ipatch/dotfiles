## troubleshooting

<a name="troubleshooting"></a>

### troubleshooting / fail to boot 😭

<a name="tshoot-fail-to-boot"></a>

**my rant** boot failures always suck and happen at the worst time 🤦

**TL;DR** ❗️ make sure `/boot` partition is writable when upgrading `linux` and `linux-headers`, for me my HFS `/boot` partition was mounted as _read-only_. Install `yay -S hfsutils` to support RW of hfs partitions.

my most recent boot failure happened after upgrading all system packages on my arch linux install using `yay -Syu`. to make matters worse i'm running arch on a macbook without an internal display, and FWR the std <kbd>option</kbd> is not [diplaying][ul1] any bootable disks or even displaying the boot menu

fortunately [resetting][ul2] the nvram _wait for **2 chimes**_ and the grub menu entry displays arch linux and advanced options

> use <kbd>tab</kbd> for a list of cmds & completions

- press <kbd>c</kbd> to enter into the grub console.
- enable the pager `set pager=1`

next, either attempt to boot from existing linux image and ramdisk or use the ones provided by an iso ie. a archlinux install disk

1. determine partition layouts of disks

```
grub> ls
```

2. set the root partition

> numbers will vary depending up partition layout

```
set root (hd0,3)
```

3. set the path the linux kernel and the root partition

```

```

4. set the path the **initrd**

> if attempting to boot from an arch ISO, set this to the path of the ISO file??? [double check]

```
initrd /boot
```

5. finally tell grub to boot the linux kernel and system

```
boot
```

A good [reference/explanation][ul3] of the above procedure

---

[ul1]: <https://support.apple.com/guide/mac-help/change-your-mac-startup-disk-mchlp1034/mac>
[ul2]: <https://support.apple.com/en-us/HT204063>
[ul3]: <https://www.ubuntubuzz.com/2016/03/booting-gnulinux-manually-with-grub-prompt.html>
