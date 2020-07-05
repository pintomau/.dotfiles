syntax on                   " syntax highlight
set number                  " show line numbers

filetype plugin indent on
set autoindent

set hlsearch                " search highlight
set incsearch               " highlight search while typing

set hidden                  " allows opening other files without losing changes
set ruler                   " show cursor position

set ignorecase              " case-insensitive search
set smartcase               " but case-sensitive if search contains capital letter

set showcmd                 " display incomplete commands

set wildmenu
set wildmode=longest:list,full

set backspace=indent,eol,start " intuitive backspacing

set clipboard=unnamedplus,unnamed " copy to OS clipboard by default
