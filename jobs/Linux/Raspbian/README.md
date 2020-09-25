## Initial Setup

## Contents

## / bash / source `~/.bash_profile` for all users

The default system setup does not source **bash** configuration files in the **pi** user's **$HOME** directory, that said, append the below to the following **/etc/bash.bashrc** which will conditionally source **$HOME/.bash_profile** if the file exists.

```shell
# load user specific BASH configuration files
if [ -f $HOME/.bash_profile ]; then
  . $HOME/.bash_profile
fi
```

🚀 To quickly setup Raspbian with the above stated changes

```shell
curl -sSf \
https://raw.githubusercontent.com/ipatch/dotfiles/release/jobs/Linux/Raspbian/rpi_bash_setup.sh \
| /bin/sh
```

If the above configuration changes still do not resolve sourcing **bash** configuration changes two things can be checked.

1. check the **shell** value for **/etc/passwd** for the **$USER**
2. change the default shell for the **$USER** `chsh -s /path/to/shell`

To verify if **bash** is running as a _login shell_

```shell
shopt login_shell
```
