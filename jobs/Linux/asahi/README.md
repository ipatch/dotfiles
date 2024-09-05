## working with zfs

- as of sep 5 2024, zfs only supports linux kernels v6.9 and below, and asahi will install a 6.10 kernel.

```
sudo grubby --info=ALL | grep -E "^kernel|^index"
```

```
index=0
kernel="/boot/vmlinuz-6.6.3-411.asahi.fc39.aarch64+16k"
index=1
kernel="/boot/vmlinuz-6.10.6-401.asahi.fc39.aarch64+16k"
index=2
kernel="/boot/vmlinuz-6.10.5-400.asahi.fc39.aarch64+16k"
index=3
kernel="/boot/vmlinuz-6.9.12-401.asahi.fc39.aarch64+16k"
```

```
sudo grubby --set-default-index=3
```

```
The default is /boot/loader/entries/966d8f0431d04295af5b50876f4beca8-6.9.12-401.asahi.fc39.aarch64+16k.conf with index 3 and kernel /boot/vmlinuz-6.9.12-401.asahi.fc39.aarch64+16k
```
