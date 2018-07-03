##############################
# Load gpg-agent
##

# if type -q gpg-agent
#   source ~/.gnupg/gpg-agent.conf
#   if [ -S "{$GPG_AGNET_INFO%%:*}" ]
#     set -gx GPG_AGENT_INFO
#   else
#     # NOTE: `--write-env-file` is obsolete option
#     # NOTE: ~/.gnupg/gpg-agent.conf `use-standard-socket` is obsolete option
#     # NOTE: ~/.gnupg/gpg-agent.conf `write-env-file`
#     eval (gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf)
#   end
# end
