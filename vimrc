"Directory Settings
set directory=$HOME/.vim/swap//

filetype plugin indent on
filetype plugin on
filetype indent on
set nocompatible


call plug#begin('~/.vim/plugged')
" Vim OneDark plugin
Plug 'joshdick/onedark.vim'
" Dracula color theme
Plug 'dracula/vim', { 'as': 'dracula' }
" syntax highlighting
Plug 'sheerun/vim-polyglot'
" Airline
Plug 'itchyny/lightline.vim'
" Vinegar
Plug 'tpope/vim-vinegar'
"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Dev-icons
Plug 'ryanoasis/vim-devicons'
call plug#end()
set encoding=UTF-8

" coc extensions ----------------------------------------------
let g:coc_global_extensions = [
            \'coc-json',
            \'coc-git',
            \'coc-clangd',
            \'coc-snippets',
            \'coc-pairs',
            \'coc-tsserver',
            \'coc-explorer',
            \]
" --------------------------------------------------------------
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
colorscheme onedark
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

" -------------------------- Netrw Configs ----------------------
"let g:netrw_banner=0
"let g:netrw_liststyle=3
"let g:netrw_browse_split=0
"let g:netrw_altv=1
"let g:netrw_winsize = 25
"set autochdir
"-----------------------------------------------------------------
" ------------------------- coc-explorer configs ----------------
" Space e to open explorer
nmap <space>e :CocCommand explorer<CR>
"  --------------------------------------------------------------
" ------------ Light Line Devicons--------------------------------
let g:lightline = {
        \ 'component_function': {
        \   'filetype': 'MyFiletype',
        \   'fileformat': 'MyFileformat',
        \ } 
        \ } 
  
  function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction
  
  function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction
" ----------------------------------------------------------------

