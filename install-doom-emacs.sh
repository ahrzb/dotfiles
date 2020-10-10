#!/bin/sh

# Refer to https://github.com/hlissner/doom-emacs#install
git clone --depth 1 https://github.com/hlissner/doom-emacs "$HOME/.emacs.d"
~/.emacs.d/bin/doom install
