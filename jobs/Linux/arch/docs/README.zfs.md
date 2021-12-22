## arch linux / working with zfs

> i use rsync with a 5TB external USB drive to backup files from my various devices

I perform the following actions on **arch linux** to allow **rwx** of the zfs pool on this disk.

- I use this disk with macos and arch linux, macos has default group names and numbers, so i created the same group names and IDs on arch linux.

```
GROUPNAME GROUP_ID
mounters 506
staff 20
```

- adding the above two groups with the names/id allows my `$USER` on arch linux to have **rwx** of files in the zfs pool.

i run the below cmds on arch linux to gain **rwx** of the pool.

```
sudo groupadd {mounters,staff}
sudo groupmod -g 506 mounters
sudo groupmod -g 20 staff

echo "add $USER to above groups"
sudo usermod -aG mounters $USER
sudo usermod -aG staff $USER
```

## arch linux / zfs / troubleshooting

### fix / upgrading zfs using yay

[learn more][lm2]

```
yay -S --batchinstall --nodeps zfs-dkms zfs-utils
```

the above cmd was taking from the above github comment and seems to have upgraded the `zfs-dkms` and `zfs-utils` packages for my arch linux install. `yay` (bad joke)

[lm2]: <https://github.com/Jguer/yay/issues/803#issuecomment-713552522>

### error messages / when upgrading

[learn more][lm1]

[lm1]: <https://aur.archlinux.org/packages/zfs-dkms/?O=10&PP=10#comment-829459>

```
:: 2 Packages to upgrade.
2  aur/zfs-dkms   2.1.0-1 -> 2.1.2-1
1  aur/zfs-utils  2.1.0-1 -> 2.1.2-1
==> Packages to exclude: (eg: "1 2 3", "1-3", "^4" or repo name)
==>
```

continued after attempting to upgrade...

```
==> WARNING: Using existing $srcdir/ tree
==> Sources are ready.
 -> zfs-utils-2.1.2-1 already made -- skipping build
 -> zfs-utils=2.1.2 not satisfied, flushing install queue
loading packages...
resolving dependencies...
looking for conflicting packages...
error: failed to prepare transaction (could not satisfy dependencies)
:: installing zfs-utils (2.1.2-1) breaks dependency 'zfs-utils=2.1.0' required by zfs-dkms
 -> exit status 1
```

---

doing some internet searches it seems this upgrade error could be related to **yay** because these packages need to be installed at the same time (haven't fully tested this hypothesis).
