"
"        _                       __                           __             _
" __   _(_)_ __ ___  _ __ ___   / _| ___  _ __   _ __   ___  / _| ___   ___ | |_
" \ \ / / | '_ ` _ \| '__/ __| | |_ / _ \| '__| | '_ \ / _ \| |_ / _ \ / _ \| __|
"  \ V /| | | | | | | | | (__  |  _| (_) | |    | | | | (_) |  _| (_) | (_) | |_
"   \_/ |_|_| |_| |_|_|  \___| |_|  \___/|_|    |_| |_|\___/|_|  \___/ \___/ \__|



" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/vim/autoload/plug.vim'))
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
set list
set listchars=tab:\ ,trail:

set scrolloff=5
" Prevent auto line split
set wrap
set tw=0

set indentexpr=
" Better backspace
set backspace=indent,eol,start

set foldmethod=indent
set foldlevel=99

" Set cursor shape and color

" 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
" you can change cursor color by add color_name after "12;" like this:
"                                       let &t_SI = "\<Esc>[6 q" . "\<Esc>]12;pink\x7"
"       but these is something wrong in st terminal, it will effect st color
" INSERT mode
let &t_SI = "\<Esc>[6 q" . "\<Esc>]12;\x7"
" REPLACE mode
let &t_SR = "\<Esc>[3 q" . "\<Esc>]12;\x7"
" NORMAL mode
let &t_EI = "\<Esc>[2 q" . "\<Esc>]12;\x7"

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
noremap W 5w
noremap E 3e
noremap B 3b

" Search
" noremap = nzz
" noremap - Nzz
noremap n nzz
noremap N Nzz
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
" map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Call figlet
map tx :r !figlet

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

call plug#begin('~/.config/vim/plugged')

" Pretty Dress
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'

" Bookmarks
Plug 'kshenoy/vim-signature'

" For general writing
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'

" Other useful utilities
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =

" Dependencies
Plug 'fadein/vim-FIGlet'

call plug#end()

" ===
" === Dress up my vim
" ===
color monokai
let g:airline_theme='zenburn'
map <LEADER>c1 :colorscheme monokai<CR>:AirlineTheme zenburn<CR>
map <LEADER>c2 :colorscheme monokai<CR>:AirlineTheme molokai<CR>

" ===
" === coc.vim
" ===
let g:coc_global_extensions = [
    \ 'coc-vimlsp']
set hidden
set updatetime=100
set shortmess+=c

inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> td :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-normat-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w

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
map <silent> tb :TagbarOpenAutoClose<CR>


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
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

