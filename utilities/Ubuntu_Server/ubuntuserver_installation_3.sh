#!/usr/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

source ~/.bashrc
