"colorscheme delek

syntax on
set nocompatible

set noerrorbells
let mapleader=" " 

"set tabstop=4 
set softtabstop=4
set shiftwidth=4
set smarttab 
set expandtab
set autoindent
set breakindent

set number
set relativenumber
set smartcase
set incsearch

set ttyfast

" set hlsearch

" For copy-cut-paste
" vnoremap <C-c> "+y
" vnoremap <C-x> "+d
" map <C-p> "+P
set clipboard=unnamedplus
" Pastemode? 
" This makes vim turn paste mode on/off automatically when you paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

" Remaps
set timeout
set timeoutlen=400
" For newlines
nnoremap <leader>o o<Esc>0"_D
nnoremap <leader>O O<Esc>0"_D

" In insert
inoremap jj <Esc>
inoremap "" ""<Esc>i
inoremap '' ''<Esc>i
inoremap () ()<Esc>i

" for c
autocmd Filetype c inoremap {<CR> {<C-o>o}<C-o>O<tab>
autocmd Filetype c inoremap ;; <Esc>A;<Esc><Esc>

" for python
autocmd Filetype python inoremap :<CR> :<C-o>o<tab>


" Plugins
" Vim plugged autoinstall
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'dbakker/vim-paragraph-motion'
call plug#end()

colorscheme gruvbox
set background=dark
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

" for tree
" let g:newtrw_browse_split=2
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()

" For disabling autocomment next line
" Has to be at end for some reason
au Filetype * set fo-=c fo-=r fo-=o

" File finding
set path+=**
set wildmenu

" For windows
set switchbuf="useopen"
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>b :buffers<CR>:buffer<space>
nnoremap <leader><leader>e :Vex!<CR>
nnoremap <leader><leader>o :Hex<CR>
nnoremap <leader><leader>i :Ex<CR>
autocmd Filetype netrw nnoremap <leader>u :bwipe<CR>


