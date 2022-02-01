## mpv / troubleshooting

### error messages

```
Could not bind IPC socket
```

👆 i was getting that error message because my `$USER` could not write to the `/tmp` dir on macos which is a symlink to `/private/tmp`. i made the `/private/tmp` group writable for the `wheel` group.

socket files are something that aren't normally created with a CLI utility such as `touch` or `mkdir` from what i understand.
