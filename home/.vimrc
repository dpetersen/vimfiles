" Disable vi compatibility
set nocompatible

" Load everything in .vim/bundle via pathogen.vim
" call pathogen#runtime_append_all_bundles()

" Set up documenation for all the bundles
" call pathogen#helptags()

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
