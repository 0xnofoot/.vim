" ===
" === 第一次启动 vim ，自动下载插件
" ===
if empty(glob('~/.config/vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" ===
" ===
" 禁用Vim的兼容模式，以使用更多的高级功能
set nocompatible
" 启用自动检测文件类型
filetype on
" 启用文件类型相关的自动缩进
filetype indent on
" 启用文件类型相关的插件
filetype plugin on
" 启用文件类型相关的插件和自动缩进
filetype plugin indent on
" 启用鼠标支持
set mouse=a
" 设置编码为UTF-8，以支持Unicode字符
set encoding=utf-8
" 将系统剪贴板与Vim的寄存器共享，以便于在Vim与其他程序之间复制粘贴数据
set clipboard=unnamedplus
" 防止不正确的背景渲染
let &t_ut=''

" ===
" ===
" ===
" 在 Vim 窗口的左侧显示行号
set number
" 行号显示为相对当前行的相对行号。例如，当前行的行号为 0，上一行的行号为 -1，下一行的行号为 +1，等等
set relativenumber
" 高亮显示当前行
set cursorline
" 启用语法高亮。
syntax enable
" 启用语法高亮，并将语法高亮设置为 Vim 的默认颜色方案
syntax on

" ===
" ===
" ===
" 设置 tab 键宽度为 4 个空格
set tabstop=4
" 设置使用 << 和 >> 命令缩进时的缩进宽度为 4 个空格
set shiftwidth=4
" 启用显示不可见字符（如 Tab 和换行符）的功能
set list
" 设置显示不可见字符的符号
set listchars=tab:\ ,trail:
" 设置在光标靠近屏幕边缘时滚动文本的距离。
set scrolloff=5
" 启用自动换行功能。
set wrap
" 禁用文本宽度限制，允许文本行超过窗口宽度。
set tw=0
" 禁用自动缩进功能。
set indentexpr=
" 设置退格键的行为，可以删除缩进和行末空格。
set backspace=indent,eol,start
" 设置折叠方法为按缩进层次折叠。
set foldmethod=indent
" 设置折叠的最大层数为 99 层。
set foldlevel=99

" ===
" ===
" ===
" 配置 vim 光标格式
" INSERT mode
let &t_SI = "\<Esc>[6 q" . "\<Esc>]12;\x7"
" REPLACE mode
let &t_SR = "\<Esc>[3 q" . "\<Esc>]12;\x7"
" NORMAL mode
let &t_EI = "\<Esc>[2 q" . "\<Esc>]12;\x7"

" ===
" ===
" ===
" 再次打开文件定位到上一次关闭的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" ===
" ===
" 新分割窗口应该在当前窗口的右侧打开
set splitright
" 新分割窗口应该在当前窗口的下方打开
set splitbelow

" ===
" ===
" ===
" 在屏幕底部始终显示状态行
set laststatus=2
" 设置当前工作目录为当前打开文件所在的目录。
set autochdir
" 在命令行上方显示当前正在输入的命令。
set showcmd
" 控制文本格式化方式。-tc 表示不自动折行注释。
set formatoptions-=tc
" 设置在命令行中使用“补全”命令时需要忽略的文件和目录。
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
" 在命令行上方显示“补全”命令的可选项。
set wildmenu
" 控制“补全”命令的行为。longest 表示自动补全到最长的匹配项，list 表示在列表中显示所有匹配项，full 表示在命令行下方显示匹配项。
set wildmode=longest,list,full
" 高亮显示搜索结果。
set hlsearch
" 在打开文件时自动取消搜索结果的高亮显示。
exec "nohlsearch"
" 当输入搜索模式时，实时高亮显示匹配项。
set incsearch
" 在搜索时忽略大小写。
set ignorecase
" 在搜索时，如果搜索项中包含大写字母，则区分大小写；否则忽略大小写。
set smartcase

" ===
" ===
" ===
" 设置 LEADER 为 空格
let mapleader=" "

" ===
" ===
" ===
" 快捷退出和保存
noremap w :wq<CR>
noremap q :q<CR>

" 光标快速移动基本配置
noremap J 4j
noremap K 4k
noremap H 4h
noremap L 4l
noremap W 3w
noremap E 3e
noremap B 3b

" 查找时，总是将目标显示在中间
noremap n nzz
noremap N Nzz
" LEADER + 空格：取消查找高亮
noremap <LEADER><CR> :nohlsearch<CR>

" 改变分屏模式
map CV <C-w>t<C-w>H
map CH <C-w>t<C-w>K

" 分屏模式，切换聚焦窗口
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l
" 修改分屏模式窗口比例
map <up> :res +2<CR>
map <down> :res -2<CR>
map <left> :vertical res +2<CR>
map <right> :vertical res -2<CR>

" ===
" ===
" ===
" alt + n : 创建一个新的文件
map n :tabe<CR>
" alt + t : 执行 tabe, 自定义打开一个新文件
map t :tabe<SPACE>
" alt + Q : 关闭其他所有文件
map Q :tabo<CR>
" 切换文件
map h :-tabnext<CR>
map l :+tabnext<CR>
" 移动文件顺序
map H :-tabmove<CR>
map L :+tabmove<CR>

" ===
" ===
" ===
" 插件配置
call plug#begin('~/.config/vim/plugged')

" 外观插件
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 文件树，显示文件结构
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" 安装 coc 插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'

" 书签
Plug 'kshenoy/vim-signature'

" 更好的输入
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'

" 其他插件
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

" 艺术字
Plug 'fadein/vim-FIGlet'

" 安装 NERD Commenter 插件
Plug 'preservim/nerdcommenter'

call plug#end()

" ===
" ===
" ===
" 打开 figlet, 用于生成艺术字
map tx :r !figlet

" ===
" === 配置外观
" ===
color monokai
let g:airline_theme='zenburn'

" ===
" === coc.vim
" ===
" 提供代码补全和语法检查等功能
let g:coc_global_extensions = [
    \ 'coc-vimlsp']
" 可以在不保存文件的情况下切换到其他文件
set hidden
" 设置在 Insert 模式下输入内容时的延迟时间
set updatetime=100
" 可以隐藏命令执行成功的提示。
set shortmess+=c

" 在弹出的补全列表中使用 Tab 和 Shift-Tab 进行上下选择
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" 定义了在自动补全列表中按下 Enter 键时的行为
" 如果补全列表可见，则确认选择当前项，否则执行回车并将当前行传递给 coc.nvim 处理
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 检查光标前面是否有空格或者为空
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 在当前文档中的错误、警告和信息等之间进行导航。
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 在当前文档中导航到函数定义、类型定义、实现和引用等位置
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 在当前文档中显示文档注释。
" 当光标在函数名或者变量名上时，按下 alt + w 显示文档预览
nnoremap <silent> w :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" 当光标停留在一个符号上时，高亮该符号及其引用
autocmd CursorHold * silent call CocActionAsync('highlight')
" 通过 <leader>rn 命令将当前光标所在的符号重命名
nmap <leader>rn <Plug>(coc-rename)
" 通过 <leader>f 命令格式化选定的代码
xmap <leader>f <Plug>(coc-normat-selected)
" 在 typescript 和 json 文件类型中使用 Coc.nvim 提供的格式化方法 formatSelected 进行格式化
nmap <leader>f <Plug>(coc-format-selected)

" 当打开的文件类型为typescript或json时，使用CocAction('formatSelected')函数作为格式化表达式。
" 当执行CocJumpPlaceholder命令时，调用CocActionAsync('showSignatureHelp')函数更新函数参数
" 清除当前augroup中的所有autocmd命令，以便在下一次重新定义时避免重复
" 这些命令都会在mygroup augroup结束时自动删除
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" ===
" === NERDTree
" ===
" alt+1 : 打开文件结构
map 1 :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "e"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "l"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "c"
let NERDTreeMapChangeRoot = "r"
let NERDTreeShowHidden = 1
" TODO 暂定的显示隐藏文件函数
" nnoremap <leader>nt :NERDTreeToggle<CR>
" nnoremap <leader>nf :NERDTreeFind<CR>
" nnoremap 0 :call ToggleHiddenFiles()<CR>
"
" function! ToggleHiddenFiles()
"     if exists("g:NERDTreeShowHidden")
"         let g:NERDTreeShowHidden = !g:NERDTreeShowHidden
"     else
"         let g:NERDTreeShowHidden = 1
"     endif
"     exec "NERDTreeRefreshRoot"
" endfunction

" ===
" === Tagbar
" ===
" alt + 2 : 打开结构视图，类似于目录功能
map <silent> 2 :TagbarOpenAutoClose<CR>

" ===
" === vim-signiture
" ===
" 书签，m 为主键
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "",
        \ 'ToggleMarkAtLine'   :  "m;",
        \ 'PurgeMarksAtLine'   :  "",
        \ 'DeleteMark'         :  "",
        \ 'PurgeMarks'         :  "m-",
        \ 'PurgeMarkers'       :  "",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "m,",
        \ 'GotoPrevSpotByPos'  :  "m.",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  ""
        \ }


" ==
" == vim-multiple-cursor
" ==
" 多光标
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" ==
" == nerdcommenter
" ==
" 默认情况下，在注释分隔符后添加空格
let g:NERDSpaceDelims = 1
" 按行对齐注释分隔符左对齐，而不是按代码缩进
let g:NERDDefaultAlign = 'left'
" 添加您自己的自定义格式或覆盖默认格式
let g:NERDCustomDelimiters = { 'php': { 'left': '/*','right': '*/' },'html': { 'left': '<!--','right': '-->' },'py': { 'left': '#' },'sh': { 'left': '#' } }
" 允许注释和反转空行（在注释区域时很有用）
let g:NERDCommentEmptyLines = 1
" 取消注释时启用尾随空白的修剪
let g:NERDTrimTrailingWhitespace = 1
" 启用nerdcommenttoggle检查是否对所有选定行进行了注释
let g:NERDToggleCheckAllLines = 1
" 映射批注快捷键按 Ctrl+/
map  <plug>NERDCommenterToggle
" 取消注释行下一行默认注释（未生效）
set fo-=r
