" 256 colors
"set t_Co=256

" Terminal title is actual opened file name
set title

" line numbers
set nu

set nowrap


" colors
syntax on

" cursor position info
set ruler

" case insensitive search
set ignorecase
set smartcase

" Colorisation (theme)
colorscheme delek

" performing search while typing
set incsearch

" auto tab after brackets
set cindent shiftwidth=8

" Tab de 8
set shiftwidth=8

" Smart autocompletion on file opening (using :e per exemple)
set wildmode=longest,list

" new tab
map	<F4> :tabedit 
map!	<F4> :tabedit 

" indents actual block
map	<F6> <ESC> =a{
map!	<F6> <ESC> =a{


" Sets highlight for wanted matches
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Saves file deleting trailing whitespaces
map <F2> :%s/\s\+$//:w
map! <F2> <ESC> :%s/\s\+$//:w

" Alternates case
map <F3> g~w
map! <F3> <ESC> g~w

map <M-PageUp> gT
map! <M-PageUp> gT

map <M-PageDown> gt
map! <M-PageDown> gt

" Navigating through splitted windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
