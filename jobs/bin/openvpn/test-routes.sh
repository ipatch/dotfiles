#!/bin/bash
INTERFACE="en0"
VPNINTERFACE="tun0"
IPINTERFACE="$(curl -s --interface $INTERFACE http://myip.dnsomatic.com)"
echo Interface $INTERFACE IP: $IPINTERFACE
IPVPNINTERFACE="$(curl -s --interface $VPNINTERFACE http://myip.dnsomatic.com)"
echo Interface $VPNINTERFACE IP: $IPVPNINTERFACE
if [ "$IPINTERFACE" != "$IPVPNINTERFACE" ]; then
 echo "You have at least two different ip addresses. It seems you are good to go!"
 else
 echo "OMG! Dial 911 your house may catch fire"
fi
