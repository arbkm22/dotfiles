set encoding=utf-8
set nocompatible
let g:ale_disable_lsp = 1
"source $HOME/.config/nvim/plug-config/coc.vim
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Ale
Plug 'w0rp/ale'

"Auto pair
Plug 'jiangmiao/auto-pairs'

"Sorround
Plug 'tpope/vim-surround'

"Airline
Plug 'vim-airline/vim-airline'
"Airline-themes
Plug 'vim-airline/vim-airline-themes'

"Vim fugitive
Plug 'tpope/vim-fugitive'

"Syntax checking
Plug 'scrooloose/syntastic'

"indentline
Plug 'yggdroot/indentline'

"C++ higlighting
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'bfrg/vim-cpp-modern'

"Gitgutter
Plug 'airblade/vim-gitgutter'

"NerdTree
Plug 'scrooloose/nerdtree'

"Vim Polygot
Plug 'sheerun/vim-polyglot'

"Theme
"One Dark
Plug 'navarasu/onedark.nvim'
"Tokyo Night
Plug 'ghifarit53/tokyonight-vim'

"Icons
Plug 'ryanoasis/vim-devicons'

"Colorizer
Plug 'norcalli/nvim-colorizer.lua'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }


" Initialize plugin system
call plug#end()

"------Custom settings------
syntax on
let g:onedark_termcolors=16
set mouse=a
set clipboard=unnamedplus
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 1
let g:onedark_style = 'darker'
let g:onedark_transparent_background = 1 " By default it is 0

colorscheme onedark

"Highlighters
"available = virtual ,sign_column, background, backgroundfull, foreground,
"foregroundfull
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

"set numbering
set number relativenumber

"indentation
set autoindent
set expandtab
set shiftwidth=4
set shiftround
set tabstop=4
set smarttab

autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']


"------Airline ------
let g:airline_theme='fruit_punch'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"------NerdTree------

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
\ quit | endif

"------Custom Keybindings------
"Maps Alt-Tab/Shift-Tab to move forward/backward in buffer
nnoremap  <silent>   <A-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

"inoremap <silent><expr> <c-y> pumvisible() ? coc#_select_confirm() : "\<c-y>"

nnoremap <C-n> :NERDTreeToggle<CR>
