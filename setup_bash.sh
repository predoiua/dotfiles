to_delete=(.bashrc .bash_profile .bash_logout .bash_login)
for file in ${to_delete[@]}; do
    rm -f $HOME/$file
done

programs="bash env"
for program in $programs; do
    stow -v --target=$HOME $program
done
echo "Done bash"