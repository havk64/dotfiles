syntax on
filetype plugin indent on

" ===-------------------------------===
" Vim-Plug configuration:
call plug#begin()

Plug 'tpope/vim-sensible'

" Git plugin = Fugitive
Plug 'tpope/vim-fugitive'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToogle' }

" Syntastic
Plug 'scrooloose/syntastic'

" Lightline
Plug 'itchyny/lightline.vim'

" Completion
Plug 'valloric/youcompleteme'

" R Plugin
Plug 'jalvesaq/Nvim-R'

" Flow Plugin
Plug 'flowtype/vim-flow'

call plug#end()
"===--------------------------------===
" Config for C lang = Completion(YCM)
let g:ycm_global_ycm_extra_conf = "~/.config/nvim/.ycm_extra_conf.py"

"===--------------------------------===
"Nvim-R configuration:
"
"------------------------------------
" Behavior
"------------------------------------
let maplocalleader = ","
let mapleader = ";"
noremap <Leader>W :w !sudo tee % > /dev/null

"------------------------------------
" Appearance
"------------------------------------
" www.vim.org/scripts/script.php?script_id=3292
colorscheme southernlights

"------------------------------------
" Search
"------------------------------------
set infercase
set hlsearch
set incsearch

"------------------------------------
" Nvim-R
"------------------------------------
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
" End of Nvim-R config
" ===--------------------------------===

