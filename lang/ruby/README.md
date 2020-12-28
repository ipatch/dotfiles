# Ruby Tooling

## Contents

<a id="contents"></a>

- [Ruby](#ruby)
- [Working with shell commands in Ruby source files](#working-with-shell-cmds-in-rb-files)


## Ruby [🔝](#contents)

<a id="ruby"></a>

> Notes regarding the Ruby programming language

To lint, ie. check a ruby source file for syntax errors

```shell
ruby -c /path/to/mr-fancy-42.rb
```

### Working with system / shell commands in ruby files [🔝](#contents)

<a id="working-with-shell-cmds-in-rb-files"></a>

To execute a shell command within a Ruby source file

```ruby
`echo 'hello from shell`
```

An alternative to the above syntax is to use **system** instead of a pair of back ticks, ie. <kbd>\`</kbd><kbd>\`</kbd>

```ruby
system "echo 'hello from shell'"
```

> I had better results using back ticks as opposed to using **system** for storing information into and out of variables.

## working with bundler

To install a specific gem for a specific bundle, ie. insert a gem into the local Gemfile with the version specified

```shell
bundle add [gem]
```

> open the the `Gemfile` and move to appropriate group if needed

