nvim() {
  if [[ -n "$NVIM" ]]; then
    local files=() dirs=()
    for arg in "$@"; do
      local resolved
      resolved=$(realpath -m "$arg")
      if [[ -d "$resolved" ]]; then
        dirs+=("$resolved")
      else
        files+=("$resolved")
      fi
    done
    if [[ ${#dirs[@]} -gt 0 ]]; then
      for d in "${dirs[@]}"; do
        command nvim --server "$NVIM" --remote-send ":tcd ${d}<CR>"
      done
    fi
    if [[ ${#files[@]} -gt 0 ]]; then
      command nvim --server "$NVIM" --remote "${files[@]}"
    fi
  else
    command nvim "$@"
  fi
}

cd() {
  builtin cd "$@" || return
  if [[ -n "$NVIM" ]]; then
    command nvim --server "$NVIM" --remote-send ":cd $PWD<CR>"
  fi
}
