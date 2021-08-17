## arch linux / working with zfs

> i have a 5TB ext USB drive that i use rsync with to backup files from my various devices

I performed the following actions on arch linux to allow rwx of the zfs pool on this disk.

- I use this disk on both macos and arch linux, macos has default group names and numbers, so i created the same groups on arch linux with the same name and ID.

- mounters 506
- staff 20

- adding the above two groups with the names/id allows my `$USER` on arch linux to RWX files in the zfs pool.

i ran the below cmds on arch linux to gain RWX of the pool.

```
sudo groupadd {mounters,staff}
sudo groupmod -g 506 mounters
sudo groupmod -g 20 staff

echo "add $USER to above groups"
sudo usermod -aG mounters $USER
sudo usermod -aG staff $USER
```
