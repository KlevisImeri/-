ai() {
  if [ $# -eq 0 ]; then
    local SRC TMPFILE
    TMPFILE=$(mktemp)
    if [ -n "$AI_DEBUG" ]; then
      opai 2>&1 | tee "$TMPFILE"
      SRC=$(grep '^source ' "$TMPFILE")
    else
      SRC=$(opai 2>/dev/null | grep '^source ')
    fi
    SRC="${SRC#source }"
    rm -f "$TMPFILE"
    [ -n "$SRC" ] && source "$SRC"
  else
    opai "$@"
  fi
}
