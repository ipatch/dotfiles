function h --description 'display last 20 commands with timestamps'
  builtin history search -R -20 --show-time="%a %m-%d %R "
end
