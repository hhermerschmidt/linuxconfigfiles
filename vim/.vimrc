syntax on

set number

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

autocmd FileType make set noexpandtab

set foldmethod=indent
set foldlevel=99
nnoremap <space> za

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'sheerun/vim-polyglot'
Plugin 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plugin 'haishanh/night-owl.vim'
Plugin 'jacoborus/tender.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
call vundle#end()

filetype plugin indent on

let python_highlight_all=1
"colorscheme monokai

syntax enable
colorscheme tender
let g:lightline = {'colorscheme': 'tender'}
let g_airline_theme = 'tender'

" Plugins will be downloaded under the specified directory.
"call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
"Plug 'hzchirs/vim-material'

" List ends here. Plugins become visible to Vim after this call.
"call plug#end()
