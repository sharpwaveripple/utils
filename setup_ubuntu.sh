#!/usr/bin/env bash

# for passwordless sudo
echo "jon ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# basic directories
mkdir ~/bin
mkdir ~/.lib
mkdir ~/.lib/R
mkdir ~/.lib/R/4.0
mkdir ~/work

# quiet ssh keygen
cat /dev/zero | ssh-keygen -q -N "" > /dev/null

# https://cran.r-project.org/bin/linux/ubuntu/README.html
# R 4.0
echo "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/" | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

sudo -S apt update && sudo apt -y upgrade && sudo apt -y autoremove
sudo add-apt-repository ppa:ubuntu-toolchain-r/ppa
sudo -S apt update && sudo apt -y upgrade && sudo apt -y autoremove
sudo apt -y install git curl cmake

# note: these will fail if \ is followed by whitespace
sudo apt -y install \
    build-essential \
    xorg-dev \
    default-jre \
    acetoneiso \
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
    libgsl-dev \
    libsystemd-dev \
    libgnutls28-dev \
    gcc-10 \
    g++-10 \
    libgccjit0 \
    libgccjit-10-dev \
    libgcc-10-dev \
    libxpm-dev \
    libgif-dev \
    libjansson-dev \
    libwebkit2gtk-4.0-dev \
    libacl1-dev \
    libm17n-dev \
    libmagickcore-dev \
    libmagickwand-dev \
    libvterm-dev \
    libopenblas-dev \
    libgfortran4 \
    libpng-dev \
    libappindicator1 \
    npm \
    silversearcher-ag \
    zlib1g-dev \
    libpoppler-glib-dev \
    libpoppler-private-dev \
    libpoppler-glib8 \
    shellcheck \
    fd-find \
    ripgrep \
    texlive-fonts-extra \
    texlive-latex-extra \
    texlive-xetex \
    sshpass \
    latexmk \
    pandoc \
    pandoc-citeproc \
    maildir-utils \
    offlineimap \
    isync \
    gnupg2 \
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
    libxtst6 \
    libx11-xcb-dev \
    libgpm-dev \
    libncurses-dev \
    libmpfr-dev \
    flex \
    autogen \
    dejagnu \
    zstd \
    ttf-anonymous-pro

# sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 100 --slave /usr/bin/g++ g++ /usr/bin/g++-10 --slave /usr/bin/gcov gcov /usr/bin/gcov-10

# an incredible guide to texlive variants
# https://tex.stackexchange.com/questions/245982/differences-between-texlive-packages-in-linux

# rstudio - check newest version of program and os
# wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.2.5042-amd64.deb
# sudo gdebi rstudio-server-1.2.5042-amd64.deb

# configure git
git config user.email "jonathantay193@gmail.com"
git config user.name "Jonathan Tay"
git config core.editor "emacs"

# get my dotfiles
git clone https://github.com/sharpwaveripple/dotfiles.git ~/
cp ~/dotfiles/bashrc ~/.bashrc
cp ~/dotfiles/.Rprofile ~/.Rprofile

# commacd
curl -sSL https://github.com/shyiko/commacd/raw/v1.0.0/commacd.sh -o ~/.commacd.sh

# anaconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p ~/.anaconda3

sudo npm i -g bash-language-server
sudo npm i -g n        # npm package manager

sudo -S apt update && sudo apt -y upgrade && sudo apt -y autoremove

source ~/.bashrc

conda install -y numpy scipy pandas scikit-learn statsmodels \
    matplotlib seaborn \
    isort nose pytest

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

# dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd &
