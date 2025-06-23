# Dotfiles

GNU Stow is used for handling my dotfiles.

> GNU Stow is a symlink farm manager. It creates symlinks for all of the files and folders inside of the directory you pass to it. It then places these symlinks in the parent directory of where you run it.


## Prerequisites

- GNU Stow
- Git

To install these prerequisites in Arch (btw) which my daily driver
```
$ sudo pacman -S stow git
```

## Setup and Installation

Clone the repo in your system and `cd` into it.

```
$ git clone git@github.com:raahimfareed/.dotfiles.git
$ cd .dotfiles
```

Then run the `stow` command to create necessary symlinks

```
$ stow .
```


### Adopt

If a file already exists in the filesystem, the stow won't work by default. This is where `--adopt` flag comes in.

This command will tell stow to move any conflicting files into the dotfiles directory. Although, the dotfiles will be overwritten by conflicting files but they can be roll back using git.

```
$ stow --adopt .
```

You can also delete the dotfiles or rename it to avoid the conflict and then rerun stow
