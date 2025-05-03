#!/bin/sh
github="https://github.com/raahimfareed/.dotfiles.git"
printf "This was made for Arch Linux!\n"
printf "Please refer to %s for full instructions\n" $github
read -n1 -p "Do you want to continue? [Y/n] " yn
yn=${yn:-Y}
printf "\n"
if [ "$yn" = "Y" ] || [ "$yn" = "y" ]; then
    printf "Installing dotfiles...\n"
    git clone $github $HOME/.dotfiles
    cd $HOME/.dotfiles
    for i in $(find .[^.]* * -type f -print)
    do
        filepath="${i%/*}"
        # Does not continue for .git folder
        if [[ "$filepath" == ".git"* ]]; then
            continue
        fi
        printf "Copying %s to %s\n" $i "$HOME/$i"
        if [[ "$i" != "$filepath" && ! -d "${filepath}" && ! "${filepath}" =~ ^\. ]]; then
            mkdir -p "$HOME/$filepath"
        fi
        cp "./$i" "$HOME/$filepath"
    done

    printf "Done!\n"
else
    printf "Aborting...\n"
fi

