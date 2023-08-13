#!/usr/bin/env zsh
set -x
set -e

#######################
# BIN
#######################

function pull_repo() {
    cd $1
    git pull
    cd -
}



#######################
# ZSH
#######################
if [[ ! -d $HOME/.zprezto ]]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
fi
cd $HOME/.zprezto
git pull
git submodule update --init --recursive
cd - 

mkdir -p $HOME/.zsh

# Fast syntax highlighting
if [[ ! -d $HOME/.zsh/fast-syntax-highlighting ]]; then
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $HOME/.zsh/fast-syntax-highlighting
fi
pull_repo $HOME/.zsh/fast-syntax-highlighting


#######################
# RUST
#######################

if [[ ! -d $HOME/.rustup ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

for crate in bat fd-find ripgrep exa tealdeer procs ytop hyperfine bandwhich
do
    $HOME/.cargo/bin/cargo install $crate
done
