#!/bin/bash

# This script will install the necessary configuration for zsh and bash completion
#
# Sebastian Bachmann <hello@reox.at>, 2016

echo "Installation of zsh completion"
echo

if [[ -f ~/.zshrc ]]; then
    read -p "Would you like to create a backup of your .zshrc? [Yn]" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cp -i ~/.zshrc ~/.zshrc.bak_kdb
    fi
fi

cat <<HERE >>~/.zshrc
### generated by kdb install-completion
autoload -U compinit && compinit
zmodload -i zsh/complist
### end of generated by kdb install-completion
HERE
echo "installed zsh completion configuration"

if [[ -f ~/.bashrc ]]; then
    read -p "Would you like to create a backup of your .bashrc? [Yn]" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cp -i ~/.bashrc ~/.bashrc.bak_kdb
    fi
fi

cat <<HERE >>~/.bashrc
### generated by kdb install-completion
# Linux
if [ -d /etc/bash_completion.d ]; then
    . /etc/bash_completion.d
fi
# OS X
if [ -d /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi
### end of generated by kdb install-completion
HERE
echo "installed bash completion configuration"

