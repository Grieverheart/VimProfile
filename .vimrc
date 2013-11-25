call pathogen#infect()

syntax on
filetype plugin indent on

if has('gui_running') 
    colorscheme wombat
else
    colorscheme wombat256
endif

set number

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set nobackup
set nowritebackup

set guifont=Inconsolata\ Medium\ 11

let g:tagbar_sort=0

