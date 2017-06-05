#!/usr/bin/env bash
# Installs Emacs 25.2 on Ubuntu 14.04 LTS

emacs_dist=ftp://ftp.gnu.org/pub/gnu/emacs/emacs-25.2.tar.gz
sig_file=ftp://ftp.gnu.org/pub/gnu/emacs/emacs-25.2.tar.gz.sig
emacs_src=~/emacs_src
emacs_dir="emacs-25.2/"

bye() {
    echo "Failed!"
    exit
}
mkdir ~/emacs_src && cd "$emacs_src" || bye
curl -O "$emacs_dist" 
curl -O "$sig_file"
# Check pgp signature
gpg --recv-keys 7C207910
gpg --verify "$(basename $sig_file)" "$(basename $emacs_dist)"
tar zxvf "$(basename $emacs_dist)"
[[ -d $emacs_dir ]] && cd "$emacs_dir" || bye
sudo apt-get install -y libncurses5-dev
[[ -f configure ]] && ./configure
make
