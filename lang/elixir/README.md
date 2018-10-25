# Elixir Tooling

<a id="contents"></a>

## Contents

- [Building Erlang v21.0.5 from source using asdf](#building-erlang-from-source-using-asdf)

<a id="building-erlang-from-source-using-asdf"></a>

## Building Erlang v21.0.5 from source using asdf

> When building Erlang v21.0.5 from source temporarily remove GNU build of packages, ie. **m4** from the $PATH or Erlang will not successfully compile on macOS.

```shell
asdf install erlang 21.0.5
```
