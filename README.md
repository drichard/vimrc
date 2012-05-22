vimrc
=====

*My vim configuration* 

Themes
------

1. Solarized
2. Molokai

Plugins
-------

* vim-surround 
* vim-endwise
* vim-rails
* Fugitive    
* Command-T 
  * Needs vim compiled with ruby support
* Powerline (needs patched font)
  * https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
* Ack.vim
* vim-web-indent
  * Better JavaScript indentation
* vim-coffee-script
  * Needs coffeescript installed
* vim-stylus
* vim-handlebars
* NERDCommenter

All plugins are installed with vundle (https://github.com/gmarik/vundle/blob/master/README.md).

Installation
------------

1. Checkout out repository
2. In your home directory do:

    ln -s /path/to/repo/vimrc .vimrc

    ln -s /path/to/repo .vim
