<a href="contents"></a>

## Contents

<a href="working-with-rust"></a>

## Working with rust

> [rust](https://www.rust-lang.org/en-US/) provides a language management tool known as [rustup](https://github.com/rust-lang-nursery/rustup.rs) that is useful for managing different version of the rust programming language, and the the toolchain itself.

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

<a href="working-with-cargo"></a>

## Working with Cargo CLI, and crates

To generate a top level list of installed crates via cargo

```shell
cargo install --list
```

The file, **cargo-installed-crates.rogue** in this directory is generated using the below command

```shell
cargo install --list > $dots/lang/rust/cargo-installed-crates.rogue
```

<a href="rust-useful-links"></a>

### rust Useful Links
- [**GitHub** rustup](https://github.com/rust-lang-nursery/rustup.rs)
- [rustup.rs](https://rustup.rs/)
