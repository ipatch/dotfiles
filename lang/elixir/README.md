# Elixir Tooling

<a id="contents"></a>

## Contents

- [install erlang using asdf on macOS](#install-erlang-with-asdf-on-macos)
- [Working with Erlang](#working-with-erlang)

<a id="install-erlang-with-asdf-on-macos"></a>

## Installing Erlang via asdf on macOS

When installing erlang via asdf make certain **binutils** is not installed via homebrew or it will reak havoc on trying to install Erlang, thus not allowing asdf / kerl to complete the installation.  Long story short run

```shell
brew remove binutils
```

After **binutils** has been removed asdf should be able to install erlang

```shell
asdf install erlang [MAJOR.MINOR.PATCH]
```

<a id="building-erlang-from-source-using-asdf"></a>

## Building Erlang v21.0.5 from source using asdf

> When building Erlang v21.0.5 from source temporarily remove GNU build of packages, ie. **m4** from the $PATH or Erlang will not successfully compile on macOS.

```shell
asdf install erlang 21.0.5
```

<a id="working-with-erlang"></a>

## Working with Erlang

Erlang does not use OS level processes but rather sets up its own _personal_ process model within the Erlang language that sits on top of the OS process level, [learn more](https://stackoverflow.com/a/2708096/708807)
