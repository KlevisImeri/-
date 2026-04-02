nvim() {
  if [[ -n "$NVIM" ]]; then
    local files=() dirs=()
    for arg in "$@"; do
      if [[ -d "$arg" ]]; then
        dirs+=("$arg")
      else
        files+=("$arg")
      fi
    done
    if [[ ${#dirs[@]} -gt 0 ]]; then
      for d in "${dirs[@]}"; do
        command nvim --server "$NVIM" --remote-send ":cd ${d}<CR>"
      done
    fi
    if [[ ${#files[@]} -gt 0 ]]; then
      command nvim --server "$NVIM" --remote "${files[@]}"
    fi
  else
    command nvim "$@"
  fi
}
