#!/bin/sh

FOO="fooie text"

echo "$FOO"

if expr "$FOO" : ".*text" >/dev/null; then echo "matched";
fi
