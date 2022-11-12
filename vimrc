" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
set clipboard=unnamedplus

" Prevent incorrect backgroung rendering
let &t_ut=''

" ===
" === Main code display
" ===
set number
set relativenumber
set cursorline
set showcmd
set wildmenu
syntax enable
syntax on

" ===
" === Editor behavior
" ===
" Better tab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" === show the hide char
" set list
" set listchars=tab:▸\ ,trail:▫
set scrolloff=5

" Prevent auto line split
set wrap
set tw=0

set indentexpr=
" Better backspace
set backspace=indent,eol,start

set foldmethod=indent
set foldlevel=99

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" ===
" === Restore Cursor Position
" ===
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Window behaviors
" ===
set splitright
set splitbelow

" ===
" === Status/command bar
" ===
set laststatus=2
set autochdir
set showcmd
set formatoptions-=tc

" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
" show a navigable menu for tab completion
set wildmenu
set wildmode=longest,list,full

" Searching options
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" ===
" === Basic Mappings
" ===

" Set <LEADER> as <SPACE>
let mapleader=" "

" J/K keys for 5 times j/k (faster navigation)
noremap J 5j
noremap K 5k

" Search
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>


" split the screens to horizontal/vertical
map cv :set splitright<CR>:vsplit<CR>
map ch :set splitbelow<CR>:split<CR>
" change splite mode
map CV <C-w>t<C-w>H
map CH <C-w>t<C-w>K
" focus the screens
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l
" Resize splits with arrow keys
map <up> :res +2<CR>
map <down> :res -2<CR>
map <left> :vertical res +2<CR>
map <right> :vertical res -2<CR>

" ===
" === Tab management
" ===
" Create a new tab with tt
map tt :tabe<CR>
" Move around tabs with th and tl
map th :-tabnext<CR>
map tl :+tabnext<CR>
" Move the tabs with tH and tL
map tH :-tabmove<CR>
map tL :+tabmove<CR>

" ===
" === Other useful stuff
" ===

" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Call figlet
map tx :r !figlet

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

call plug#begin('~/.vim/plugged')

" Pretty Dress
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
" Plug 'w0rp/ale'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'
Plug 'tmhedberg/SimpylFold'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" Bookmarks
Plug 'kshenoy/vim-signature'

" For general writing
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'

" Other useful utilities
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'ntpeters/vim-better-whitespace', { 'on': ['EnableWhitespace', 'ToggleWhitespace'] } "displays trailing whitespace (after :EnableWhitespace, vim slows down)
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'

call plug#end()

" ===
" === Dress up my vim
" ===
color monokai

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.vim/_machine_specific.vim'))
  let has_machine_specific_file = 0
  exec "!cp ~/.vim/default_configs/_machine_specific_default.vim ~/.vim/_machine_specific.vim"
endif
source ~/.vim/_machine_specific.vim

" ===
" === NERDTree
" ===
map tf :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "i"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "l"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "h"
let NERDTreeMapChangeRoot = "r"

" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig


" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>


" ===
" === vim-better-whitespace
" ===
let g:better_whitespace_enabled=0


" ===
" === vim-signiture
" ===
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


" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>

" ==
" == vim-multiple-cursor
" ==
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<c-k>'
let g:multi_cursor_select_all_word_key = '<a-k>'
let g:multi_cursor_start_key           = 'g<c-k>'
let g:multi_cursor_select_all_key      = 'g<a-k>'
let g:multi_cursor_next_key            = '<c-k>'
let g:multi_cursor_prev_key            = '<c-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"
" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
  exec "e ~/.vim/_machine_specific.vim"
endif

