call plug#begin(stdpath('data') . '/plugged')

Plug 'rakr/vim-one'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme one
set background=light

nmap <C-P> :FZF<CR>
