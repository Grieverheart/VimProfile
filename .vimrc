set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'

call vundle#end()

syntax on
filetype plugin indent on
au BufNewFile,BufRead *.mako set filetype=mako

let g:molokai_original = 1
if has('gui_running')
    colorscheme molokai "wombat
else
    let g:rehash256 = 1
    colorscheme molokai "wombat256
endif

set number

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set nobackup
set nowritebackup

set hidden

set incsearch
set hlsearch

let mapleader=','
nmap <silent><leader>m : <C-U>bn<CR>
nmap <silent><leader>M : <C-U>bp<CR>

let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error
    if s:uname == "Linux"
        set guifont=Inconsolata-g\ for\ Powerline\ Medium\ 11
        "set guifont=Inconsolata\ Medium\ 11
    elseif s:uname == "Darwin"
        set guifont=Menlo\ Regular\ for\ Powerline:h11
    endif
endif

"Tagbar config
let g:tagbar_sort=0

"Airline config
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr  = '¶'
set laststatus=2
set ttimeoutlen=50

set showtabline=2 " always show tabs in gvim, but not vim
" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
    let label = ''
    let bufnrlist = tabpagebuflist(v:lnum)
    " Add '+' if one of the buffers in the tab page is modified
    for bufnr in bufnrlist
        if getbufvar(bufnr, "&modified")
            let label = '+'
            break
        endif
    endfor
    " Append the tab number
    let label .= v:lnum.': '
    " Append the buffer name
    let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
    if name == ''
        " give a name to no-name documents
        if &buftype=='quickfix'
            let name = '[Quickfix List]'
        else
            let name = '[No Name]'
        endif
    else
        " get only the file name
        let name = fnamemodify(name,":t")
    endif
    let label .= name
    " Append the number of windows in the tab page
    "let wincount = tabpagewinnr(v:lnum, '$')
    "return label . '  [' . wincount . ']'
    return label
endfunction

set guitablabel=%{GuiTabLabel()}

