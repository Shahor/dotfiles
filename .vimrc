set nocompatible              " Don't be compatible with vi

syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes

" Line numbers
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible

set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set t_Co=256

" Undo available even after file close
set undofile

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set laststatus=2            " Always show statusline, even if only 1 window.
set colorcolumn=200

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

set backupcopy=yes
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

let mapleader=","             " change the leader to be a comma vs slash

" ctrl-jklm  changes to that split
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
noremap <c-left> <c-w>j
noremap <c-down> <c-w>k
noremap <c-up> <c-w>l
noremap <c-right> <c-w>h

" Removing use of arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
inoremap <C-W> <C-O><C-W>

" don't outdent hashes
inoremap # #

" Replace esc with jj to go out of edit
inoremap jj <Esc>

" Sets highlight for wanted matches
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
map <C-d> :%s/\s\+$//
