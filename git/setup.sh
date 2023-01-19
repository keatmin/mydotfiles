#!/bin/sh
git config --global core.editor nvim 
git config --global commit.template ~/.gitmessage.txt
git config --global push.default current
