function test_256_color --description 'display all 256 terminal colors'
  for code in (seq 0 255)
    echo -e "\e[38;05;"$code"m $code: Test\e[38m"
  end
end

# Inspiration:
# https://github.com/chriskempson/base16-shell/issues/5#issuecomment-21001859
