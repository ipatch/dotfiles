## arch linux, archlinux

I performed the following actions on archlinux to allow rwx of the zfs pool on this disk.

- I use this disk on both macos and archlinux, macos has default group names and numbers, so i created the same groups on archlinux with the same name and ID.

- mounters 506
- staff 20

- adding the above two groups with the names/id allows my $USER on archlinux to RWX files in the zfs pool.

i ran the below cmds on archlinux to gain RWX of the pool.

```
sudo groupadd {mounters,staff}
sudo groupmod -g 506 mounters
sudo groupmod -g 20 staff
echo "add $USER to above groups"
sudo usermod -aG mounters $USER
sudo usermod -aG staff $USER
```
