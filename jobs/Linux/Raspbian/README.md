## Sanity Checks

The default system setup does not source **bash** configuration files in the **pi** user's **$HOME** directory, that said, append the below to the following **/etc/bash.bashrc** which will conditionally source **$HOME/.bash_profile** if the file exists.

```shell
# load user specific BASH configuration files
if [ -f $HOME/.bash_profile ]; then
  . $HOME/.bash_profile
fi
```

If the above configuration changes still do not resolve sourcing **bash** configuration changes two things can be checked.

1. check the **shell** value for **/etc/passwd** for the **$USER**
2. change the default shell for the **$USER** `chsh -s /path/to/shell`
