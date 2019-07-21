function test_true_color --description 'test to see if fish shell & term support true 24bit color'
  awk 'BEGIN{
    s="/\\\/\\\/\\\/\\\/\\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
  }'
end


# The above function came from the below gist
# https://gist.github.com/XVilka/8346728

# NOTE: added `\\\` in order for function to work with fish shell.