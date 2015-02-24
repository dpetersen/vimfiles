" Disable vi compatibility
set nocompatible

" Used for some plugins to display fancy symbols.  Hopefully doesn't blow
" things up.
set encoding=utf-8

" Ask Pathogen to load bundles
call pathogen#infect()

let mapleader=","
let maplocalleader=","

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
set wildmode=longest:full,full

" Remember global variables across vim sessions
set viminfo^=!

" Set minimum split height to 1 line instead of 2
set wmh=0

" A split will default to being creating under or to the right of the current.
set splitbelow splitright

" Always show diffs veritcally regardless of the space available. Horizontal
" diffs are unreadable to me.
set diffopt=vertical

" Indent plugin settings for Zenburn
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
augroup indentguidesaugroup
  autocmd!
  autocmd VimEnter,Colorscheme * hi IndentGuidesOdd ctermbg=236
  autocmd VimEnter,Colorscheme * hi IndentGuidesEven ctermbg=240
augroup END

" Fix for UTF-8 annoyances in vagrant ubuntu
let g:NERDTreeDirArrows=0

" Have powerline use slightly prettier characters.
let g:Powerline_symbols = 'unicode'

" Show a statusline always.
set laststatus=2

" Custom Fugitive shortcuts
noremap <leader>gs :Gstatus <CR>
noremap <leader>gc :Gcommit <CR>
noremap <leader>gd :Gdiff <CR>
noremap <leader>gb :Gblame <CR>

" Use slim highlighting for emblem templates
augroup emblem_as_slim_augroup
  autocmd BufNewFile,BufRead *.emblem set filetype=slim
augroup END

" Make Y behave to EOL like most capitolized normal-mode commands.
noremap Y y$

" Store swap files in fixed location, not current directory.
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

" Close omnicompletion preview window when you are finished inserting.
" source:
" http://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Allow reselection of last pasted text.
" source:
" http://vim.wikia.com/wiki/Selecting_your_pasted_text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Toggle paste mode on and off.
" source: http://amix.dk/vim/vimrc.html
map <leader>pp :setlocal paste!<cr>

" My custom normal/insert mode mappings {{{

" Remap jk or to be the same as Esc to leave Insert mode.
inoremap jk <Esc>
inoremap jj <Esc>
inoremap <esc> <nop>

" Quick editing and reloading of .vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" C-j in insert mode escapes normal mode and writes the file.
" C-S-j in insert mode escapes, saves, and quits.
" BUG: In iterm, these mappings overwrite each other
inoremap <CS-J> <Esc>ZZ
inoremap <C-j> <Esc>:w<Enter>

" '<leader>dp/s/v' brings up an :e/sp/vsp prompt in the context of the current file's directory
noremap <leader>dp :e <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>ds :sp <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>dv :vsp <C-R>=expand("%:p:h") . "/" <CR>

" '<leader>df' opens up NetRW in the directory of the current file
noremap <leader>df <leader>dp<CR>

" '<leader>dd' opens up NetRW in Vim's current directory
noremap <leader>dd :e .<CR>

" Create directional shortcuts for moving among between splits
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

" Toggle TagBar. I don't use it a lot, but it's helpful.
nnoremap <leader>t :TagbarToggle<CR>

" It's 'm' for make. Even though it's not running make. Deal with it.
nnoremap <leader>m :Dispatch<CR>

" Close/open quickfix/preview windows from anywhere. Why has it taken me so
" long to map this?
nnoremap <leader>qq :cclose<CR>
nnoremap <leader>qp :pclose<CR>
nnoremap <leader>qo :copen<CR>

" }}}

" Search Related options {{{

" Highlight searched terms
set hlsearch

" bind \ to clear highlighting, though search term remains and 'n' works
noremap <silent> \ :silent nohlsearch<CR>

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

augroup rubyindentstyle
  autocmd!
  autocmd FileType ruby,eruby,yaml set autoindent shiftwidth=2 softtabstop=2 expandtab

  autocmd FileType ruby hi link yardGenericTag rubyInstanceVariable
  autocmd FileType ruby hi link yardGenericDirective rubyInstanceVariable
augroup END

" }}}

" GoLang options {{{
augroup golangstyle
  autocmd!
  autocmd FileType go set tabstop=2 shiftwidth=2 noexpandtab
  autocmd FileType go noremap <leader>gt :GoTest <CR>
  autocmd FileType go noremap <leader>gT :GoTest <CR>
  autocmd FileType go noremap <leader>gi :GoInfo <CR>
  autocmd FileType go noremap <leader>gp :GoImports <CR>
augroup END
" }}}

" Rust options {{{
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs let b:dispatch = 'cargo run'

" I need to do this according to Racer docs.
" let g:racer_cmd = "~/development/racer/target/release/racer"
" let $RUST_SRC_PATH="~/development/rust/src"
" }}}

" Coffee specific options {{{
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
" }}}

" Javascript specific options {{{
autocmd BufNewFile,BufReadPost *.js setl shiftwidth=2 expandtab
autocmd BufNewFile,BufReadPost *.hbs setl shiftwidth=2 expandtab
" }}}

" CSS specific options {{{
autocmd BufNewFile,BufReadPost *.css setl shiftwidth=2 expandtab
autocmd BufNewFile,BufReadPost *.scss setl shiftwidth=2 expandtab
" }}}
