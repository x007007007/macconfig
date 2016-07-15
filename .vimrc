syntax enable
syntax on
set number
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set cursorline
set showmatch


filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

if filereadable(expand("~/.vim/vimrc.vundle.list"))
source ~/.vim/vimrc.vundle.list
endif


let g:airline#extensions#tabline#enabled = 1
let g:Powerline_symbols = 'fancy'

