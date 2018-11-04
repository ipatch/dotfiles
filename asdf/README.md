# ASDF Tooling

<a id="contents"></a>

## Contents

- [Using asdf with rust](#using-asdf-with-rust)
- [asdf-vm Gotchas](#gotchas)
- [My man page journey](#my-man-page-journey)
  - [**Update** Working with asdf and man pages on macOS](#my-man-page-journey-update)
- [man page directory layout](#man-page-directory-layout)
- [My man page journey hacking away at asdf](#my-man-page-journey-hacking-away-at-asdf)
- [My man page journey working with bash](#my-man-page-journey-working-with-bash)
- [Useful Links](#useful-links)
  - [medium](#medium)
- [TODOs](#todos)

<a id="using-asdf-with-rust"></a>

## Using asdf with rust [🔝](#contents)

As of June 22 2018 asdf does not play well with [rust](https://www.rust-lang.org/en-US/) ...surprise, surprise. 🤷

Fortunately rust provides its own language manager 👍

> Homebrew can cause complications when using the official rust installer, it is adviced to use `rustup` provided by [rust-lang.org](http://www.rust-lang.org/en-US/)

<a id="asdf-vm-gotchas"></a>

## asdf-vm gotchas [🔝](#contents)

When installing a specific version of ruby ie, 2.3.6 make sure to run the below command

```shell
asdf reshim ruby
```

After the above command is run, the shell environment should find specific gems related to that version of Ruby.

```shell
$ which rails
/$HOME/.asdf/shims/rails
```

To fix nodejs with the current release `0.4.1` of `asdf` delete `node` and `npm` located in `$HOME/.asdf/shims` see [🙈](https://github.com/asdf-vm/asdf/issues/239#issuecomment-339296677)

<a id="my-man-page-journey"></a>

## My man page journey [🔝](#contents)

**Q** Where are `man` pages located on macOS?

**A** `man` pages are stored in various locations on the system.

On macOS, and Debian `manpath` will output all the the `PATH`s `man` looks for man pages on the system.

🚨 Setting `MANPATH` on either macOS or Debian is problematic because both OSes look for `MANPATH` entries from a supplied system file.  For that reason, I am going to try and avoid setting `MANPATH` on both systems, but rather symlink the man pages to a directory that is writable for the current user running asdf.

<a id="my-man-page-journey-update"></a>

### _Update_ My man page Journey

[**GitHub** my asdf man page comment](https://github.com/asdf-vm/asdf/issues/263#issuecomment-435695594)

<details>
<summary>Your gunna want to sit down 🛋  for this one</summary>

Got to spend some more time working with man pages on macOS, and it appears macOS may actually be able to honor the `$MANPATH` env var if set properly.  However, something I have noticed is that if man pages are placed in certain directories then macOS will dynamically update the search path for man pages, which is quite handy when you know how it works. 👍

That said, personally 🙋‍♂️ I'd avoid fiddling with the `$MANPATH` env var because I don't know how portable it would be across various environments, ie. shells, and terminals, and also systems, ie. Linux, Darwin, etc etc.

So going back to the beginning of this circle _bare with me_ I primarily use asdf for erlang, elixir, ocaml, and ruby.  Personally, I have migrated away from using asdf to manage Node.js runtimes, and Python environments with other version manager tools.  So when I still need to work with erlang and elixir it's quite nice to pop open a man page to figure some stuff out, which is something I haven't been able to do when installing erlang or elixir via asdf.

So from hacking away at man pages this morning, I came to the conclusion that when I install elixir on macOS there are indeed man pages located in the install dir path;

> 👇path to where asdf installs precompiled language files for elixir on my macOS box.

```conf
/opt/Code/github/public/version-managers/asdf/installs/elixir/[MAJOR.MINOR.PATCH]
```

add whatever **major** **minor** and **patch** version of elixir is installed on the system, for my use case it would be `1.7.4`. The "stock" contents of a elixir 1.7.4 install on my box looks like,

```conf
╰─λ pwd                                                                                       
/opt/Code/github/public/version-managers/asdf/installs/elixir/1.7.4
```

```conf
╰─λ l                                                                                         
total 44K
drwxr-xr-x 11 capin staff  352 Nov  4 12:18 ./
drwxr-xr-x  3 capin staff   96 Nov  4 12:18 ../
drwxr-xr-x  3 capin staff   96 Nov  4 12:18 .mix/
drwxr-xr-x 11 capin staff  352 Oct 25 03:40 bin/
drwxr-xr-x  8 capin staff  256 Nov  4 12:18 lib/
drwxr-xr-x  9 capin staff  288 Oct 25 03:41 man/
-rw-r--r--  1 capin staff  15K Oct 25 03:40 CHANGELOG.md
-rw-r--r--  1 capin staff  12K Oct 25 03:40 LICENSE
-rw-r--r--  1 capin staff  825 Oct 25 03:40 NOTICE
-rw-r--r--  1 capin staff 7.3K Oct 25 03:40 README.md
-rw-r--r--  1 capin staff    5 Oct 25 03:40 VERSION
```

and the first thing pops out to me is the **man** directory.  There are in fact a couple of man pages within that directory that are useful for working with `mix`, `iex`, and `elixir` commands from a shell.  However, with a stock install of asdf on macOS, `/usr/bin/man` is unable to locate those man pages in the directory listed above.  However, extending from my previous comments, if I run

```shell
man -d iex
```

I'll see something like, towards the end / bottom of STDOUT

<strong>OUTPUT</strong>

```conf
No manual entry for iex
```

However v2, if I remove `/path/to/asdf/shims` and `/path/to/asdf/bin` from `$PATH` and add `/opt/Code/github/public/version-managers/asdf/installs/elixir/1.7.4/bin` to my `$PATH`, and verify the above path to the elixir bins are indeed in my `$PATH`

```shell
echo $PATH
```

> The above should output the newly added bin directory where asdf installed the elixir bins, **not** the symlinked shell scripts that reside in the **shims** directory.  Now I can execute,

```shell
man -d iex
```

and notice how macOS uses manpath mappings to locate certain man pages for binaries located in various paths throughout the system.  So noticing that, and doing a little troubleshooting, ie. trial & error I came to the conclusion if I add a **share/man/man1** directory in within the elixir install path, ie.

```conf
/opt/Code/github/public/version-managers/asdf/installs/elixir/[MAJOR.MINOR.PATCH]/share/man/man1
```

and then run

```shell
man -d iex
```

I get something like the below;

<strong>OUTPUT</strong>

```conf
not executing command:
  (cd '/opt/Code/github/public/version-managers/asdf/installs/elixir/1.7.4/share/man' && (echo ".ll 11.2i"; echo ".nr LL 11.2i"; /bin/cat '/opt/Code/github/public/version-managers/asdf/installs/elixir/1.7.4/share/man/man1/iex.1') | /usr/bin/tbl | /usr/bin/groff -Wall -mtty-char -Tascii -mandoc -c | (/usr/bin/less -is || true))
```

now that macOS has mapped `/path/to/asdf/install/elixir/version/share/man/man1`

I can read the man page for iex from within any directory on my system without having to explicitly set the path to the man page, and I did not need to fiddle with any super user; ie. root owned files on the system for man page configuration.  So all in all I made some progress with understanding how man pages work on macOS. However v3, this isn't a permanent solution but rather an explanation of what is going on with man pages on macOS, and hopefully begins a dialogue of how we should get asdf to read man pages from languages, runtimes, various other utilities asdf manages.

cheers 🍻<br>
Chris

</details>

---

<a id="man-page-directory-layout"></a>

## `man` page directory layout [🔝](#contents)

| Directory | Section | Name |
| --------- | ------- | ---- |
| man1      | (1)     | User Commands |
| man2      | (2)     | System Calls |
| man3      | (3)     | Subroutines |
| man4      | (4)     | Devices |
| man5      | (5)     | File Formats |
| man6      | (6)     | Games |
| man7      | (7)     | Miscellaneous |
| man8      | (8)     | Sys. Administration |
| manl      | (l)     | Local |
| mann      | (n)     | New |
| mano      | (o)     | Old |

<a id="my-man-page-journey-hacking-away-at-asdf"></a>

### My man page journey _hacking away at asdf_ [🔝](#contents)

The main asdf script located in `$HOME/.asdf/bin/` and respectively called `asdf` relies on `bash` pulling it in from the current `env`.

Updated `help.txt` to reflect the coming changes, ie.

```shell
asdf install <name> <version> --with-docs
```

install flag.

Most if not all asdf commands are shell script **functions**

<a id="my-man-page-journey-working-with-bash"></a>

### My man page journey _working with bash_ [🔝](#contents)

To check a bash script for syntax errors, but not run the script

```shell
bash -n mr_fancy_script
```

<a href="useful-links"></a>

## Useful Links [🔝](#contents)

- [Creating plugins](https://github.com/asdf-vm/asdf/blob/master/docs/creating-plugins.md)
- [asdf plugins repository](https://github.com/asdf-vm/asdf-plugins)
- [asdf plugin list](https://github.com/asdf-vm/asdf-plugins/tree/master/plugins)

### Medium [🔝](#contents)

- [Switching to ASDF version manager](https://medium.com/@sidneyliebrand/switching-to-asdf-version-manager-eb6569e4e562)

<a href="todos"></a>

## TODOs [🔝](#contents)

- [ ] figure out a sane way to get man pages working with languages installed via asdf
