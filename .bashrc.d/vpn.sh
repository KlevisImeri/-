# VPN helpers. Authenticate interactively, then let NetworkManager manage the VPN.

# ETH student VPN
eth-up() (
  unset COOKIE FINGERPRINT CONNECT_URL RESOLVE

  auth=$(openconnect --authenticate \
    --useragent=AnyConnect \
    --no-external-auth \
    --authgroup=student-net \
    --user=imerik@student-net.ethz.ch \
    sslvpn.ethz.ch) || return

  eval "$auth" || return
  [ -n "$COOKIE" ] || return 1

  nmcli connection up ETH passwd-file /proc/self/fd/5 5<<EOF
vpn.secrets.cookie:$COOKIE
vpn.secrets.gwcert:$FINGERPRINT
vpn.secrets.gateway:$CONNECT_URL
vpn.secrets.resolve:$RESOLVE
EOF
)

eth-down() {
  nmcli connection down ETH
}
