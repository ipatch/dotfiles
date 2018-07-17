## Contents
- [Using asdf with rust](#using-asdf-with-rust)
- [asdf-vm Gotchas](#gotchas)
- [My man page journey](#my-man-page-journey)
- [man page directory layout](#man-page-directory-layout)
- [My man page journey hacking away at asf](#my-man-page-journey-hacking-away-at-asdf)
- [My man page journey working with bash](#my-man-page-journey-working-with-bash)
- [Useful Links](#useful-links)
  - [medium](#medium)
- [TODOs](#todos)

<a href="using-asdf-with-rust"></a>

## Using asdf with rust

As of June 22 2018 asdf does not play well with [rust](https://www.rust-lang.org/en-US/) ...surprise surprise. 🤷

Fortunately rust provides its own language manager 👍

> Homebrew can cause complications when using the official rust installer, it is adviced to use `rustup` provided by http://www.rust-lang.org/en-US/

<a href="asdf-vm-gotchas"></a>

## asdf-vm gotchas

When installing a specific version of ruby ie, 2.3.6 make sure to run the below command

```fish
asdf reshim ruby
```

After the above command is run, the shell environment should find specific gems related to that version of Ruby.

```fish
which rails
```

should output,

> /$HOME/.asdf/shims/rails

To fix nodejs with the current release `0.4.1` of `asdf` delete `node` and `npm` located in `$HOME/.asdf/shims` see [🙈](https://github.com/asdf-vm/asdf/issues/239#issuecomment-339296677)

<a href="my-man-page-journey"></a>

## My man page journey

**Q** Where are `man` pages located on macOS?

**A** `man` pages are stored in various locations on the system.

On macOS `manpath` will output all the the `PATH`s `man` looks for man pages on the system.

On Debian `manpath` will output all the `PATH`s `man` looks for man pages on the system.

🚨 Setting `MANPATH` on either macOS or Debian is problematic because both OSes look for `MANPATH` entries from a supplied system file.  For that reason, I am going to try and avoid setting `MANPATH` on both systems, but rather symlink the man pages to a directory that is writable for the current user running asdf.

<a href="man-page-directory-layout"></a>

## `man` page directory layout

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

<a href="my-man-page-journey-hacking-away-at-asdf"></a>

### My man page journey _hacking away at asdf_

The main asdf script located in `$HOME/.asdf/bin/` and respectively called `asdf` relies on `bash` pulling it in from the current `env`.

Updated `help.txt` to reflect the coming changes, ie.

```fish
asdf install <name> <version> --with-docs
```

install flag.

Most if not all asdf commands are shell script **functions**

<a href="my-man-page-journey-working-with-bash"></a>

### My man page journey _working with bash_

To check a bash script for syntax errors, but not run the script

```bash
bash -n mr_fancy_script
```

<a href="useful-links"></a>

## Useful Links
- [Creating plugins](https://github.com/asdf-vm/asdf/blob/master/docs/creating-plugins.md)
- [asdf plugins repository](https://github.com/asdf-vm/asdf-plugins)
- [asdf plugin list](https://github.com/asdf-vm/asdf-plugins/tree/master/plugins)

### Medium
- [Switching to ASDF version manager](https://medium.com/@sidneyliebrand/switching-to-asdf-version-manager-eb6569e4e562)

<a href="todos"></a>

## TODOs
- [ ] figure out a sane way to get man pages working with languages installed via asdf

