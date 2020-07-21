"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " VI compatible mode is disabled so that VIm things work

" =============================================================================
"   PLUGINS
" =============================================================================
"
call plug#begin('~/.vim/plugged')

" Text Manipulation
Plug 'Valloric/YouCompleteMe'       " Autocomplete
Plug 'tpope/vim-sensible'           " Defaults everyone should agree on
Plug 'vim-syntastic/syntastic'      " Check syntax
Plug 'christoomey/vim-tmux-navigator' " Set navigation with tmux

" Commands
Plug 'tpope/vim-surround'           " Surround with 's'
Plug 'tpope/vim-commentary'         " Comment with 'gc'
Plug 'vim-scripts/ReplaceWithRegister' " Replace with 'gr'
Plug 'christoomey/vim-system-copy'      " System copy and paste with 'cp/cv'
Plug 'kana/vim-textobj-user'            " Define own commands
Plug 'kana/vim-textobj-entire'          " Entire page with 'ae/ie'

" GUI
Plug 'itchyny/lightline.vim'          " Better Status Bar
Plug 'mhinz/vim-startify'             " Better start screen

call plug#end()

" Change to blinking line cursor in insert mode
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"---------------
"Syntax and indent
"---------------
set number relativenumber " Set relative line number

syntax on " turn on syntax highlighting
syntax enable
set showmatch " show matching braces when text indicator is over them
filetype plugin indent on " enable file type detection
set autoindent

augroup CursorLineOnlyInActiveWindow
autocmd!
autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
augroup END

set clipboard^=unnamed,unnamedplus

set shortmess+=I " disable startup message
set nu " number lines
set rnu " relative line numbering
set incsearch " incremental search (as string is being typed)
set hls " highlight search
set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set lbr " line break
set scrolloff=5 " show lines above and below cursor (when possible)
set noshowmode " hide mode
set laststatus=2
set backspace=indent,eol,start " allow backspacing over everything
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set lazyredraw " skip redrawing screen in some cases
set autochdir " automatically set current directory to directory of last opened file
set hidden " allow auto-hiding of edited buffers
set history=8192 " more history
set nojoinspaces " suppress inserting two spaces between sentences
" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" smart case-sensitive search
set ignorecase
set smartcase
" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu
set mouse+=a " enable mouse mode (scrolling, selection, etc)

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

set background=dark

"__________________
" Snippets
"__________________

" Competitive programming defaults
nnoremap ,inc : -1read $HOME/.vim/.generate_template.cpp<CR>16jo
nnoremap ,tc : -1read $HOME/.vim/.generate_tc.cpp<CR>18jo
"------------------
" Syntastic settings
"------------------
" Toggle Synastic
cabbrev stm SyntasticToggleMode<CR> 
let g:syntastic_sh_checkers = ["sh", "shellcheck"]

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
