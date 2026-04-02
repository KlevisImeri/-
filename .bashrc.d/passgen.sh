passgen() {
  openssl rand -base64 "${1:-16}"
}
