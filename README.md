My Vim Config
=============

This is a backup of my personal .vimrc and .gvimrc files

Installation
------------

To install this config, first ensure you have ~/.vim and ~/.vim/bundle directories:
    mkdir -p ~/.vim/bundle

Next, clone this repository in your .vim directory:
    git clone https://github.com/Elzair/my-vimrc.git ~/.vim/my-vimrc

Then, copy the two vim files to your home directory:
    cp ~/.vim/my-vimrc/vimrc ~/.vimrc && cp ~/.vim/my-vimrc/gvimrc ~/.gvimrc

Now, clone the vundle repository in ~/.vim/bundle
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Finally, execute vim with the following command to install all the bundles
    vim +BundleInstall +qall

Alternatively, use **gvim** or **mvim** if you are using Gtk-Vim or MacVim
    gvim +BundleInstall +qall
    mvim +BundleInstall +qall

Requirements
------------

- Vim 7.3+ (or Gtk-Vim 7.3+ or MacVim 7.3+) with support for Python
- Python 2.7+
- Git
- JSLint (for Javascript syntax checking)
