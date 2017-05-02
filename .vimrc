filetype plugin indent on
syntax on

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
:execute "helptags " . g:opamshare . "/merlin/vim/doc"

"===---------------------------------===
" Begin of R configuration
"
"------------------------------------
" Behavior
"------------------------------------
" let maplocalleader = ","
" let mapleader = ";"

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

" End of R configuration
" ====-------------------------------:===

" Vim-Plug configuration
call plug#begin()

" Sensivble Vim
Plug 'tpope/vim-sensible'

" Fugitive Vim
Plug 'tpope/vim-fugitive'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" R Plugin
Plug 'jalvesaq/Nvim-R'

" Vim-Go Plugin
Plug 'fatih/vim-go', {'for': 'go'}

" Completion
Plug 'valloric/youcompleteme', {'do': './install.py'}

" Vimtex
Plug 'lervag/vimtex'

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" Bats syntax highlight
Plug 'vim-scripts/bats.vim'

call plug#end()
