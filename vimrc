"==============================================================================
" vim 内置配置
"==============================================================================
set nocompatible " 关闭兼容模式
set nu           " 设置行号
set cursorline   " 突出显示当前行
set showmatch    " 显示括号匹配
set noeb         " 不要提示音
set incsearch    " 实时搜索
set ignorecase   " 搜索忽略大小写
set smartcase    " 如果有一个大写字母，则大小写敏感查找
set hlsearch     " 高亮搜索关键词
set nobackup     " 不要备份文件
set noswapfile   " 不要swap文件
set confirm      " 退出确认
set wildmenu     " 命令行补全提示
set scrolloff=10 " 保持在光标上下的最少行数
set history=1000 " 命令历史数

" 补全配置
set completeopt=menu,menuone

" tab 缩进
set expandtab    " tab替换成空格
set tabstop=4    " 设置Tab长度为4空格
set shiftwidth=4 " 设置自动缩进长度为4空格
set autoindent   " 继承前一行的缩进方式，适用于多行注释

autocmd FileType go setlocal noexpandtab
autocmd FileType javascript,html,vue,json setlocal tabstop=2 shiftwidth=2

" 修复插入模式无法delete问题
set backspace=indent,eol,start

" 设置编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" v 模式下复制内容到系统剪切板
vmap <Leader>y "+y
" n 模式下复制一行到系统剪切板
nmap <Leader>y "+yy
" n 模式下粘贴系统剪切板的内容
nmap <Leader>p "+p

" vim系统菜单及语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
set viminfo+=!

" 单词分隔符
set iskeyword+=_,$,@,%,#,-

" 命令模式快捷键
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <C-R> <C-F>

" 打开上次编辑的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 保存时自动清除尾部空白符
autocmd BufWritePre * :%s/\s\+$//e

" 退出插入模式指定类型的文件自动保存
" au InsertLeave *.go,*.sh,*.py,*.c,*.cpp write

" 窗口切换
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-c> <C-w>c

" 切换标签
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

syntax enable
syntax on                    " 开启文件类型侦测
filetype plugin indent on    " 启用自动补全

"==============================================================================
" 插件配置
"==============================================================================
" 插件开始的位置
call plug#begin('~/.vim/plugged')

" 配色方案
Plug 'morhetz/gruvbox'

" 用来提供一个导航目录的侧边栏
Plug 'scrooloose/nerdtree'

" git相关插件
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'

" 可以快速对齐的插件
Plug 'junegunn/vim-easy-align'

" 代码补全
Plug 'Valloric/YouCompleteMe'

" go插件
Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'
Plug 'buoto/gotests-vim', {'do': 'go get -u github.com/cweill/gotests/...'}

" markdown 插件
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" thrift
Plug 'solarnz/thrift.vim'

" buffer expplorer
Plug 'jlanzarotta/bufexplorer'

" vue插件
Plug 'posva/vim-vue'

" js插件
Plug 'pangloss/vim-javascript'

" 插件结束的位置，插件全部放在此行上面
call plug#end()

"==============================================================================
" 主题配色
"==============================================================================
" 开启24bit的颜色，开启这个颜色会更漂亮一些
set termguicolors
" 配色方案, 可以从上面插件安装中的选择一个使用
colorscheme gruvbox " 主题
set background=dark " 主题背景 dark or light

"==============================================================================
" NERDTree 插件
"==============================================================================
" 打开和关闭NERDTree快捷键
map <Leader>n :NERDTreeToggle<CR>

" 没有指定文件/目录时，自动启动NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" 不显示帮助提示
let NERDTreeMinimalUI=1
" 显示行号
let NERDTreeShowLineNumbers=0
" 打开文件时是否显示目录
let NERDTreeAutoCenter=0
" 是否显示隐藏文件，开关：shift+i
let NERDTreeShowHidden=0
" 设置宽度
let NERDTreeWinSize=25
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=0
" 打开帮助
let NERDTreeMapHelp='H'

"==============================================================================
" vim-easy-align 插件
"==============================================================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"==============================================================================
"  Valloric/YouCompleteMe 插件
"==============================================================================
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_gopls_binary_path = "gopls"
" let g:ycm_max_num_candidates = 20
" let g:ycm_gopls_args = ['-vv', '-profile.cpu=/tmp/cpu.pprof']

"==============================================================================
" vim-go 插件
"==============================================================================
" let g:go_fmt_command = "goimports"

"==============================================================================
"  markdown 插件
"==============================================================================
map <silent> <Leader>m <Plug>MarkdownPreview

