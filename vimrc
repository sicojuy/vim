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

Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/ShowTrailingWhitespace'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'fatih/vim-go'
Plugin 'luochen1990/rainbow'
Plugin 'Valloric/YouCompleteMe'


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

" enable 256 color
set t_Co=256

" 总是显示状态行
set laststatus=2

" 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible

" 编码设置
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8

" set line number
map <c-n> :set nu!<CR>

" set paste
map <c-p> :set paste!<CR>

" 代码补全
set completeopt=preview,menu

" 语法高亮
syntax enable
set background=dark
colorscheme solarized

" 去掉输入错误的提示声音
set noeb

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 自动缩进
set autoindent
" set cindent
" set smartindent

" 空格代替TAB
set expandtab

" Tab键的宽度
set softtabstop=4
set shiftwidth=4

" 显示行号
set number

" 历史记录数
set history=1000

" 禁止生成临时文件
set nobackup
set noswapfile

" 搜索忽略大小写
set ignorecase

" 搜索字符高亮
set hlsearch

" 语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

" 命令行（在状态行下）的高度
set cmdheight=1

" 保存全局变量
set viminfo+=!

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 增强模式中的命令行自动完成操作
set wildmenu

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=i
set selection=exclusive
set selectmode=mouse,key

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1

" 打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

" 去掉行尾空白符
autocmd BufWritePre * :%s/\s\+$//e

" 打开目录树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" golang-vim 不要自动格式化
let g:go_fmt_autosave = 0

" 记录上一次退出时的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" nerdtree tab shortkey
map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-m> :NERDTreeToggle<CR>

" 修复delete失效
set backspace=indent,eol,start

" 括号高亮
let g:rainbow_active = 1
