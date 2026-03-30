# Make word deletion behaves like bash
autoload -Uz select-word-style
select-word-style bash

# Fix Ctrl+Left/Ctrl+Right keys
bindkey '\e[1;5D' backward-word
bindkey '\e[1;5C' forward-word

# Lazy-load nvm (defers ~200ms of shell startup)
_lazy_nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}
nvm() { _lazy_nvm; nvm "$@"; }
node() { _lazy_nvm; node "$@"; }
npm() { _lazy_nvm; npm "$@"; }
npx() { _lazy_nvm; npx "$@"; }

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

# Load fzf (pre-generated to avoid subprocess on every shell start)
source ~/.fzf-completion.zsh
