# Homelab

Personal system configuration: dotfiles, application configs, and bootstrap instructions.
The goal is not to automate everything, but to make the setup understandable, repeatable, and easy to evolve over time.

## Disclaimer

This repository is opinionated and tailored to my workflow and machines.
It assumes:
- Ubuntu-based system
- manual review before running commands
- a user-level setup, not a multi-user or server environment

Clone, adapt, and reuse ideas, but do not expect a one-command install or universal defaults.

## Installation and configuration

### Bat
https://github.com/sharkdp/bat

```sh
sudo apt update
sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```

### Castor
https://castor.jolicode.com

```sh
curl "https://castor.jolicode.com/install" | bash
```

### Composer
https://getcomposer.org

```sh
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'c8b085408188070d5f52bcfe4ecfbee5f727afa458b2573b8eaaf77b3419b0bf2768dc67c86944da1544f06fa544fd47') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
mkdir -p ~/.local/bin ~/.config/composer
ln -s ~/homelab/composer/composer.json ~/.config/composer/composer.json
composer update
```

### Delta
https://github.com/dandavison/delta

```sh
brew install git-delta
```

### Docker
https://www.docker.com

```sh
sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc | cut -f1)
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Editorconfig
https://editorconfig.org

```sh
ln -s ~/homelab/editorconfig/.editorconfig ~/.editorconfig
```

### Font
https://www.nerdfonts.com/font-downloads

```sh
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Agave.zip -O /tmp/Agave.zip
unzip /tmp/Agave.zip -d /tmp/Agave
cp /tmp/Agave/*.{ttf,otf} ~/.local/share/fonts/
fc-cache -fv
```

### Fzf
https://github.com/junegunn/fzf

```sh
sudo apt update
sudo apt install fzf
fzf --zsh > ~/.fzf-completion.zsh
```

### Git
https://git-scm.com

```sh
sudo apt update
sudo apt install git
vim ~/.gitconfig.local
# Then edit file like the following
# [user]
#     name = Your name
#     email = Your email
ln -s ~/homelab/git/.gitconfig ~/.gitconfig
```

### Homebrew
https://brew.sh

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Lsd
https://github.com/lsd-rs/lsd

```sh
sudo apt update
sudo apt install lsd
ln -s ~/homelab/lsd ~/.config/lsd
```

### Nvim
https://neovim.io

```sh
brew install neovim
ln -s ~/homelab/nvim ~/.config/nvim
```

### Nvm
https://github.com/nvm-sh/nvm

```sh
# Check github for the nvm latest version
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

### Php
https://www.php.net

```sh
brew install php
brew install php@8.4
brew install php@8.1
```

### Phpactor
https://github.com/phpactor/phpactor

```sh
curl -Lo phpactor.phar https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar
chmod a+x phpactor.phar
mv phpactor.phar ~/.local/bin/phpactor
ln -s ~/homelab/phpactor ~/.config/phpactor
```

### Phpcsfixer
https://github.com/PHP-CS-Fixer/PHP-CS-Fixer

```sh
ln -s ~/homelab/php-cs-fixer ~/.config/php-cs-fixer
```

### Regolith
https://regolith-desktop.com

```sh
wget -qO - https://archive.regolith-desktop.com/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null
echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://archive.regolith-desktop.com/ubuntu/stable plucky v3.3" | \
sudo tee /etc/apt/sources.list.d/regolith.list
sudo apt update
sudo apt install regolith-desktop regolith-session-flashback regolith-look-lascaille
ln -s ~/homelab/regolith ~/.config/regolith3
# Then, restart the system
```


### Starship
https://starship.rs

```sh
curl -sS https://starship.rs/install.sh | sh
```

### Symfony CLI
https://symfony.com/download

```sh
curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
sudo apt install symfony-cli
symfony completion zsh > ~/.symfony_completion
```

### Tmux
https://github.com/tmux/tmux

```sh
sudo apt update
sudo apt install tmux
ln -s ~/homelab/tmux/.tmux.conf ~/.tmux.conf
```

### Tmuxinator
https://github.com/tmuxinator/tmuxinator

```sh
brew install tmuxinator
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O /usr/local/share/zsh/site-functions/_tmuxinator
mkdir ~/.tmuxinator
```

### Wezterm
https://wezterm.org/index.html

```sh
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
sudo apt update
sudo apt install wezterm
ln -s ~/homelab/wezterm/.wezterm.lua ~/.wezterm.lua
```

### Spotify player
https://github.com/aome510/spotify-player

```sh
brew install spotify_player
ln -s ~/homelab/spotify/app.toml ~/.config/spotify-player/app.toml
ln -s ~/homelab/spotify/theme.toml ~/.config/spotify-player/theme.toml
```

### Xclip
https://doc.ubuntu-fr.org/xclip

```sh
sudo apt update
sudo apt install xclip
```

### Claude Code
https://claude.ai/code

```sh
npm install -g @anthropic-ai/claude-code
ln -s ~/homelab/claude/AGENTS.md ~/.claude/AGENTS.md
ln -s ~/homelab/claude/settings.json ~/.claude/settings.json
mkdir -p ~/.claude/agents ~/.claude/skills
ln -s ~/homelab/claude/agents/review.md ~/.claude/agents/review.md
ln -s ~/homelab/claude/skills/simplify ~/.claude/skills/simplify
ln -s ~/homelab/claude/skills/implement ~/.claude/skills/implement
```

### Zsh
https://en.wikipedia.org/wiki/Z_shell
https://github.com/zsh-users/zsh-syntax-highlighting

```sh
sudo apt update
sudo apt install zsh zsh-syntax-highlighting
ln -s ~/homelab/zsh/.zshrc ~/.zshrc
ln -s ~/homelab/zsh/.zshenv ~/.zshenv
```
