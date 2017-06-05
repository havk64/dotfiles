#!/usr/bin/env bash
# Installs Emacs 25.2 on Ubuntu 14.04 LTS

emacs_dist=ftp://ftp.gnu.org/pub/gnu/emacs/emacs-25.2.tar.gz
sig_file=ftp://ftp.gnu.org/pub/gnu/emacs/emacs-25.2.tar.gz.sig
emacs_src=~/emacs_src
emacs_dir="$(basename $emacs_dist)"

mkdir ~/emacs_src && cd "$emacs_src" || exit
curl -O "$emacs_dist" 
curl -O "$sig_file"
# TODO check signature
tar zxvf "$(basename $emacs_dist)"
[[ -d $emacs_dir ]] && cd "$emacs_dir" || exit
[[ -f configure ]] && ./configure
make
