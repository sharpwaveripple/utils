#!/usr/bin/env bash

emacs_path=~/bin
emacs_dir=${emacs_path}/emacs
emacs_repo=https://github.com/emacs-mirror/emacs.git

if [[ -d ${emacs_dir} ]]; then
    echo "Emacs found in ${emacs_path}, updating to latest version"
    cd ${emacs_dir}
    sudo git pull
else
    echo "Emacs not found in ${emacs_path}, cloning from ${emacs_repo}"
    sudo git clone ${emacs_repo} ${emacs_dir} 
fi

cd ${emacs_dir}
sudo ./autogen.sh
sudo ./configure \
    --with-mailutils \
    --with-json \
    --with-modules \
    --with-xwidgets \
    --with-imagemagick \
    --with-cairo
    # --with-x-toolkit=lucid

sudo make
sudo make install
