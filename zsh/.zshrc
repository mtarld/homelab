# Set VIM as default editor
export EDITOR="vim"

# Apply theme on fzf
export FZF_DEFAULT_OPTS="--tmux --color=info:#768390,bg+:#2d333b,border:#768390,gutter:#22272e,prompt:#d0b46f,pointer:#d0b46f"

# Set starship config location
export STARSHIP_CONFIG=~/homelab/starship/starship.toml

export TMUXINATOR_CONFIG=~/homelab/tmuxinator/

# Make word deletion behaves like bash
autoload -Uz select-word-style
select-word-style bash

# Fix Ctrl+Left/Ctrl+Right keys
bindkey '\e[1;5D' backward-word
bindkey '\e[1;5C' forward-word

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Load brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Load starship
eval "$(starship init zsh)"

# Load syntax highlight
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/homelab/zsh/github-syntax-highlighting.zsh

# Load aliases
source ~/homelab/zsh/aliases.zsh

# Load Symfony CLI completions
source ~/.symfony_completion

# Load fzf
source <(fzf --zsh)
