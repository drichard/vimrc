" solarized
syntax enable
set background=dark
" next 3 options for vim in terminal
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" from http://mislav.uniqpath.com/2011/12/vim-revisited/
set nocompatible                " choose no compatibility with legacy vim
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

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
nnoremap : ;

" unmap arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

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

"" disable toolbar in gvim
if exists("+guioptions")
  "" set guioptions-=T
  set guifont=Menlo:h12
endif

" set colorscheme again, fixing a bug in gvim where syntax would not be bold
autocmd VimEnter * colorscheme solarized
