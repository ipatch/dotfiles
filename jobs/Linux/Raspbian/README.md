## Sanity Checks

The default system setup does not source **bash** configuration files in the **pi** user's **$HOME** directory, that said, append the below to the following **/etc/bash.bashrc** which will conditionally source **$HOME/.bash_profile** if the file exists.

```shell
# load user specific BASH configuration files
if [ -f $HOME/.bash_profile ]; then
  . $HOME/.bash_profile
fi
```
