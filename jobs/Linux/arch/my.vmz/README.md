## TODOs

- [ ] make a more universal/robust sh script to accept args for different macos disks,
ie. mojave, catalina, and bigsur. where at the same time setup a list of default args.

- [ ] make sure to give each disk based on name, 
	- [x] ~~a specific mac address~~
	- a specific ip address. ideally, mojave = 10.0.1.114
		- catalina = 10.0.1.115
		- bigsur = 10.0.1.116


## troubleshooting

<a name="troubleshooting"></a>

ran into a pretty gnarly issue where docker was preventing my kvm bridge networking from properly working when launching new VMs. long story short see the below link,

- https://askubuntu.com/a/1134655/134740 for the solution to fix the **iptables** rule for allowing the guest VM to connect to the internet

## Notes

- to increase the size of a virtual disk
  1. create a new img/drive using `qemu-img`
  2. boot from the recovery partition (requires adding OC.iso virtual disk)
  3. copy old drive to new drive using disk utility
		> the newly created disk within the host OS needs to be formatted using APFS or HFS+ first before macos begin the restore process
	4. (optional) copying of the opencore efi image is required if wanting to boot without the opencore ISO mounted
	- [learn more][lm1] about copying the efi partition for the opencore to the internal vdisk
	- after opencore is copied the vdisk the boot options will need to be updated to set the _timeout_ or the system will stall the boot selection menu (not useful if booting the system with `-nographic`

https://github.com/foxlet/macOS-Simple-KVM/issues/212#issuecomment-830783812

[lm1]: <https://www.nicksherlock.com/2021/10/installing-macos-12-monterey-on-proxmox-7/#more-1167>

---

- to convert/migrate a virtualbox vdi disk file to RAW to make compatible with qemu
https://www.agix.com.au/migrate-a-virtualbox-disk-image-vdi-to-a-qemu-image-img/

- a great writeup / blog post about setting up a macos kvm vm (bigsur)
https://www.nicksherlock.com/2020/06/installing-macos-big-sur-on-proxmox/

### Notes / gpu passthrough / intel hd 530 / and general macos virtual machining 

- https://github.com/foxlet/macOS-Simple-KVM/issues/130
- https://github.com/yoonsikp/macOS-KVM-PCI-Passthrough#pci-passthrough-for-graphics-card
- https://github.com/kholia/OSX-KVM/blob/master/OVMF-notes.txt
- https://github.com/thenickdude/KVM-Opencore
- https://github.com/foxlet/macOS-Simple-KVM/issues/357
- https://github.com/foxlet/macOS-Simple-KVM/blob/master/docs/guide-networking.md
- https://github.com/mvgijssel/setup/wiki/Qemu-tap-bridge-networking-on-macos-osx (also has info related to zfs)
