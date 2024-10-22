

## working with notify-send

> this really should be a write up of some sort like blog post / gist write up or something 😑

that said, here are my notes for forwarding notify-send messages to my local computer across a network to alert me when a long running task / job has finished.

**why?** when working with nested tmux sessions it can be difficult to know when long running job has completed ie. `brew install llvm -v -s` will take more than a couple minutes on every computer i have access to. it'd be nice to forward a message to my main desktop to let me know what job has finished regardless or success or not. using homebrew on asahi is officially **not** supported so every piece of software (formula) has be built and installed from source.

i use tmux with nested sessions to interact with remote computers across a network, and below is how i notify myself when a long running task is done.

on the local computer (the computer / desktop you want message to appear on), run

```
socat TCP-LISTEN:7272,reuseaddr,fork UNIX-CONNECT:/run/user/1000/bus
```

from the local computer run the below command to setup the reverse proxy to the serving (remote) computer

```
ssh -R localhost:7272:localhost:7272 [REMOTE_HOST]
```

then after login has finished, run

```
socat ABSTRACT-LISTEN:/tmp/custom_dbus_name,fork TCP:localhost:7272
```

then in a separate ssh session on the remote computer set the below env var,

```
export DBUS_SESSION_BUS_ADDRESS='unix:abstract=/tmp/custom_dbus_name,guid=5fe0907d81e722390f1ce02d6033ad76
```

then send / forward a test message,

```
notify-send -t 0 "brew install qt@5 done"
```

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

## working with homebrew / linuxbrew on asahi

when updating ruby on asahi use the below command to rebuild ruby to have openssl support

```
RUBY_CONFIGURE_OPTS=--with-openssl-dir=(brew --prefix openssl@3) rbenv install 3.3.4
```

