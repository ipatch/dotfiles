# Rust Tooling

<a id="contents"></a>

## Contents

- [Working with rust](#working-with-rust)
- [Working with cargo](#working-with-cargo)
- [Useful Links](#rust-useful-links)

<a id="working-with-rust"></a>

## Working with rust [🔝](#contents)

### Troubleshooting `rustup`

To install a specific rust toolchain using **rustup**

```shell
rustup install night-2019-02-13-x86_64-apple-darwin
```

To check the build status of the individual tools that comprise a rust tooling environment [see](https://rust-lang-nursery.github.io/rust-toolstate)

```shell
https://rust-lang-nursery.github.io/rust-toolstate/
```

> [rust](https://www.rust-lang.org/en-US/) provides a language management tool known as [rustup](https://github.com/rust-lang-nursery/rustup.rs) that is useful for managing different version of the rust programming language, and the the toolchain itself.

To update alacritty [see](https://github.com/ipatch/dotfiles/wiki/terminal-emulator-Notes#upgrading-alacritty-on-macos)

To update the available versions of the rust programming language using rustup

```shell
rustup update
```

To verify which toolchain is active use

```shell
rustup show
```

To update **rustup.rs** toolchain management script itself

```shell
rustup self update
```

To switch to a different rust toolchain

```shell
rustup override set stable
```

For more information about working with **rustup.rs** [see](https://github.com/rust-lang-nursery/rustup.rs/)

<a id="working-with-cargo"></a>

## Working with Cargo CLI, and crates [🔝](#contents)

To generate a top level list of installed crates via cargo

```shell
cargo install --list
```

The file, **cargo-installed-crates.rogue** in this directory is generated using the below command

```shell
cargo install --list > $dots/lang/rust/cargo-installed-crates.rogue
```

<a id="updating-crates-with-cargo"></a>

### Updating crates via cargo

Cargo does not provide a native means for updating crates, ie. packages that have been installed with cargo, however there is a crate / package that can be installed via cargo and update global crates.

To install **cargo-update** crate via cargo.

```shell
cargo install cargo-update
```

To list installed packages or crates installed via cargo

```shell
cargo install --list
```

To update **all** crates / packages using **cargo-update**

```shell
cargo install-update -a
```

To check and see if a single package / crate can be updated

```shell
cargo install-update [PACKAGE-NAME] --list
```

To update a single package or crate

```shell
cargo install-update [PACKAGE-NAME]
```

<a id="rust-useful-links"></a>

## rust Useful Links [🔝](#contents)

- [**GitHub** rustup](https://github.com/rust-lang-nursery/rustup.rs)
- [rustup.rs](https://rustup.rs/)
