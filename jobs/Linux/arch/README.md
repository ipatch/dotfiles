
## contents

<a name="contents"></a>

- [pacman](#pacman)
- [arch/mbp 11.x](#arch-on-macbook)
- [tshooting](#troubleshooting)
  - [tshooting/fail to boot](#tshoot-fail-to-boot)
- [todos](#todos)
- [useful links](#useful-links)


## pacman

<a name="pacman"></a>

- to generate a list of installed packages

```shell
pacman -Qqen > pkglist.txt
pacman -Qqem > pkglist_aur.txt
```

## arch/macbook _11.x_ specific

<a name="arch-on-macbook">

i checked in the `$PWD/etc/default/grub` to source control for helping me remember adding `acpi_mask_gpe=0x06` to the `GRUB_CMDLINE_LINUX_DEFAULT` argument. after adding this arg to above such line the computer went from idling at ~ 70C 🔥 to idling around ~ 40C ~= 100F 🥶

## troubleshooting

<a name="troubleshooting"></a>

### troubleshooting / fail to boot 😭

<a name="tshoot-fail-to-boot"></a>

**my rant**, boot failures always suck and happen at the worst time 🤦

**TL;DR** ❗️ make sure `/boot` partition is writable when upgrading `linux` & `linux-headers`, for me, my HFS `/boot` partition was mounted as _read-only_. Install `yay -S hfsutils` to support RW of hfs partitions. if the partition is mounted **ro** more than likely the system was shutdown abruptly and running a file system check `fschk` on the HFS partition will allow mounting the partition with RW after the check is completed.

my most recent boot failure happened after upgrading all system packages on my arch linux install using `yay -Syu`. to make matters worse i'm running arch on a macbook **without** an internal display, and FWR the typical _hold the_ <kbd>option</kbd> _key during boot_ is not [displaying][ul1] any bootable disks or even displaying the boot menu

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

## todos

<a name="todos"></a>

- [ ] add a link / reference for installing an older version of a package ie. _nss-mdns_

## useful links

<a name="useful-links"></a>

- [calculating DPI **https://dpi.lv/** ❤][ul8]
- [**medium article** arch linux running on a macbook][ul4]
- [**github** arch linux macbook dual boot][ul5]
- [blog post, running arch on 2014 macbook pro with dm-crypt][ul6]
- [mounting a **afp** share via CLI][ul7]


[ul4]: <https://medium.com/@philpl/arch-linux-running-on-my-macbook-2ea525ebefe3>
[ul5]: <https://github.com/s0344/ArchLinux_MacOS_Dualboot#22>
[ul6]: <https://loicpefferkorn.net/2015/01/arch-linux-on-macbook-pro-retina-2014-with-dm-crypt-lvm-and-suspend-to-disk/>
[ul7]: <https://stackoverflow.org/wiki/Mount_an_AFP_share_from_Linux>
[ul8]: <https://dpi.lv/>
[ul9]: <https://github.com/foxlet/macOS-Simple-KVM/blob/master/docs/guide-networking.md>
[ul10]: <https://www.linuxquestions.org/questions/linux-virtualization-and-cloud-90/virsh-failed-to-start-network-default-4175672429/>
[ul11]: <https://bbs.archlinux.org/viewtopic.php?id=247377>

<details>

<summary>scratchpad</summary>

## experimenting with libvirt/libvirtd

- with my current arch linux install there is no `/etc/network/interfaces` file.

- archlinux does not use the above mentioned file, as that is a _debianism_, network manager can used used to setup a bridge with tun/tap [learn more][ul9]

- while experimenting with libvirtd to manage vms, when using `systemctl` to status libvirtd, the following error msg appeared
  `libvirtd cannot check dnsmasq binary /usr/bin/dnsmasq: no such file or directory`
  install dnsmasq

- next error, `cannot find 'dmidecode' in path: no such file or directory`
- setup **pollkit**, install **dmidecode**, no fiddlig with a pollkit agent so far.

- next error, upon launching `virt-manager`

  ```
  virt-manager unable to connect to libvrit qemu:///system authentication unavailable
  ```

  **answer**, add $USER launching `virt-manager` to the `libvirt` user group

- next error, 

  ```
  virt-manager error starting domain: requested operation is not valid: network 'default' is not active
  ```

  **answer**, the **default** network has to be defined using an XML file [learn more][ul10]

  ```shell
  sudo virsh net-define /etc/libvirt/qemu/networks/default.xml
  sudo virsh net-autostart default
  sudo virsh net-start default
  sudo virsh net-list --all
  ```

- next error, [useful link **bbs.archlinuxr.og**][ul11]

  ```
  error starting domain: cannot access storage file as uid gid permission denied
  ```

  **answer**, edit `/etc/libvirt/qemu.conf`

</details>
