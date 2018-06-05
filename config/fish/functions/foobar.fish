function foobar --description "a nolvety function to aid my understanding of fish"

echo "function `foobar` was executed"

set FOO	mr-fancy-bar

echo "The output of FOO = $FOO"

# NOTE: the below statement will echo the literally not executing the `set` builtin command for fish
echo "(set -S FOO)"
# OUTPUT: `(set -S FOO)`

# NOTE: the below statement will echo the output of the `set` builtin fish command
echo (set -S FOO)
# OUTPUT: `$FOO: set in local scope, ...`

end
