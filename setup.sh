#!/usr/bin/env bash

git clone https://github.com/bhilburn/powerlevel9k.git ${HOME}/.oh-my-zsh/custom/themes/powerlevel9k

git clone https://github.com/powerline/fonts.git --depth=1

cd fonts

./install.sh

cd ..
rm -rf fonts