"
" Some parts of this .vimrc file come from http://amix.dk/vim/vimrc.html


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

" Buffers
:set hidden

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vim_runtime/vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Terminal title is actual opened file name
set title
" colors
syntax on
" cursor position info
set ruler

" case insensitive search
set ignorecase
set smartcase
"
" Smart autocompletion on file opening (using :e per exemple)
set wildmode=longest,list

" performing search while typing
set incsearch
set hlsearch " Highlights search things

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    set guioptions-=T
endif

set t_Co=256 " On MAC OS one must use iTerm2 in order to be able to use 256 colors. Terminal.app just doesn't handle it
colorscheme delroth-molokai

set encoding=utf8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ai "Auto indent
set si "Smart indet

" auto tab after brackets
set cindent shiftwidth=8

" line numbers
set nu
" Tab width
set shiftwidth=8

set nowrap

set showmatch " Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the statusline
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Utils
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ffs=unix,dos,mac "Default file types

" new tab
map	<F4> :tabedit 
map!	<F4> :tabedit 

" Sets highlight for wanted matches
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Saves file deleting trailing whitespaces
map <F2> :%s/\s\+$//:w
map! <F2> <ESC> :%s/\s\+$//:w

" Alternates case
map <F3> g~w
map! <F3> <ESC> g~w

" Navigating through splitted windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#runtime_append_all_bundles()

" Prevents LustyExplorer from whining when vim not compiled with ruby support
let g:LustyExplorerSuppressRubyWarning = 1

" Snipmate does need this
filetype plugin on
