#!/bin/bash

OSK=$osk
VMDIR=$PWD
OVMF=$VMDIR/firmware
#export QEMU_AUDIO_DRV=pa
#QEMU_AUDIO_DRV=pa

# non supported CPU flags, +xsavec +xgetbv1
# NOTES: ipatch
# - to enable nested paging inside this VM, (hardware accel for vm inside vm) add `+vmx` to list of cpu flags
# 	- `+vmx` is only compat with intel cpu's, AMD use +svm
# BRIDGE
#	-netdev tap,id=net0,ifname=tap0,script=no,downscript=no \
#	-device vmxnet3,netdev=net0,mac=52:54:00:c9:18:27
	# netctl
	# -netdev bridge,br=br1,id=net0 \

# USER
#    -netdev user,id=net0 \
# -device [usb-mouse] or [usb-tablet]
#
# mouting EFI partition within the host OS, no need for VM to edit clover/config.plist
# install `libguestfs` for *nix distro, see: github.com/foxlet/macos-simple-kvm/pull/133
#
## EXP with opencore

osx_kvm_repo="/home/capin/code/osx-kvm"
ovmf_dir=""

#    foxlet, github.com/foxlet/macos-simple-kvm
#    -drive if=pflash,format=raw,readonly,file="$OVMF/OVMF_CODE.fd" \
#    -drive if=pflash,format=raw,file="$OVMF/OVMF_VARS-1024x768.fd" \

# open core
#-drive if=pflash,format=raw,readonly,file="$osx_kvm_repo/$ovmf_dir/OVMF_CODE.fd"
#-drive if=pflash,format=raw,file="$osx_kvm_repo/$ovmf_dir/OVMF_VARS-1024x768.fd"

#-device ich9-ahci,id=sata
# -drive id=OpenCoreBoot,if=none,snapshot=on,format=qcow2,file="$REPO_PATH/OpenCore-Catalina/OpenCore-nopicker.qcow2"
#  -drive id=OpenCoreBoot,if=none,snapshot=on,format=qcow2,file="$REPO_PATH/OpenCore-Catalina/OpenCore.qcow2"
#-device ide-hd,bus=sata.2,drive=OpenCoreBoot

# shellcheck disable=SC2054
args=(
-enable-kvm \
-m 4G \
-machine q35,accel=kvm \
-smp 4,cores=2 \
-cpu host,vendor=GenuineIntel,kvm=on,+sse3,+sse4.2,+aes,+xsave,+avx,+xsaveopt,+avx2,+bmi2,+smep,+bmi1,+fma,+movbe,+invtsc \
-device isa-applesmc,osk="$OSK" \
-smbios type=2 \
-drive if=pflash,format=raw,readonly=on,file="$osx_kvm_repo/$ovmf_dir/OVMF_CODE.fd" \
-drive if=pflash,format=raw,file="$PWD/OVMF_VARS-1024x768.mojave.fd" \
-vga qxl \
\
-netdev tap,id=net0,ifname=tap4,script=no,downscript=no \
-device vmxnet3,netdev=net0,mac=52:54:00:c9:00:14
\
-device ich9-intel-hda -device hda-output \
-usb -device usb-kbd -device usb-tablet \
\
# insert block for booting from coreboot ISO
# -device ich9-ahci,id=sata \
# -drive id=OpenCoreBoot,if=none,snapshot=on,format=raw,file="./OpenCore-v13.iso" \
# -device ide-hd,bus=sata.2,drive=OpenCoreBoot,bootindex=1 \
\
-device nvme,id=nvme-ctrl-0,serial=deadbeef \
\
-drive file="/home/capin/vmz/mymojavedisk128G.qcow2",format=qcow2,if=none,id=mydisk2 \
-device nvme-ns,drive=mydisk2,bootindex=1 \
\
\
-nographic \
-monitor stdio \
-serial none \
#-display gtk,zoom-to-fit=on
)

# NOTE: for macos mojave 10.14, use 10.0.1.114 as ip address

# DEBUG comment/uncomment the below line
# echo qemu-system-x86_64 "${args[@]}"

qemu-system-x86_64 "${args[@]}"
