function posix_source

  # REF: http://lewandowski.io/2016/10/fish-env/
  # TODO: QUESTION: is it beneficial to strip surrounding double quotes

  for i in (cat $argv)
    if test (echo $i | sed -E 's/^[[:space:]]*(.).+$/\\1/g') != "#"
      set arr (echo $i |tr = \n)
      set -gx $arr[1] $arr[2]
    end
  end

  echo "close terminal or kill tmux pane when done with vars"
end 
