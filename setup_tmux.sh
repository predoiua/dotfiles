
#######################
# BIN
#######################

function pull_repo() {
    cd $1
    git pull
    cd -
}

#######################
# TMUX
#######################

if [[ ! -d $HOME/.tmux/plugins/tpm ]]; then
    mkdir -p $HOME/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi
pull_repo $HOME/.tmux/plugins/tpm


program=tmux
stow -v --target=$HOME $program
echo "Done $program"