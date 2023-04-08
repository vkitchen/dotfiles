call plug#begin(stdpath('data') . '/plugged')

Plug 'rakr/vim-one'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ziglang/zig.vim'

call plug#end()

colorscheme one
set background=light

set clipboard=unnamed

nmap <C-P> :GFiles<CR>
nmap <C-F> :Rg<CR>

set number relativenumber
