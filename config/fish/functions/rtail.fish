function rtail --description 'auto resize term window for long lines'

  # get the length of the output and store it in `output_length`
  set -g output_length (awk '{print NF}' $argv | sort -nu | tail -n 1)

  set -g term_width $COLUMNS

  # if eval $output_length > $term_witdth
  # if [ $output_length > $term_width ]
  if test $output_length > $term_width
    set $term_with = $output_length
  else
    # DO NOTHING
  end
end
