to_delete=(.bashrc .bash_profile .bash_logout .bash_login)
for file in ${to_delete[@]}; do
    rm -f $HOME/$file
done

program=bash
stow -v --target=$HOME $program
echo "Done $program"