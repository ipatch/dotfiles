function erl_cmd_his --description 'enable shell_history for erl / iex if >= 20'
  # cheers 🍺 for tr 😎
  # return the current version of erlang / OTP installed on the local system.
  # NOTE: uncomment the below command to see diagnostic 🚕 info about the env var.
  # set -S ERL_VER
  set -x ERL_VER (erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell\
   | tr -d \r'"')

  # Enable shell history for elixir / erlang
  # Ref: https://stackoverflow.com/questions/9560815/
  switch $ERL_VER
    case '20'
      set -x ERL_AFLAGS '-kernel shell_history enabled'
    case '*'
      # echo OTP v20 is not present on this system.;
      echo 'OTP v20 is not present on this system or the `"$"PATH` is not set up properly.'
  end
end
