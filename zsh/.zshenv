# Set VIM as default editor
export EDITOR="vim"

# Apply theme on fzf
export FZF_DEFAULT_OPTS="--tmux --color=info:#768390,bg+:#2d333b,border:#768390,gutter:#22272e,prompt:#d0b46f,pointer:#d0b46f"

# Set starship config location
export STARSHIP_CONFIG=~/homelab/starship/starship.toml

export TMUXINATOR_CONFIG=~/homelab/tmuxinator/

# Load cargo
. "$HOME/.cargo/env"

# Add default nvm node to PATH so non-interactive shells (eg. MCP servers) can find node/npx
export NVM_DIR="$HOME/.nvm"
export PATH="$(find "$NVM_DIR/versions/node" -maxdepth 1 -name "v$(cat "$NVM_DIR/alias/default" 2>/dev/null)*" -print -quit 2>/dev/null)/bin:$PATH"
