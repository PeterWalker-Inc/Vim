"Directory Settings
set directory=$HOME/.vim/swap//
set encoding=UTF-8
set nocompatible
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
"set nowrap

" bottom status bar elimination
set noshowmode   

" enabling airline theme to display this is a work around
set laststatus=2

filetype plugin indent on
filetype plugin on
filetype indent on


call plug#begin('~/.vim/plugged')

" Vim OneDark plugin
Plug 'joshdick/onedark.vim'
" Dracula color theme
Plug 'dracula/vim', { 'as': 'dracula' }
" syntax highlighting
Plug 'sheerun/vim-polyglot'
" Airline
Plug 'itchyny/lightline.vim'
"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Dev-icons
Plug 'ryanoasis/vim-devicons'

call plug#end()

" coc extensions ----------------------------------------------
let g:coc_global_extensions = [
            \'coc-clangd',
            \'coc-tsserver',
            \'coc-json',
            \'coc-git',
            \'coc-explorer',
            \'coc-snippets',
            \'coc-pairs',
            \'coc-html',
            \]
" --------------------------------------------------------------

" change the buffer to open directory
" Terminal can open from where it called
autocmd BufEnter * silent! lcd %:p:h

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

" Start Terminal
"open terminal below all splits
cabbrev bterm bo term
set termwinsize=10x0
" End Terminal

" Move lines up and down
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" coc-pairs auto insert cursor on next line
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
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
" have vim start coc-explorer if vim started with folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'CocCommand explorer' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"quit explorer whein it's the last
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif


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

vmap <space>c "+y
nmap <space>v "+p
