set nocompatible                " choose no compatibility with legacy vim
filetype off

" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on       " required!

" solarized
syntax enable
set background=dark
" next 3 options for vim solarized in terminal
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" from http://mislav.uniqpath.com/2011/12/vim-revisited/
set encoding=utf-8
set showcmd                     " display incomplete commands

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" http://nvie.com/posts/how-i-boosted-my-vim/
let mapleader=","
set hidden
set autoindent
set visualbell           " don't beep
set noerrorbells         " don't beep

set number                      " line numbers
nnoremap ; :
" nnoremap : ;

" unmap arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Edit vimrc \ev
nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>

" Run current script in ruby
nnoremap <silent> <Leader>r :w<CR> :! ruby % <CR>

" Switch between two last files
nnoremap <leader><leader> <c-^>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
inoremap <C-Space> <C-n>

" clear search hl by pressing ESC
nnoremap <CR> :nohlsearch<CR>/<BS>

set nobackup                    " no backup or swap file  
set noswapfile

" flush commandT cache when window regains focus or files have been written
augroup CommandTExtension
  autocmd!
  autocmd FocusGained * CommandTFlush
  autocmd BufWritePost * CommandTFlush
augroup END

set wildignore=tmp/**

if has("gui_running")
  " disable toolbar in gvim
  set guioptions-=T
  
  " hide scrollbars (buggy on gvim ubuntu)
  set guioptions+=LlRrb
  set guioptions-=LlRrb

  " set different fonts for mac and linux
  if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
      set guifont=Menlo:h12
    else
      set guifont=DejaVu\ Sans\ Mono\ 10
    endif
  endif
endif
