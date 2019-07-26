"==============================================================================
" vim 内置配置
"==============================================================================
set nocompatible " 关闭兼容模式
set nu " 设置行号
set cursorline " 突出显示当前行
"set cursorcolumn " 突出显示当前列
set showmatch " 显示括号匹配
set noeb " 不要提示音
set incsearch " 实时搜索
"set ignorecase "搜索忽略大小写
set hlsearch " 高亮搜索关键词
set nobackup " 不要备份文件
set noswapfile " 不要swap文件
set confirm " 退出确认
set wildmenu " 命令行补全提示

" 保持在光标上下的最少行数
set scrolloff=10

" 指定tag文件路径
set tags=./.tags;,.tags

" 命令历史数
set history=1000

" 补全配置
set completeopt=preview,longest,menu

" tab 缩进
set tabstop=4 " 设置Tab长度为4空格
"set expandtab " tab替换成空格
set shiftwidth=4 " 设置自动缩进长度为4空格
set autoindent " 继承前一行的缩进方式，适用于多行注释

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

" 打开上次编辑的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 保存时自动清除尾部空白符
autocmd BufWritePre * :%s/\s\+$//e

" 退出插入模式指定类型的文件自动保存
" au InsertLeave *.go,*.sh,*.py,*.c,*.cpp write

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

" 可以在导航目录中看到git信息
Plug 'Xuyuanp/nerdtree-git-plugin'

" 可以在文档中显示git信息
Plug 'airblade/vim-gitgutter'

" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'

" 可以快速对齐的插件
Plug 'junegunn/vim-easy-align'

" 自动补全括号的插件，包括小括号，中括号，以及花括号
"Plug 'jiangmiao/auto-pairs'

" 代码自动完成，安装完插件还需要额外配置才可以使用
Plug 'Valloric/YouCompleteMe'

" go 主要插件
Plug 'fatih/vim-go', { 'tag': '*' }

" go 中的代码追踪，输入 gd 就可以自动跳转
Plug 'dgryski/vim-godef'

" markdown 插件
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" 自动生成tags
Plug 'ludovicchabant/vim-gutentags'

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

" 窗口切换
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" 没有指定文件/目录时，自动启动NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" 显示行号
let NERDTreeShowLineNumbers=0
" 打开文件时是否显示目录
let NERDTreeAutoCenter=0
" 是否显示隐藏文件
let NERDTreeShowHidden=0
" 设置宽度
let NERDTreeWinSize=30
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 打开 vim 文件及显示书签列表
let NERDTreeShowBookmarks=0

"==============================================================================
"  nerdtree-git-plugin 插件
"==============================================================================
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeShowIgnoredStatus = 1

"==============================================================================
" vim-easy-align 插件
"==============================================================================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"==============================================================================
"  Valloric/YouCompleteMe 插件
"==============================================================================
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"

"==============================================================================
" vim-go 插件
"==============================================================================
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:godef_split=2

"==============================================================================
"  markdown 插件
"==============================================================================
map <silent> <Leader>m <Plug>MarkdownPreview

"==============================================================================
"  vim-gutentags 插件
"==============================================================================
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

