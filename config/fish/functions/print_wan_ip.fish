# NOTE: simple func to print the WAN IP of a network interface,
#...should work on both mac and Linux.

function print_wan_ip --description "print the WAN IP"
   dig +short myip.opendns.com @resolver1.opendns.com 
end
