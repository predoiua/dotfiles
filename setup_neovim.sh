#!/usr/bin/env bash

set -e          # Exit on error
# set -o pipefail # Exit on pipe error
set -x          # Enable verbosity

#######################
# NEOVIM
#######################

mandatory_apps=(nvim git python3 node npm stow)
for app in ${mandatory_apps[@]}; do
    if ! command -v $app > /dev/null; then
        echo "$app is not installed. Please install it."
        exit 1
    fi
done

NVIM=$HOME/.neovim
mkdir -p $NVIM

# AppImage in case the computer does not have a fallback nvim (appimage does not self update)
if command -v nvim > /dev/null; then
    echo "NVIM appears to be installed"
else
    mkdir -p $NVIM/bin
    cd $NVIM/bin
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    mv nvim.appimage nvim
    cd -
fi

# Create Python3 environment
if [[ ! -d $NVIM/py3 ]]; then
    python3 -m venv $NVIM/py3
    PIP=$NVIM/py3/bin/pip
    $PIP install --upgrade pip
    $PIP install neovim
    $PIP install 'python-language-server[all]'
    $PIP install pylint isort jedi flake8
    $PIP install black yapf
fi

# Create node env
# install-node.now.sh/lts  it's invalid.
#if [[ ! -d $NVIM/node ]]; then
#    mkdir -p $NVIM/node
#    NODE_SCRIPT=/tmp/install-node.sh
#    curl -sL install-node.now.sh/lts -o $NODE_SCRIPT
#    chmod +x $NODE_SCRIPT
#    PREFIX=$NVIM/node $NODE_SCRIPT -y
#    PATH="$NVIM/node/bin:$PATH"
#    npm install -g neovim
#fi

if command -v npm > /dev/null; then
    mkdir -p $NVIM/node/bin
    ln -s $(which node) $NVIM/node/bin/node
    npm install -g neovim
else
    echo "npm not found. Please install with nvm"
    echo "https://github.com/nvm-sh/nvm"
fi

program=vim
stow -v --target=$HOME $program
echo "Done $program"
echo "Please execute :PlugInstall inside nvim"