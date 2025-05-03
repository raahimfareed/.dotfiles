#!/usr/bin/env sh

github="https://github.com/raahimfareed/.dotfiles.git"
printf "This script is made for Arch linux!\n"
printf "Please refer to %s for full instructions\n" $github
read -n1 -p "Do you want to continue? [Y/n] " yn
yn=${yn:-Y}
printf "\n"
if [ "$yn" = "Y" ] || [ "$yn" = "y" ]; then
    printf "Installing stow...\n"
    sudo pacman -S stow

    printf "Setting up dotfiles...\n"
    git clone $github $HOME/.dotfiles
    cd $HOME/.dotfiles
    stow --adopt .
    printf "Done!\n"
else
    printf "Aborting...\n"
fi

