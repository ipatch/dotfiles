# CREDIT: https://chr4.org/blog/2014/09/10/gittree-bash-slash-zsh-function-to-run-git-commands-recursively/

function gittree --description "Recursively traverse git repositories, with supplied command"

  # if [ $# -lt 1 ]; <= BASHism
  if not set -q argv[1] #FISHism # NOTE: the more traditional way, # if test (count $argv) -lt 1
    echo "Usage: gittree <command>"
    return 1
  end

  for gitdir in (find . -type d -name .git)
    # Display repository name in blue
    set -l repo (dirname $gitdir)
    # echo -e "\033[34m$repo\033[0m" # ANSCI C colors 👎
    echo (set_color blue)$repo(set_color normal)

    # Run git command in the repositories directory
    cd $repo; and git $argv[1]
    # ret=$? #BASHism
    set -l ret $status

    # Return to calling directory (ignore output)
    cd - > /dev/null

    # Abort if `cd` or `git` command fails
    if [ $ret -ne 0 ]
      return 1
    end

    echo
  end
end
