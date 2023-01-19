#!/bin/sh
git config --global core.editor nvim 
git config --global commit.template ~/.gitmessage.txt
git config push.default current
