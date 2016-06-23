#!/usr/bin/env bash

if ! type "brew" > /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade
brew bundle

if ! grep -Fxq "/usr/local/bin/zsh" /etc/shells ; then
    sudo bash -c "echo /usr/local/bin/zsh >> /etc/shells"
fi

chsh -s /usr/local/bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

ln -s .gitconfig ~/.gitconfig
