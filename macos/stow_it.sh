#!/usr/bin/env bash
# Install all Stow packages as dotfiles for OsX

target=~/

stow bash -t $target -vvv
stow emacs -t $target -vvv
