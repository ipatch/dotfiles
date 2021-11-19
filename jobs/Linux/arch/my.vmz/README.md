## TODOs

- [ ] make a more universal/robust sh script to accept args for different macos disks,
ie. mojave, catalina, and bigsur. where at the same time setup a list of default args.

- [ ] make sure to give each disk based on name, 
	- [x] ~~a specific mac address~~
	- a specific ip address. ideally, mojave = 10.0.1.114
		- catalina = 10.0.1.115
		- bigsur = 10.0.1.116


## Notes

- to increase the size of a virtual disk
  1. create a new img/drive using `qemu-img`
  2. boot from the recovery partition (requires adding OC.iso virtual disk)
  3. copy old drive to new drive using disk utility
	4. (optional) copying of the opencore efi image is required if wanting to boot without the opencore ISO mounted
	- [learn more][lm1] about copying the efi partition for the opencore to the internal vdisk

https://github.com/foxlet/macOS-Simple-KVM/issues/212#issuecomment-830783812

[lm1]: <https://www.nicksherlock.com/2021/10/installing-macos-12-monterey-on-proxmox-7/#more-1167>

---

- to convert/migrate a virtualbox vdi disk file to RAW to make compatible with qemu
https://www.agix.com.au/migrate-a-virtualbox-disk-image-vdi-to-a-qemu-image-img/

- a great writeup / blog post about setting up a macos kvm vm (bigsur)
https://www.nicksherlock.com/2020/06/installing-macos-big-sur-on-proxmox/

### Notes / gpu passthrough / intel hd 530 / and general macos virtual machining 

https://github.com/foxlet/macOS-Simple-KVM/issues/130
https://github.com/yoonsikp/macOS-KVM-PCI-Passthrough#pci-passthrough-for-graphics-card
https://github.com/kholia/OSX-KVM/blob/master/OVMF-notes.txt
https://github.com/thenickdude/KVM-Opencore
https://github.com/foxlet/macOS-Simple-KVM/issues/357
https://github.com/foxlet/macOS-Simple-KVM/blob/master/docs/guide-networking.md
