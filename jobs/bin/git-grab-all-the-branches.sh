#!/bin/bash

# NOTE: this bash script will only properly execute within a git repo.

for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master`;
do
  git branch --track ${branch##*/} $branch
done
