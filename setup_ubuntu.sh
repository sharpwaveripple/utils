#!/usr/bin/env bash

# for passwordless sudo
echo "jon ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# basic directories
mkdir ~/bin
mkdir ~/lib
mkdir ~/work

# quiet ssh keygen
cat /dev/zero | ssh-keygen -q -N "" > /dev/null

# https://cran.r-project.org/bin/linux/ubuntu/README.html
# R 4.0
echo "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/" | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

sudo -S apt update && sudo apt -y upgrade && sudo apt -y autoremove
sudo apt -y install git curl cmake

# note: these will fail if \ is followed by whitespace
sudo apt -y install \
    build-essential \
    default-jre \
    libreoffice-java-common \
    gawk \
    valgrind \
    texinfo \
    attr \
    paxctl \
    xaw3dg-dev \
    gnulib \
    libotcl1-dev \
    libotf-dev \
    libsystemd-dev \
    libgnutls28-dev \
    libxpm-dev \
    libgif-dev \
    libwebkit2gtk-4.0-dev \
    libacl1-dev \
    libm17n-dev \
    libmagickcore-dev \
    libmagickwand-dev \
    libvterm-dev \
    shellcheck \
    fd-find \
    ripgrep \
    texlive-latex-extra \
    r-base \
    r-base-dev \
    gdebi-core \
    libssl-dev \
    libcurl4-openssl-dev \
    libgl1-mesa-glx \
    libegl1-mesa \
    libxrandr2 \
    libxss1 \
    libxcursor1 \
    libxcomposite1 \
    libasound2 \
    libxi6 \
    libxtst6

# an incredible guide to texlive variants
# https://tex.stackexchange.com/questions/245982/differences-between-texlive-packages-in-linux

# rstudio - check newest version of program and os
# wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.2.5042-amd64.deb
# sudo gdebi rstudio-server-1.2.5042-amd64.deb

# configure git
git config --global user.email "jonathantay193@gmail.com"
git config --global user.name "Jonathan Tay"

# get my dotfiles
git clone https://github.com/sharpwaveripple/dotfiles.git
cp ~/dotfiles/bashrc ~/.bashrc
cp ~/dotfiles/.Rprofile ~/.Rprofile

# commacd
curl -sSL https://github.com/shyiko/commacd/raw/v1.0.0/commacd.sh -o ~/.commacd.sh

# anaconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p ~/bin/miniconda

sudo -S apt update && sudo apt -y upgrade && sudo apt -y autoremove

source ~/.bashrc

conda install -y numpy scipy pandas sklearn statsmodels matplotlib seaborn

# this is where the fun begins
emacs_ver=emacs-27
git clone -b ${emacs_ver} https://github.com/emacs-mirror/emacs.git ~/bin/${emacs_ver}

cd ~/bin/${emacs_ver}
./autogen.sh
./configure \
    --with-mailutils \
    --with-json \
    --with-modules \
    --with-xwidgets \
    --with-imagemagick \
    --with-cairo
make
sudo make install

git clone https://github.com/sharpwaveripple/.doom.d.git ~/.doom.d
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

source ~/.bashrc
