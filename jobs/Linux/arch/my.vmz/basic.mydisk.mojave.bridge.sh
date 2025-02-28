#!/bin/bash

#----------------------------------------
# NOTE: ipatch,
#------------------
# error messages:
#--
# error #1
#- 
# qemu-system-x86_64: -netdev tap,id=net0,ifname=tap4,script=no,downscript=no: could not configure /dev/net/tun (tap4): Operation not permitted
#--
# fix #1
# on archlinux `uml_utilities` needs to be installed for `tunctl`
#--
# error #2
# (qemu) qemu-system-x86_64: -device isa-applesmc,osk=: warning: Using AppleSMC with invalid key
#--
# fix #2
# check to make sure `osk` is properly set
#------

#---
# non supported CPU flags, +xsavec +xgetbv1
# NOTE: ipatch
# - to enable nested paging inside this VM, (hardware accel for vm inside vm) add `+vmx` to list of cpu flags
# - `+vmx` is only compat with intel cpu's, AMD use +svm
#--

# mouting EFI partition within the host OS, no need for VM to edit clover/config.plist
# install `libguestfs` for *nix distro, see: https://github.com/foxlet/macos-simple-kvm/pull/133

OSK=$osk
VMDIR=$PWD
OVMF=$VMDIR/firmware
#export QEMU_AUDIO_DRV=pa
#QEMU_AUDIO_DRV=pa
ovmf_dir=""
ALLOCATED_RAM="4096" # MiB
CPU_SOCKETS="1"
CPU_CORES="4"
CPU_THREADS="8"
CPU_INSTRUCTS="vmx,rdtscp"

# shellcheck disable=SC2054
args=(
-name "vmmojave" \
-enable-kvm \
-m $ALLOCATED_RAM \
-machine q35,accel=kvm \
# NOTE: ipatch, use all available cores from host OS, or use `grep -c ^processor /proc/cpuinfo`
-smp $(nproc) \
-cpu 
# NOTE: ipatch my 2013 late mpb haswell seems to fault with `+xsavec` `+xgetbv1`
host,vendor=GenuineIntel,kvm=on,vmware-cpuid-freq=on,+sse3,+sse4.2,+aes,+xsave,+avx,+xsaveopt,+avx2,+bmi2,+smep,+bmi1,+fma,+movbe,+invtsc \
-device isa-applesmc,osk="$OSK" \
-smbios type=2 \
# NOTE: ipatch, the below 2 files cannot be used with multiple VMs
-drive if=pflash,format=raw,readonly=on,file="$PWD/OVMF_CODE-mojave.fd" \
-drive if=pflash,format=raw,file="$PWD/OVMF_VARS-1024x768.mojave.fd" \

#-----
# video
# NOTE: ipatch, `-vga vmware` error, guest has not initialized the display yet
# NOTE: ipatch, the below mem setting does not work ❌ 
# -device VGA,vgamem_mb=128 \
#--
-vga qxl \
# -vga std \
# -vga vmware \

\
#-----
# vnc, `vncviewer localhost:5900`
-vnc :0 \
\
#------------
# networking 
#----
# BRIDGE, example
#--
# -netdev tap,id=net0,ifname=tap0,script=no,downscript=no \
#	-device vmxnet3,netdev=net0,mac=52:54:00:c9:18:27
# netctl
# -netdev bridge,br=br1,id=net0 \
#----
# USER, example
# -netdev user,id=net0 \
#----
# ssh example, vlan=0,hostfwd=tcp::5555-:22 
# -netdev user,id=net0,hostfwd=tcp::5555-:22  \
#--
-netdev tap,id=net0,ifname=tap12,script=no,downscript=no \
-device vmxnet3,netdev=net0,mac=52:54:00:c9:00:14
\
#---
# audio
# -device ich9-intel-hda -device hda-output \
# -device ich9-intel-hda -device hda-duplex \
-device ich9-ahci,id=sata \
#---
# usb, mouse & keyboard & / controller / iphone passthrough
#---
# -usb -device qemu-xhci,id=xhci \ 
# NOTE: ipatch, add `-device usb-mouse` to have qemu pick on a editable mouse, then the scroll direction can be changed
-usb \
-device usb-kbd,bus=usb-bus.0 \
-device usb-tablet,bus=usb-bus.0 \
-device usb-ehci,id=ehci \
-device nec-usb-xhci,id=xhci \
# -global nec-usb-xhci.msi=off \

# NOTE: ipatch, below line causes boot loop
# -device usb-host,bus=ehci.0,vendorid=0x05ac,productid=0x12a8,guest-reset=false,id=iphone \

# NOTE: ipatch, maksing the usbmuxd service and plugging the phone in then unplugging it, locks vm until unplugged

# -device usb-host,hostbus=1,hostaddr=8 \
# -device usb-host,bus=ehci.0,vendorid=0x05ac,guest-reset=false,id=iphone \
# 05ac:12a8
# -device usb-host,bus=ehci.0,vendorid=0x05ac,productid=0x12a8,guest-reset=false,id=phone7 \
# -device usb-host,vendorid=0x05ac,productid=0x12a8,guest-reset=false,id=phone7 \
#----
# blog post about udev grabbing device,
# https://www.zeitgeist.se/2015/06/28/mount-an-iphone-inside-a-kvm-guest-by-disabling-usbmuxd/
#---
# arch wiki example: https://wiki.archlinux.org/title/QEMU#Pass-through_host_USB_device
#----
# -device usb-host,bus=controller_id.0,vendorid=0xvendor_id,productid=0xproduct_id
# ie. -device usb-ehci,id=ehci -device usb-host,bus=ehci.0,vendorid=0x0781,productid=0x5406
# -device usb-ehci,id=echi -device usb-host,bus=ehci.0,vendorid=0x05ac,productid=0x12a8
\
#------
# to boot from coreboot ISO
# resizing vdisk requires macos install media
#------
# -device ich9-ahci,id=sata \
# -drive id=OpenCoreBoot,if=none,snapshot=on,format=raw,file="./OpenCore-v19.iso" \
# -device ide-hd,bus=sata.2,drive=OpenCoreBoot,bootindex=0 \
#------
# macos install media, required to resize vdisk
#------
# -drive id=macosinstall,if=none,snapshot=on,format=raw,file="./mojave.BaseSystem.img" \
# -device ide-hd,bus=sata.3,drive=macosinstall,bootindex=1 \
#--
# DISK / nvme
# -device nvme,id=nvme-ctrl-1,serial=deadbeed2 \
# -drive file="$PWD/mymojavedisk256G.qcow2",format=qcow2,if=none,id=mydisk3 \
# -device nvme-ns,drive=mydisk3,bootindex=2 \
\
# DISK / virtio-blk
-device virtio-blk-pci,drive=mydisk3 \
-drive file="$PWD/mymojavedisk256G.qcow2",format=qcow2,if=none,id=mydisk3 \
\
# NOTE: ipatch, add the below env var to suppress the below waring
# warning: dbind: Couldn't connect to accessibility bus: Failed to connect to socket
# export NO_AT_BRIDGE=1
# -nographic \
-display gtk,zoom-to-fit=on \
-monitor stdio \
-serial none \
# NOTE: ipatch, add `-nodefaults` to prevent the pseudo DVD-ROM drive from appearing in macos
-nodefaults \
)

# DEBUG toggle below line
# echo qemu-system-x86_64 "${args[@]}"

qemu-system-x86_64 "${args[@]}"
