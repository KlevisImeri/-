terminal() {
  for cmd in "$TERMINAL" gnome-terminal konsole alacritty kitty xterm; do
    if command -v "$cmd" &>/dev/null; then
      case "$(basename "$cmd")" in
        gnome-terminal) "$cmd" -- "$@" ;;
        alacritty|xterm) "$cmd" -e "$@" ;;
        kitty) "$cmd" "$@" ;;
        konsole) "$cmd" -e "$@" ;;
      esac
      return
    fi
  done
  echo "No terminal emulator found" >&2
  return 1
}
