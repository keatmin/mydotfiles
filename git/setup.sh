#!/bin/sh
git config --global core.editor nvim 
git config --global gpg.format ssh
# git config --global user.signingkey /PATH/TO/.SSH/KEY.PUB
# Push to same name
# git config --global commit.gpgsign true
git config --global init.defaultbranch main
git config --global commit.template "$(pwd)/git/.gitmessage.txt"
git config --global core.excludesFile "$(pwd)/git/.gitignore_global"

git config --global push.default current

