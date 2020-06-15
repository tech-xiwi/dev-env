#!/bin/sh
sudo apt update && sudo apt upgrade -y
sudo apt install conky-all tmux git-flow git-lfs xfonts-utils colormake -y
fc-cache -fv

CONFIG_HOME=~/dev-env

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "~/.dev-env" ] && die "~/.dev-env already exists."

# cd "$CONFIG_HOME"
# git submodule update --init

cd ~
ln -sf ./dev-env/.bashrc .bashrc
ln -sf ./dev-env/.conkyrc .conkyrc
ln -sf ./dev-env/.fbtermrc .fbtermrc
ln -sf ./dev-env/.gitconfig .gitconfig
ln -sf ./dev-env/.kermrc .kermrc
ln -sf ./dev-env/.tmux.conf .tmux.conf
ln -sf ./dev-env/.vim .vim
ln -sf ./dev-env/.vim/vimrc .vimrc
ln -sf ./dev-env/.Xdefaults .Xdefaults
ln -sf ./dev-env/.zshrc .zshrc
ln -sf ./dev-env/.gtkrc-2.0 .gtkrc-2.0

# cd "${CONFIG_HOME}/.vim"
# git submodule update --init

echo "Your configuration files has been installed."

cd "$CONFIG_HOME"
