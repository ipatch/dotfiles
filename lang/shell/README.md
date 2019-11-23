## BASH

Something that I've come across from time to time is to pipe the output of one command into the input of another command.

### Use Case

Generally I run `which` or `type -a` **[EXECUTABLE]** to print the path to the executable, and then the next step in my process is to check to see what kind of file the **[EXECUTABLE]** is, ie. it's useful to make sure I'm checking the correct **[EXE]** if multiple **exes** are in my path with the same, and running `file` on the above output of `which` lets me know what type of file the executable is, ie. a **binary** _compiled_ or a **sh** shell script.  So to do a little two step combo

```shell
which airport | xargs ls -l
which airport | xargs file
```

The above command will let me know that the `airport` file in my path is a symlink to a Mach-0 executable.
