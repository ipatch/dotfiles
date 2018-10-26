# Ruby Tooling

<a id="contents"></a>

## Contents

- [Ruby](#ruby)
- [Working with shell commands in Ruby source files](#working-with-shell-cmds-in-rb-files)

<a id="ruby"></a>

## Ruby [🔝](#contents)

> Notes regarding the Ruby programming language

To lint, ie. check a ruby source file for syntax errors

```shell
ruby -c /path/to/mr-fancy-42.rb
```

<a id="working-with-shell-cmds-in-rb-files"></a>

### Working with system / shell commands in ruby files [🔝](#contents)

To execute a shell command within a Ruby source file

```ruby
`echo 'hello from shell`
```

An alternative to the above syntax is to use **system** instead of a pair of back ticks, ie. <kbd>\`</kbd><kbd>\`</kbd>

```ruby
system "echo 'hello from shell'"
```

> I had better results using back ticks as opposed to using **system** for storing information into and out of variables.
