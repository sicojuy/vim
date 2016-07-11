set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'vim-scripts/txt.vim'
Plugin 'fatih/vim-go'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/vim-easy-align'
Plugin 'ShowTrailingWhitespace'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ


" Put your non-Plugin stuff after this line

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

set laststatus=2

set nocompatible

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8

nnoremap <F9> :set nu!<CR>

nnoremap <F10> :set paste!<CR>

set completeopt=preview,menu

syntax enable
set background=dark
colorscheme solarized

set noeb

set confirm

set autoindent
set cindent
set smartindent

set expandtab

set softtabstop=4
set shiftwidth=4

set number

set history=1000

set nobackup
set noswapfile

set ignorecase

set hlsearch

set langmenu=zh_CN.UTF-8
set helplang=cn

set cmdheight=2

set viminfo+=!

set iskeyword+=_,$,@,%,#,-

set wildmenu

set mouse=i
set selection=exclusive
set selectmode=mouse,key

set fillchars=vert:\ ,stl:\ ,stlnc:\

set showmatch

set matchtime=1

au BufRead,BufNewFile *  setfiletype txt

set completeopt=longest,menu

" Trim suffix space
autocmd BufWritePre * :%s/\s\+$//e

" Golang
let g:go_fmt_autosave = 0

" NERD Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERT Tree shortkey
map  <c-l> <c-w>l
map  <c-h> <c-w>h

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Jump to the postion quited when open file
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Fix delete key
set backspace=indent,eol,start
