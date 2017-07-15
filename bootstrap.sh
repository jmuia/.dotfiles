#!/usr/bin/env bash

function safe_symlink {
    if [ -f "$2" ]; then
        mv "$2" "$2.bak"
    fi
    ln -s "$1" "$2"
}

if ! type "brew" > /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade
brew bundle

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

safe_symlink $PWD/karabiner.json $HOME/.config/karabiner/karabiner.json
safe_symlink $PWD/gitconfig $HOME/.gitconfig

