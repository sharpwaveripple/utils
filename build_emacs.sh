#!/usr/bin/env bash

emacs_path=~/bin
emacs_dir=${emacs_path}/emacs
emacs_repo=https://github.com/emacs-mirror/emacs.git

if [[ -d ${emacs_dir} ]]; then
    echo "Emacs found in ${emacs_path}, updating to latest version"
    cd ${emacs_dir}
    git pull
else
    echo "Emacs not found in ${emacs_path}, cloning from ${emacs_repo}"
    git clone ${emacs_repo} ${emacs_dir}
fi

# https://emacs.stackexchange.com/questions/59538/compile-emacs-from-feature-native-comp-gccemacs-branch-on-ubuntu

export CC=/usr/bin/gcc-10 CXX=/usr/bin/gcc-10

cd ${emacs_dir}
git checkout feature/native-comp
make distclean
./autogen.sh
./configure \
    --with-mailutils \
    --with-json \
    --with-modules \
    --with-xwidgets \
    --with-imagemagick \
    --with-cairo \
    --with-nativecomp \
    CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer"
    # --with-x-toolkit=lucid

# if ever in doubt, use ./configure --help
# gconf-service
