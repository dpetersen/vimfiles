" Disable vi compatibility
set nocompatible

" Ask Pathogen to load bundles
call pathogen#infect()

" Use higher contrast zenburn scheme
let g:zenburn_high_Contrast=1
colorscheme zenburn

" No need for the Error Bell in any form, thanks
set noerrorbells
set novisualbell

" Use filetype appropriate indent
filetype plugin indent on

" Automatically indent
set autoindent
set smartindent

" Always try and do syntax highlighting
syntax on

" Use spaces instead of tabs at the start of the line
set smarttab
set expandtab

" Highlight the line that the cursor is on.
set cursorline

" Always show line numbers
set number

" Reset the window title in non-GUI mode to something a little more helpful.
set title

" Use a manual foldmethod so that folds persist in files
set foldmethod=marker

" Tab completion in command mode shows all possible completions, shell style.
set wildmenu
set wildmode=list:longest

" Remember global variables across vim sessions
set viminfo^=!

" Set minimum split height to 1 line instead of 2
set wmh=0

" A split will default to being creating under or to the right of the current.
set splitbelow splitright

" My custom normal/insert mode mappings {{{

" Remap jj or jk or to be the same as Esc to leave Insert mode.
imap jj <Esc>
imap jk <Esc>

" C-j in insert mode escapes normal mode and writes the file.
" C-S-j in insert mode escapes, saves, and quits.
" BUG: In iterm, these mappings overwrite each other
imap <CS-J> <Esc>ZZ
imap <C-j> <Esc>:w<Enter>

" Map ,, and ;; to insert/append a single character
" Found at VimTips Wiki: http://vim.wikia.com/wiki/Insert_a_single_character
nmap ;, i_<esc>r
nmap ;; a_<esc>r

" ',dp/s/v' brings up an :e/sp/vsp prompt in the context of the current file's directory
if has("unix")
  map ,dp :e <C-R>=expand("%:p:h") . "/" <CR>
  map ,ds :sp <C-R>=expand("%:p:h") . "/" <CR>
  map ,dv :vsp <C-R>=expand("%:p:h") . "/" <CR>
else
  map ,dp :e <C-R>=expand("%:p:h") . "\\" <CR>
  map ,ds :sp <C-R>=expand("%:p:h") . "\\" <CR>
  map ,dv :vsp <C-R>=expand("%:p:h") . "\\" <CR>
endif

" ',df' opens up NetRW in the directory of the current file
map ,df ,dp<CR>

" ',dd' opens up NetRW in Vim's current directory
map ,dd :e .<CR>

" Create directional shortcuts for moving among between splits
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nmap <C-h> <C-W>h

" }}}

" Search Related options {{{

" Highlight searched terms
set hlsearch

" bind \ to clear highlighting, though search term remains and 'n' works
map <silent> \ :silent nohlsearch<CR>

" Use incremental search
set incsearch

" Searches are case insensitive, unless upper case letters are used
set ignorecase
set smartcase

" }}}

" Ruby specific options {{{

" This will highlight trailing whitespace and tabs preceded by a space character
let ruby_space_errors = 1

" Syntax highlight ruby operators (+, -, etc)
let ruby_operators = 1

" }}}

" GUI related options"{{{

" Don't show me a toolbar in a GUI Version of Vim
set guioptions-=T

" Don't show scrollbars
set guioptions-=r
set guioptions-=L
set guioptions-=T

" Use console dialogs in GUI Vim, the dialogue boxes are just silly
if has("gui_gtk")
        set guioptions+=c
endif

" Use LiberationMono 12pt.  Only applies to the GUI.
set gfn=Inconsolata:h14.00

" Nice window title
if has('title') && (has('gui_running') || &title)
        set titlestring=
        set titlestring+=%f\                                             " file name
        set titlestring+=%h%m%r%w                                        " flags
        set titlestring+=\ -\ %{v:progname}                              " program name
        set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')} " working directory
endif

"}}}
