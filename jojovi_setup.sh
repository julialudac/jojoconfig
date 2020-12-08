#!/bin/sh

# TODO the nagivation can be improved by using popd/pushd instead?

used_home=~

for arg in "$@"
do
    case $arg in -s|--soft)
        used_home=fake_home
        mkdir -p $used_home/.vim/bundle
    esac
done



# Vim configurations
echo "Setting up .vimrc"
cp vimrc.jojo $used_home/.vimrc

# Installing vim pathogen
echo "Installing Vim Pathogen"
cd $used_home/.vim
mkdir -p autoload
cd autoload
if [ ! vim-pathogen.vim ]; then
    git clone https://github.com/tpope/vim-pathogen.git
    cp vim-pathogen/autoload/pathogen.vim pathogen.vim
    rm vim-pathogen -rf
else
    echo "Pathogen already exists"
fi

# Installing vim extensions (TODO this piece of code can be less repetitive ;))
echo "Installing Vim Extensions"
cd ~/.vim/bundle
if [ ! -d nerdtree ]; then
    echo "Installing NerdTree"
    git clone https://github.com/preservim/nerdtree.git
else
    echo "NerdTree already installed"
fi
if [ ! -d ctrlp.vim ]; then
    echo "Installing CtrlP"
    git clone https://github.com/kien/ctrlp.vim
else
    echo "CtrlP already installed"
fi
if [ ! -d vim-commentary ]; then
    echo "Installing Vim Commentary"
    git clone https://github.com/tpope/vim-commentary.git
else
    echo "Vim Commentary already installed"
fi
if [ ! -d delimitmate ]; then
    echo "Installing Delimitmate"
    git clone https://github.com/raimondi/delimitmate
else
    echo "Delimitmate already installed"
fi
if [ ! -d vim-fugitive ]; then
    echo "Installing Fugitive"
    git clone https://github.com/tpope/vim-fugitive
else
    echo "Fugitive already installed"
fi
if [ ! -d vim-maximizer ]; then
    echo "Installing Maximizer"
    git clone https://github.com/szw/vim-maximizer.git
else
    echo "Maximizer already installed"
fi
if [ ! -d supertab ]; then
    echo "Installing SuperTab"
    git clone https://github.com/ervandew/supertab
else
    echo "Supertab already installed"
fi
if [ ! -d emmet-vim ]; then
    echo "Installing Emmet"
    git clone https://github.com/mattn/emmet-vim.git
else
    echo "Emmet already installed"
fi


