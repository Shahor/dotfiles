" Some parts of this .vimrc file come from http://amix.dk/vim/vimrc.html
" others from this awesome post : http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" 	(his .vimrc here : https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc)

" Preamble ----------------------------------------------------------------
" {{{

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
set nocompatible

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Buffers
set hidden

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Buffers listing
nmap <leader>l :ls<cr>

" Fast editing of the .vimrc
map <leader>e :e! $MYVIMRC<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" removing use of arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

set ttyfast

" Terminal title is actual opened file name
set title

" colors
syntax on

" cursor position info
set ruler

" 85 column marker
set colorcolumn=85

" case insensitive search
set ignorecase
set smartcase

" Smart autocompletion on file opening (using :e per exemple)
set wildmode=longest,list

" performing search while typing
set incsearch
set hlsearch " Highlights search things

" removes all the vi compatibility
set nocompatible

" Smarter status line
hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black

function! MyStatusLine(mode)
	let statusline=""
	if a:mode == 'Enter'
		let statusline.="%#StatColor#"
	endif
	let statusline.="\(%n\)\ %f\ "
	if a:mode == 'Enter'
		let statusline.="%*"
	endif
	let statusline.="%#Modified#%m"
	if a:mode == 'Leave'
		let statusline.="%*%r"
	elseif a:mode == 'Enter'
		let statusline.="%r%*"
	endif
	let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
	return statusline
endfunction

au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
set statusline=%!MyStatusLine('Enter')

function! InsertStatuslineColor(mode)
	if a:mode == 'i'
		hi StatColor guibg=orange ctermbg=lightred
	elseif a:mode == 'r'
		hi StatColor guibg=#e454ba ctermbg=magenta
	elseif a:mode == 'v'
		hi StatColor guibg=#e454ba ctermbg=magenta
	else
		hi StatColor guibg=red ctermbg=red
	endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
	set guioptions-=T
endif

set t_Co=256 " On MAC OS one must use iTerm2 in order to be able to use 256 colors. Terminal.app just doesn't handle it
"colorscheme shahor-molokai
colorscheme prouget.molokai

set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ai "Auto indent
set si "Smart indet

" auto tab after brackets
set cindent shiftwidth=8

" Relative lines number
set relativenumber

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
" better regexp handling
nnoremap / /\v
vnoremap / /\v

" Removing highlighting after a search
nnoremap <leader><space> :noh<cr>

" Using tab instead of % for pairing movements
nnoremap <tab> %
vnoremap <tab> %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Utils
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Esc key is far ... 
inoremap jj <ESC>

" automatic save on lost focus
au FocusLost * :wa

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

" so you can use undo even after closing a file
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
