"Directory Settings
set directory=$HOME/.vim/swap//

filetype plugin indent on
filetype plugin on
filetype indent on
set nocompatible


call plug#begin('~/.vim/plugged')
"NERDTree
"Plug 'preservim/nerdtree'

" Vim OneDark plugin
Plug 'joshdick/onedark.vim'

" Dracula color theme
Plug 'dracula/vim', { 'as': 'dracula' }

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" Airline
Plug 'itchyny/lightline.vim'

" ALE
"Plug 'dense-analysis/ale'

"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()



set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
set showcmd

" Search -----------------------------------------------------
set hlsearch    " Highlight the search strings
set incsearch   " Move to the first match as soon as we type
" ------------------------------------------------------------


" Wildmenu ----------------------------------------------------
set wildmenu "autocomplete file name in enhance mode
set wildmode=list:longest,full " Complete till longest string,
                               " then open the wildmenu
" ---------------------------------------------------------------

" Do not wrap lines. Allow long lines
" set nowrap

" bottom status bar elimination
set noshowmode   

" enabling airline theme to display this is a work around
set laststatus=2

syntax on
colorscheme dracula


" Key Mappings ---------------------------------------------
" Window Navigation
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" tab navigation
noremap <c-right> gt
noremap <c-left> gT
"---------------------------------------------------------------------------------------------
