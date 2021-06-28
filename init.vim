call plug#begin()
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
set background=dark

set ignorecase
set hidden
set number
set mouse=a
set inccommand=split

let mapleader=","

nnoremap <leader>; A;<Esc>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

