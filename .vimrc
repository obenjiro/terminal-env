let mapleader = ','

" ┌───────────────────────────────────┐
" │              Vandler              │
" └───────────────────────────────────┘

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" ┌───────────────────────────────────┐
" │              Plugins              │
" └───────────────────────────────────┘

" Editor Config
Bundle 'editorconfig/editorconfig-vim'

" Vim Text Surround
Bundle 'tpope/vim-surround'

" Helpers for Unix
Bundle 'tpope/vim-eunuch'

" NerdTree
Bundle 'scrooloose/nerdtree'
nmap <C-i> :NERDTreeToggle<CR>
let NERDTreeKeepTreeInNewTab=0
" Disable display of the 'Bookmarks' label and 'Press ? for help' text
let NERDTreeMinimalUI=1
" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L
" Keep NERDTree window fixed between multiple toggles
set winfixwidth
" Show hidden files
let NERDTreeShowHidden=1

" CtrlP to do fuzzy search
Bundle 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = ''

" Multiple cursors
Bundle 'terryma/vim-multiple-cursors'

" Airline status bar
Bundle 'bling/vim-airline'
set laststatus=2

" Themes
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'

" vim Git extenshion
Bundle 'tpope/vim-fugitive'

" visual Git history ect..
Bundle 'gregsexton/gitv'

" sintax checker
Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_wq=0
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [ 'javascript' ], 'passive_filetypes': ['html', 'css', 'slim'] }
let g:syntastic_javascript_checkers = ['jshint', 'jscs']

function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         Errors
    else
        lclose
    endif
endfunction

nmap <script> <silent> <leader>l :call ToggleErrors()<CR>

auto BufEnter * call SyntasticCheck()
auto BufRead * call SyntasticCheck()

" JSON support
Bundle 'mitsuhiko/vim-json'

" N-th match of M
Bundle 'vim-scripts/IndexedSearch'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" ┌───────────────────────────────────┐
" │                Misc               │
" └───────────────────────────────────┘

" AutoReload .vimrc
" See http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
" Source the vimrc file after saving it
if has("autocmd")
    autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" Theme enabling
let g:airline_theme='base16'
syntax on
set background=dark
colorscheme solarized

" ┌───────────────────────────────────┐
" │              Legalcy              │
" └───────────────────────────────────┘

set omnifunc=syntaxcomplete#Complete

" Backup и swp files
" Don't create backups
set nobackup
" Don't create swap files
set noswapfile

" Use spaces instead of tab
set expandtab
" Always set autoindenting on tab is 4 spaces
set tabstop=4
" When hitting <BS>, pretend like a tab is removed, even if spaces
set softtabstop=4
" Number of spaces to use for autoindenting
set shiftwidth=4


set autoindent
" Copy the previous indentation on autoindenting
set copyindent

autocmd BufNewFile,BufRead *.bemhtml set ft=javascript

set title

" Tmux integration
auto BufEnter * call system("tmux rename-window \"vim " . expand("%:t") . "\"") 
auto VimLeave * call system("tmux rename-window bash")

"Show lines numbers
set number

" check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
set autoread
au CursorHold * checktime
