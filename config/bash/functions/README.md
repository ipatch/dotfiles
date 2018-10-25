# BASH Functions

<a id="contents"></a>

> BASH functions stored in this direcotry do not require an executable bit to run.

To test uncomment

```shell
echo "Hello, BASH!"
```

from the `foobar.bash` file.

If everything works as intended functions defined within the `$XDG_CONFIG_HOME/bash/functions` or the `$funcs_dir` should load the function files, ie. `foobar.bash` and the functions loaded within them.

To test the above behavior, run the `hello` function from the CLI that is contained within the `foobar.bash` file in the `$funcs_dir` by running,

```shell
hello
```
