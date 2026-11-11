# VPN helpers. OpenConnect runs in the foreground; Ctrl+C disconnects.

# ETH student VPN
eth-up() {
  sudo openconnect \
    --no-external-auth \
    --useragent=AnyConnect \
    --authgroup=student-net \
    --user=imerik@student-net.ethz.ch \
    sslvpn.ethz.ch
}
