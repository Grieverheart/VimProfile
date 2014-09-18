call pathogen#infect()

syntax on
filetype plugin indent on
au BufNewFile,BufRead *.mako set filetype=mako

if has('gui_running') 
    colorscheme monokai "wombat
else
    colorscheme monokai "wombat256
endif

set number

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set nobackup
set nowritebackup

set incsearch
set hlsearch

"set guifont=Inconsolata\ Medium\ 11

let g:tagbar_sort=0

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

