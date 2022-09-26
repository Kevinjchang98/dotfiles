set nocompatible
filetype plugin on

" Disable startup warnings
let g:coc_disable_startup_warning = 1

" Line numbers
set number
set relativenumber

" Tab settings
set tabstop=4
set shiftwidth=0

" Netrw directory view
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_browse_split=4
let g:netrw_altv=1

" Disable continuation of comments
autocmd FileType * set formatoptions-=o

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

" Sensible
Plug 'tpope/vim-sensible'

" For GLSL
Plug 'tikhomirov/vim-glsl'

" Auto complete
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Will need to run following after first install
" :CocInstall coc-clangd coc-css coc-java coc-tsserver coc-json coc-glslx

" Emmet
Plug 'mattn/emmet-vim'

" Waka time
Plug 'wakatime/vim-wakatime'

call plug#end()

" Set color
colorscheme nord

" Lightline
set laststatus=2
set noshowmode

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ }

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Emmet

" Enable only for css and html
let g:user_emmet_install_global = 0
autocmd FileType html,css,js,jsx,ts,tsx EmmetInstall
