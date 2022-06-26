set nocompatible

set number
set relativenumber

set tabstop=4
set shiftwidth=0

" Vim plug auto install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim plug
call plug#begin('~/.vim/plugged')

" Nord color scheme
Plug 'arcticicestudio/nord-vim'

" Vim-prettier
" Will also need npm install -g prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Lightline
Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-sensible'

call plug#end()

" Set color
colorscheme nord

" Lightline
set laststatus=2
set noshowmode

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ }
