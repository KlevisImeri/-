#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

cp -rf "$DOTFILES_DIR/.git" ~/.git

for item in "$DOTFILES_DIR"/* "$DOTFILES_DIR"/.*; do
    basename=$(basename "$item")
    [[ "$basename" == "." || "$basename" == ".." || "$basename" == ".git" ]] && continue
    cp -rf "$item" ~/"$basename"
done

sudo dnf update

sudo dnf install -y \
    git \
    chromium-browser \
    firefox \
    pip \
    age \
    flameshot \
    adb \
    pactl \
    python3 \
    udisks2 \
    udiskie \
    fd-find \
    ripgrep \
    jq

pip install pulsemixer

repos=(
  "git@github.com:KlevisImeri/ssh.git $HOME/.ssh"
  "git@github.com:KlevisImeri/alacritty.git $HOME/.config/alacritty"
  "git@github.com:KlevisImeri/i3.git $HOME/.config/i3"
  "git@github.com:KlevisImeri/nvim.git $HOME/.config/nvim"
  "git@github.com:KlevisImeri/i3status.git $HOME/.config/i3status"
  "git@github.com:KlevisImeri/opencode.git $HOME/.config/opencode"
)

for entry in "${repos[@]}"; do
url=($entry)
path=${url[1]}
if [ -d "$path" ]; then
 echo "Removing $path..."
 rm -rf $path
fi
echo "Cloning $path..."
git clone "${url[0]}" "$path"
  $path/setup.sh
done

source ~/.bashrc
