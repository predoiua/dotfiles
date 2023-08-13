## predoiua's dotfiles
based on JJGO's Dotfiles

They are designed for a BASH + TMUX + NEOVIM stack on RHEL.
- [neovim](https://github.com/neovim/neovim)
- [tmux](https://github.com/tmux/tmux/wiki)

## Alma8
~~~
nmtui  # connect net, set hostname
hostnamectl set-hostname alma8.work.vv10.eu
yum install epel-release
yum install git python3 stow tmux tar
~~~

Neovim
~~~
#yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
yum install -y neovim python3-neovim
~~~

Node
~~~
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
nvm
source ~/.bashrc
nvm install --lts   #                  Install the latest LTS version
nvm use --lts       #                  Use the latest LTS version
~~~

Dotfiles
~~~
git clone https://github.com/predoiua/dotfiles.git
cd ~/dotfiles

~~~

## Original
- `./shell-setup.sh` – will bootstrap the shell environment including
  - [fasd](https://github.com/clvv/fasd) - Autojump
  - [fzf](https://github.com/junegunn/fzf) - Fuzzy Search
  - [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) - Better git diff
  - [prezto](https://github.com/sorin-ionescu/prezto) - ZSH framework
  - [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) - ZSH syntax highlight
  - [powerlevel10k](https://github.com/romkatv/powerlevel10k) - ZSH prompt
  - Rust CLI apps - [fd-find](https://github.com/sharkdp/fd), [ripgrep](https://github.com/BurntSushi/ripgrep), [tldr](https://github.com/dbrgn/tealdeer) and more
  
- `./setup_all.sh` - Will link dotfiles using `stow` (or python's `dploy`). 
