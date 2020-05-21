#!/bin/bash

usr=$(whoami)
pkg_dir=~/.vim/pack/"$usr"/start
mkdir -p "$pkg_dir"
cd "$pkg_dir"

git clone https://github.com/liuchengxu/space-vim-dark.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/easymotion/vim-easymotion.git
git clone https://github.com/tpope/vim-commentary.git
git clone https://github.com/tpope/vim-repeat.git
git clone https://github.com/tpope/vim-sensible.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/tpope/vim-unimpaired.git
git clone https://github.com/tpope/vim-vinegar.git
git clone https://github.com/Vimjas/vim-python-pep8-indent.git
git clone https://github.com/Shougo/deoplete.nvim.git
git clone https://github.com/roxma/nvim-yarp.git
git clone https://github.com/roxma/vim-hug-neovim-rpc.git
git clone https://github.com/davidhalter/jedi-vim.git
git clone https://github.com/zchee/deoplete-jedi.git
git clone https://github.com/jalvesaq/Nvim-R.git


#https://stackoverflow.com/questions/48700563/how-do-i-install-plugins-in-neovim-correctly
