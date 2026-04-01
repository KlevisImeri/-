# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc


alias la='ls -a'
alias ll='ls -alh'
alias pactl-hdmi='pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo && pactl set-sink-port @DEFAULT_SINK@ hdmi-output-0'
alias sleep='xset dpms force off'


. ~/.git-prompt.sh   
export EDITOR=nvim
export VISUAL=nvim
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "(%s)")'
PS1='\[\e[91m\]\u\[\e[93m\]@\[\e[95m\]\A\[\e[0m\]\[\e[96m\]\w\[\e[93m\]${PS1_CMD1}\[\e[97m\]\\$ \[\e[0m\]'

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opencode
export PATH=$HOME/.opencode/bin:$PATH
export PATH=$HOME/go/bin:$PATH

export PATH="$HOME/.local/bin:$PATH"
