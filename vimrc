"================================================================================
" 安装插件
"================================================================================

call plug#begin('~/.vim/plugged')

" 主题配色
Plug 'morhetz/gruvbox'

" 状态栏
Plug 'vim-airline/vim-airline'

" 显示搜索匹配数目
Plug 'google/vim-searchindex'

" 缩进线
Plug 'Yggdroot/indentLine'

" 自动高亮hover的单词
Plug 'RRethy/vim-illuminate'

" 打开文件跳到上次编辑的位置
Plug 'farmergreg/vim-lastplace'

" 文本对齐
Plug 'junegunn/vim-easy-align'

" 全文快速移动
Plug 'easymotion/vim-easymotion'

" nerdtree
Plug 'preservim/nerdtree'

" 代码补全
Plug 'Valloric/YouCompleteMe'

" 平滑滚动
Plug 'psliwka/vim-smoothie'

" 代码分隔合并
Plug 'AndrewRadev/splitjoin.vim'

" 检索
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" 通过vim写wiki
Plug 'vimwiki/vimwiki'

" markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/conflict-marker.vim'

" go
Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'

" thrift
Plug 'solarnz/thrift.vim'

" js
Plug 'pangloss/vim-javascript'

" python
Plug 'vim-python/python-syntax'

" lua
Plug 'tbastos/vim-lua'

" rust
Plug 'rust-lang/rust.vim'

" 测试vim script
Plug 'junegunn/vader.vim'

" 插件结束的位置，插件全部放在此行上面
call plug#end()

"================================================================================
" 基础配置
"================================================================================

" 根据文件类型自动设置缩进等
filetype plugin indent on

" 语法高亮设置
syntax enable

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

set nocompatible                      " 关闭兼容模式
set number                            " 设置行号
set cursorline                        " 突出显示当前行
set showmatch                         " 显示括号匹配
set noeb                              " 不要提示音
set incsearch                         " 实时搜索
set ignorecase                        " 搜索忽略大小写
set smartcase                         " 如果有一个大写字母，则大小写敏感查找
set hlsearch                          " 高亮搜索关键词
set nobackup                          " 不要备份文件
set noswapfile                        " 不要swap文件
set confirm                           " 退出确认
set wildmenu                          " 命令行补全提示
set splitright                        " 水平分隔窗口时在右边
set splitbelow                        " 垂直分隔窗口时在下面
set lazyredraw                        " 延迟绘制（提升性能）
set display=lastline                  " 显示最后一行
set scrolloff=10                      " 保持在光标上下的最少行数
set history=1000                      " 命令历史数
set completeopt=menu,menuone,noselect " 补全配置
set backspace=indent,eol,start        " 设置Backspace键模式
set formatoptions+=m                  " 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=B                  " 合并两行中文时，不在中间加空格
set ffs=unix,dos,mac                  " 文件换行符，默认使用 unix 换行符
set showtabline=2                     " 总是显示tabline
set list                              " 显示tab符号
set listchars=tab:¦\                  " 显示tab符号

" tab缩进
set autoindent   " 自动缩进，继承前一行的缩进方式
set cindent      " 打开C/C++缩进优化
set expandtab    " tab替换成空格
set tabstop=4    " 设置Tab长度为4空格
set shiftwidth=4 " 设置自动缩进长度为4空格
autocmd filetype go setlocal noexpandtab
autocmd filetype javascript,html,vue setlocal tabstop=2 shiftwidth=2

" vim系统菜单及语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
set viminfo+=!

" 单词分隔符
set iskeyword+=_,$,@,%,#,-

" 编码
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,ecu-kr,latin1

if !has('gui_running')
    set t_Co=256
endif

if has('termguicolors')
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    set termguicolors   " 开启24bit的颜色
endif

" 文件搜索和补全时忽略下面扩展名
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class
set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android

" 保存时自动清除尾部空白符
autocmd BufWritePre * :%s/\s\+$//e

"================================================================================
" 插件配置
"================================================================================

"--------------------------------------------------------------------------------
" gruvbox
"--------------------------------------------------------------------------------

colorscheme gruvbox
set background=dark " 主题背景 dark or light

"--------------------------------------------------------------------------------
" Git conflict marker
"--------------------------------------------------------------------------------

" disable the default highlight group
let g:conflict_marker_highlight_group = ''

" Include text after begin and end markers
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'

highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e

"--------------------------------------------------------------------------------
" NERDTree
"--------------------------------------------------------------------------------

let NERDTreeMinimalUI=1                    " 不显示帮助提示
let NERDTreeShowLineNumbers=0              " 显示行号
let NERDTreeWinSize=30                     " 设置宽度
let NERDTreeIgnore=['\.pyc','\~$','\.swp'] " 忽略一下文件的显示
let NERDTreeMapHelp='H'                    " 打开帮助

nnoremap <leader>n :NERDTreeMirror<CR>:NERDTreeToggle<CR>

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" 自动打开NERDTree
augroup ProjectDrawer
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
augroup END

"--------------------------------------------------------------------------------
" LeaderF
"--------------------------------------------------------------------------------

let g:Lf_HideHelp = 1
let g:Lf_ShowDevIcons = 0
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlColorscheme = 'gruvbox_material'
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']

" 模糊匹配忽略扩展名
let g:Lf_WildIgnore = {
    \ 'dir': ['.svn', '.git', '.hg'],
    \ 'file': ['*.sw?', '~$*', '*.bak', '*.exe', '*.o', '*.so', '*.py[co]']
    \ }

" MRU 文件忽略扩展名
let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']

" 禁用 function/buftag 的预览功能，可以手动用 p 预览
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

" RG搜索配置
let g:Lf_RgConfig = [
    \ "--glob=!output",
    \ "--glob=!git",
    \ "--glob=!vendor",
    \ "--glob=!mock",
    \ "--glob=!mocks",
    \ "--glob=!thrift_gen",
    \ "--glob=!kitex_gen",
    \ "--glob=!kite_gen"
\ ]

" 快捷键
let g:Lf_ShortcutF = "<c-p>"
noremap <leader>f :<C-U><C-R>=printf("LeaderfSelf %s", "")<CR><CR>
noremap <leader>ff :<C-U><C-R>=printf("LeaderfFile %s", "")<CR><CR>
noremap <leader>fb :<C-U><C-R>=printf("LeaderfBuffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("LeaderfMruCwd %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("LeaderfBufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("LeaderfLine %s", "")<CR><CR>
noremap <leader>fg :<C-U><C-R>=printf("Leaderf! rg -F %s", expand("<cword>"))<CR>
noremap <leader>fo :<C-U>Leaderf! rg --recall<CR>

"--------------------------------------------------------------------------------
" vim-easy-align
"--------------------------------------------------------------------------------

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"--------------------------------------------------------------------------------
" YouCompleteMe
"--------------------------------------------------------------------------------

let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings = 1
let g:ycm_gopls_binary_path = "gopls"
let g:ycm_gopls_args = []

" 白名单（非名单内文件不启用 YCM），避免打开个 1MB 的 txt 分析半天
let g:ycm_filetype_whitelist = {
    \ "c":1,
    \ "cpp":1,
    \ "objc":1,
    \ "objcpp":1,
    \ "python":1,
    \ "java":1,
    \ "javascript":1,
    \ "coffee":1,
    \ "vim":1,
    \ "go":1,
    \ "cs":1,
    \ "lua":1,
    \ "perl":1,
    \ "perl6":1,
    \ "php":1,
    \ "ruby":1,
    \ "rust":1,
    \ "erlang":1,
    \ "asm":1,
    \ "nasm":1,
    \ "masm":1,
    \ "tasm":1,
    \ "asm68k":1,
    \ "asmh8300":1,
    \ "asciidoc":1,
    \ "basic":1,
    \ "vb":1,
    \ "make":1,
    \ "cmake":1,
    \ "html":1,
    \ "css":1,
    \ "less":1,
    \ "json":1,
    \ "cson":1,
    \ "typedscript":1,
    \ "haskell":1,
    \ "lhaskell":1,
    \ "lisp":1,
    \ "scheme":1,
    \ "sdl":1,
    \ "sh":1,
    \ "zsh":1,
    \ "bash":1,
    \ "man":1,
    \ "markdown":1,
    \ "matlab":1,
    \ "maxima":1,
    \ "dosini":1,
    \ "conf":1,
    \ "config":1,
    \ "zimbu":1,
    \ "ps1":1,
    \ }

" 两个字符自动触发语义补全
let g:ycm_semantic_triggers =  {
    \ 'c,cpp,cs,python,java,go,erlang,perl,lua,javascript': ['re!\w{2}'],
    \ }

"--------------------------------------------------------------------------------
" go
"--------------------------------------------------------------------------------

let g:go_template_autocreate = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

"--------------------------------------------------------------------------------
" markdown
"--------------------------------------------------------------------------------

map <silent> <Leader>m <Plug>MarkdownPreview

"--------------------------------------------------------------------------------
" python
"--------------------------------------------------------------------------------

let g:python_highlight_all = 1

"--------------------------------------------------------------------------------
" json
"--------------------------------------------------------------------------------

" format json
command -range=% JSONFormat :<line1>,<line2> ! python -m json.tool

" compact json
command -range=% JSONCompact :<line1>,<line2> s/[ \s\n\r]//g | noh

"--------------------------------------------------------------------------------
" 标签标题
"--------------------------------------------------------------------------------

function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let buflist = tabpagebuflist(tab)
    let winnum = tabpagewinnr(tab, '$')
    let winnr = winnum > 1 ? 1 : 0
    let bufnr = buflist[winnr]
    let bufname = bufname(bufnr)

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':'
    let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[None] ')
  endfor

  let s .= '%#TabLineFill#'
  if (exists("g:tablineclosebutton"))
    let s .= '%=%999XX'
  endif
  return s
endfunction

set tabline=%!Tabline()

"================================================================================
" 按键映射
"================================================================================

"--------------------------------------------------------------------------------
" 系统复制粘贴
"--------------------------------------------------------------------------------

vmap <Leader>y "+y
nmap <Leader>y "+yy
nmap <Leader>p "+p

"--------------------------------------------------------------------------------
" 插入模式快捷键
"--------------------------------------------------------------------------------

inoremap <C-a> <Home>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <End>

"--------------------------------------------------------------------------------
" 命令模式快捷键
"--------------------------------------------------------------------------------

cnoremap <C-a> <Home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-e> <End>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

"--------------------------------------------------------------------------------
" 窗口切换
"--------------------------------------------------------------------------------

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-c> <C-w>c
noremap <leader>H <C-w>H
noremap <leader>J <C-w>J
noremap <leader>K <C-w>K
noremap <leader>L <C-w>L

"--------------------------------------------------------------------------------
" 标签快捷键
"--------------------------------------------------------------------------------

function! Tab_MoveLeft()
    let l:tabnr = tabpagenr() - 2
    if l:tabnr >= 0
        exec 'tabmove '.l:tabnr
    endif
endfunc

function! Tab_MoveRight()
    let l:tabnr = tabpagenr() + 1
    if l:tabnr <= tabpagenr('$')
        exec 'tabmove '.l:tabnr
    endif
endfunc

noremap <silent> <leader>1 1gt
noremap <silent> <leader>2 2gt
noremap <silent> <leader>3 3gt
noremap <silent> <leader>4 4gt
noremap <silent> <leader>5 5gt
noremap <silent> <leader>6 6gt
noremap <silent> <leader>7 7gt
noremap <silent> <leader>8 8gt
noremap <silent> <leader>9 9gt
noremap <silent> <leader>0 :tablast<cr>
noremap <silent> <leader>tn :tabnext<cr>
noremap <silent> <leader>tp :tabprev<cr>
noremap <silent> <leader>tt :tabnew<cr>
noremap <silent> <leader>tq :tabclose<cr>
noremap <silent> <leader>to :tabonly<cr>
noremap <silent> <leader>th :call Tab_MoveLeft()<cr>
noremap <silent> <leader>tl :call Tab_MoveRight()<cr>
