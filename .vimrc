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
set ignorecase
set smartcase
set incsearch

set ttyfast
" set hlsearch
" colorscheme delek


" For copy-cut-paste
set clipboard=unnamedplus
" This makes vim turn paste mode on/off automatically when you paste?
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

" Remaps
set timeout
" set ttimeout
set timeoutlen=500
" set ttimeoutlen=10

" Statusline
" set statusline=%=\ %p%%\ %m\ %f
set laststatus=2

" For newlines
nnoremap <leader>o o<Esc>0"_D
nnoremap <leader>O O<Esc>0"_D

" For indent
vnoremap > >gv
vnoremap < <gv

" For delete
nnoremap <leader>d "_d
nnoremap x "_x
vnoremap x "_x

" In insert
inoremap jj <Esc>
inoremap "" ""<Esc>i
inoremap '' ''<Esc>i
inoremap () ()<Esc>i
inoremap {} {}<Esc>i
inoremap [] []<Esc>i
inoremap $$ $$<Esc>i
inoremap <> <><Esc>i

" for c
autocmd Filetype c,javascript,rust inoremap {<CR> {<C-o>o}<C-o>O
autocmd Filetype c,javascript,rust inoremap ;; <Esc>A;<Esc><Esc>

" for python
" autocmd Filetype python inoremap :<CR> :<C-o>o<tab> YCM alerady takes care of that
autocmd Filetype python inoremap :: <Esc>A:<Esc>o

" for folds
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=10


" for tabs
nnoremap <leader><PageUp> :tabp<CR>
nnoremap <leader><PageDown> :tabn<CR>
nnoremap <leader><leader>t :tabnew<CR>:E<CR>


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
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'JuliaEditorSupport/julia-vim'
Plug 'tomlion/vim-solidity'
call plug#end()

" Colorscheme
let g:gruvbox_guisp_fallback = "bg"
" let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

" For disabling autocomment next line <C-u>
" Has to be at end for some reason
au Filetype * set fo-=c fo-=r fo-=o
" autocmd Filetype markdown setlocal com-=fb:*
" autocmd Filetype markdown setlocal com+=b:*
" autocmd Filetype markdown setlocal com+=b:1.

" File finding
set path+=**
set wildmenu

" For tags
command! MakeTags !ctags -R .

" For tree
" let g:newtrw_browse_split=2
let g:netrw_banner=0
let g:netrw_liststyle=3
" let g:netrw_list_hide=netrw_gitignore#Hide()

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
nnoremap <leader><leader>d :bd<CR>
nnoremap <silent><leader>gt :YcmCompleter GoTo<CR>
let g:ycm_autoclose_preview_window_after_insertion = 1
autocmd Filetype netrw nnoremap <leader>u :bwipe<CR>
autocmd FileType tex let g:ycm_auto_trigger=0

