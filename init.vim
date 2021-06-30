call plug#begin()
" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'ncm2/ncm2-cssomni'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ncm2/nvim-typescript', {'do': './install.sh'}
Plug 'ncm2/ncm2-vim'
Plug 'ncm2/ncm2-html-subscope'
" Lint and code style
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'jiangmiao/auto-pairs'
call plug#end()

set termguicolors
colorscheme gruvbox
let g:gruvbox_contrast_light="hard"
let g:gruvbox_contrast_dark="hard"

set ignorecase
set hidden
set number
set mouse=a
set inccommand=split
set autoindent
set ruler

let mapleader=","
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-f> :Ag<space>

" Options for the autocomplete menu ncm2
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Lint and code style
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint']
\}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \   'javascript': [
  \       'eslint',
  \   ],
  \   'typescript': [
  \       'tslint',
  \   ],
  \}

" Custom functions to change between light and dark themes
function! Light()
    echom "set bg=light"
    set bg=light
    colorscheme gruvbox
    set list
endfunction

function! Dark()
    echom "set bg=dark"
    set bg=dark
    colorscheme gruvbox
    set nocursorline
    set nolist
endfunction

" change scheme to dark
nnoremap <leader>csd :call Dark()<CR>
" change scheme to light
nnoremap <leader>csl :call Light()<CR>
