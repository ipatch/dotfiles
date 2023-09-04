#!/bin/bash

source "/etc/environment_vars"
vmdir="/home/capin/vmz"
ovmf_dir="$vmdir"

#------------
# non supported CPU flags, +xsavec +xgetbv1
# NOTES: ipatch
# - to enable nested paging inside VM, (hardware accel for vm inside vm) add `+vmx` to  cpu flags
# 	- `+vmx` is only compat with intel cpu's, AMD uses +svm
# networking / BRIDGE
#	-netdev tap,id=net0,ifname=tap0,script=no,downscript=no \
#	-device vmxnet3,netdev=net0,mac=52:54:00:c9:18:27
	# netctl
	# -netdev bridge,br=br1,id=net0 \

# networking / USER
# -netdev user,id=net0 \
# -device [usb-mouse] or [usb-tablet]
#
# NOTE: ipatch, mouting EFI partition within the host OS, no need for VM to edit clover/config.plist
# install `libguestfs` for *nix distro, see: github.com/foxlet/macos-simple-kvm/pull/133
#-

osx_kvm_repo="/home/capin/code/osx-kvm"

# foxlet, github.com/foxlet/macos-simple-kvm
# -drive if=pflash,format=raw,readonly,file="$OVMF/OVMF_CODE.fd" \
#-drive if=pflash,format=raw,file="$OVMF/OVMF_VARS-1024x768.fd" \

# shellcheck disable=SC2054
args=(
-enable-kvm \
-m 4G \
-machine q35,accel=kvm \
# NOTE: ipatch, use all available cores from host OS
-smp $(nproc)
-cpu 
host,vendor=GenuineIntel,kvm=on,+sse3,+sse4.2,+aes,+xsave,+avx,+xsaveopt,+avx2,+bmi2,+smep,+bmi1,+fma,+movbe,+invtsc \
-device isa-applesmc,osk="$OSK" \
-smbios type=2 \
-drive if=pflash,format=raw,readonly=on,file="$ovmf_dir/OVMF_CODE-mojave.fd" \
-drive if=pflash,format=raw,file="$ovmf_dir/OVMF_VARS-1024x768.mojave.fd" \
-vga qxl \
\
# network
-netdev tap,id=net0,ifname=tap14,script=no,downscript=no \
-device vmxnet3,netdev=net0,mac=52:55:00:c9:00:14
\
# audio
#export QEMU_AUDIO_DRV=pa
#QEMU_AUDIO_DRV=pa
-device ich9-intel-hda -device hda-output \
# keyboard & mouse, generic USB
-usb -device usb-kbd -device usb-tablet \
\
#------------
# NOTE: ipatch, uncomment blocks to boot from coreboot ISO
# will also need to insert macos install media to resize vdisk
#----
# -device ich9-ahci,id=sata \
# -drive id=OpenCoreBoot,if=none,snapshot=on,format=raw,file="./OpenCore-v13.iso" \
# -device ide-hd,bus=sata.2,drive=OpenCoreBoot,bootindex=1 \
\
# macos install media, required to resize vdisk, ie. catalina
#----
# -drive id=macosinstall,if=none,snapshot=on,format=raw,file="./BaseSystemCatalina.img" \
# -device ide-hd,bus=sata.3,drive=macosinstall,bootindex=4 \
#------
\
-device nvme,id=nvme-ctrl-1,serial=deadbeed2 \
-drive file="/home/capin/vmz/mymojavedisk256G.qcow2",format=qcow2,if=none,id=mydisk3 \
-device nvme-ns,drive=mydisk3,bootindex=3 \
\
-nographic \
# -display gtk,zoom-to-fit=on
-serial none \
# NOTE: ipatch, add `-nodefaults` to prevent the pseudo DVD-ROM drive from appearing in macos
-nodefaults \
# NOTE: ipatch, To exit the Telnet session, type `Ctrl + ]` on your keyboard.
-serial telnet:localhost:7000,server,nowait,nodelay \
-monitor telnet:localhost:7100,server,nowait,nodelay \
# -monitor stdio \
# TODO: ipatch
# add or assign name for virtual machine
-name vmmojave
)

# DEBUG comment/uncomment the below line
# echo qemu-system-x86_64 "${args[@]}"

# qemu-system-x86_64 "${args[@]}"

# Run qemu-system-x86_64 in the background, ie. systemd service file
qemu-system-x86_64 "${args[@]}" &
