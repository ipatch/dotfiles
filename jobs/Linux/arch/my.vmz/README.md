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
  
https://github.com/foxlet/macOS-Simple-KVM/issues/212#issuecomment-830783812

---

- to convert/migrate a virtualbox vdi disk file to RAW to make compatible with qemu
https://www.agix.com.au/migrate-a-virtualbox-disk-image-vdi-to-a-qemu-image-img/

- the OG guide for setting up a macos kvm vm
- 

- a great writeup / blog post about setting up a macos kvm vm (bigsur)
https://www.nicksherlock.com/2020/06/installing-macos-big-sur-on-proxmox/
