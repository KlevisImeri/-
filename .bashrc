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

for d in /opt/*/bin; do
    PATH="$PATH:$d"
done


. ~/.git-prompt.sh
export EDITOR=nvim
export VISUAL=nvim
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "(%s)")'
PS1='\[\e[91m\]\u\[\e[93m\]@\[\e[95m\]\h\[\e[0m\]\[\e[96m\]\w\[\e[93m\]${PS1_CMD1}\[\e[97m\]\\$ \[\e[0m\]'

export ORACLE_BASE=/usr/lib/oracle
export ORACLE_HOME=$ORACLE_BASE/23/client64
export PATH=$ORACLE_HOME/bin:$PATH
export TNS_ADMIN=$ORACLE_HOME/lib/network/admin

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=/home/klevis/.opencode/bin:$PATH
export PATH=/home/klevis/go/bin:$PATH
