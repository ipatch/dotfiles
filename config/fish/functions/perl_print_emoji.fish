# NOTE: this fish function uses `perl` to convert 4 chars into the emoji equiv.

function perl_print_emoji --description 'print an emoji  based the 4 chars inputted'

  perl -e'
    use strict;
    use warnings;

    binmode(STDOUT, ":utf8");

    while (<>) {
      s/\\u([0-9a-fA-F]{4})/chr(hex($1))/eg;
      print;
    }
  '  
end
