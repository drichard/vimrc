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
Bundle 'tomasr/molokai'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'lukaszb/vim-web-indent'
Bundle 'kchmck/vim-coffee-script'
Bundle 'wavded/vim-stylus'
Bundle 'nono/vim-handlebars'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-markdown'

filetype plugin indent on       " required!

" solarized
syntax enable
set background=dark

" next 3 options for vim solarized in terminal
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" Defaults
set encoding=utf-8
set showcmd                     " display incomplete commands

" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault                    " search globally default

" http://nvie.com/posts/how-i-boosted-my-vim/
let mapleader=","
set hidden
set autoindent

" dont tell me when an open file has changed, simply load it
set autoread

" disable beep and visual bell
set noeb vb t_vb=

set number                      " line numbers
nnoremap ; :
" nnoremap : ;

" move between tabs with t/T
nnoremap t gt
nnoremap T gT

" use arrow keys to resize windows
nmap <silent> <left>  :5wincmd <<cr>
nmap <silent> <right> :5wincmd ><cr>
nmap <silent> <up>    :5wincmd +<cr>
nmap <silent> <down>  :5wincmd -<cr>

" Edit vimrc \ev
nnoremap <silent> <Leader>ev :e ~/.vimrc<CR>

" reload vimrc when it's saved
" au BufWritePost .vimrc so ~/.vimrc

" Run current script in ruby
nnoremap <silent> <Leader>r :w<CR> :! ruby % <CR>

" Switch between two last files
nnoremap <leader><leader> <c-^>

" select just pasted text
nnoremap <leader>v V`]

" vertical split window and focus it
nnoremap <leader>w <C-w>v<C-w>l

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
inoremap <C-Space> <C-n>

" clear search hl by pressing ESC
nnoremap <CR> :nohlsearch<CR>/<BS>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

" improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

map <F8> :Explore<CR>

" swap/backup
set swapfile
set dir=~/tmp
set backupdir=~/tmp

" Wrap on text files
autocmd BufNewFile,BufRead *.markdown,*.md,*.txt,*.rst setlocal wrap linebreak

" Save all when focus is lost, skip untitled buffers
:au FocusLost * silent! wa
:au FocusLost * call feedkeys("\<C-\>\<C-n>") " Return to normal mode on FocustLost

" In vim 7.3.74 and higher you can set clipboard=unnamedplus to alias unnamed
" register to the + register, which is the X Window clipboard.
set clipboard=unnamedplus

" compile coffeescript on save and focus lost
"au BufWritePost *.coffee silent CoffeeMake! -b | cwindow
"au FocusLost *.coffee silent CoffeeMake! -b | cwindow

" modify coffeescript syntax highlighting with solarized.
" @members were red, should be blue instead
hi link coffeeParen NONE
hi link coffeeSpecialVar Identifier

" Ack vim
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack 

" Powerline
set laststatus=2
let Powerline_symbols = 'fancy'

" flush commandT cache when window regains focus or files have been written
augroup CommandTExtension
  autocmd!
  autocmd FocusGained * CommandTFlush
  autocmd BufWritePost * CommandTFlush
augroup END

cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>T :CommandTFlush<cr>\|:CommandT %%<cr>

set wildignore=tmp/**,*node_modules/**,bin/**,~/workspace/mindmaps/docs

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
      set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
    endif
  endif
endif

" Parse local vimrc (useful for per-project settings)
if filereadable(".lvimrc")
  source .lvimrc
endif
