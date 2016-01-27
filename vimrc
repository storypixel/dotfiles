" ----------------------------------    Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle initialization
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() " Keep Plugin commands between vundle#begin/end.

" let Vundle manage Vundle
" required!

Plugin 'VundleVim/Vundle.vim'

" Bundle 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_max_signs = 1500

Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-vinegar'
" Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-abolish'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'https://github.com/bronson/vim-visual-star-search'
" Plugin 'bling/vim-airline'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'mileszs/ack.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tomtom/tcomment_vim'
" Plugin 'powerline/powerline'
Plugin 'justinmk/vim-sneak'
Plugin 'mattn/emmet-vim'

" Syntax and language plugins
Plugin 'Valloric/MatchTagAlways'
Plugin 'jiangmiao/auto-pairs'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-markdown'
" Bundle 'jelera/vim-javascript-syntax'
" Bundle 'othree/javascript-libraries-syntax.vim'
" Bundle 'jiangmiao/simple-javascript-indenter'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'Shutnik/jshint2.vim'

"ctags support
Plugin 'craigemery/vim-autotag'

"brew install ctags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags' "Search for specific methods and classes
set tags=./tags;/
let g:easytags_async = 1

Plugin 'majutsushi/tagbar' "Display methods
nmap <F8> :TagbarToggle<CR>

" Needs 'gem install CoffeeTags'
Plugin 'lukaszkorecki/CoffeeTags'
let g:CoffeeAutoTagDisabled = 0            " Disables autotaging on save (Default: 0 [false])
let g:CoffeeAutoTagIncludeVars = 0          " Includes variables (Default: 0 [false])
let g:CoffeeAutoTagTagRelative = 1          " Sets file names to the relative path from the tag file location to the tag file location (Default: 1 [true])

" Bundle 'jQuery'

Plugin 'rking/ag.vim'
" use ag for recursive searching so we don't find 10,000 useless hits inside node_modules
nnoremap <leader>* :call ag#Ag('grep', '--literal ' . shellescape(expand("<cword>")))<CR>
vnoremap <leader>* :<C-u>call VisualStarSearchSet('/', 'raw')<CR>:call ag#Ag('grep', '--literal ' . shellescape(@/))<CR>

" js beautify
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
map <c-f> :call JsBeautify()<cr>

Plugin 'itchyny/lightline.vim'
" ----------------------------------    Appearance
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

" ----------------------------------    Plugin Settings


let g:netrw_preview = 1
let g:netrw_localrmdir='rm -r' " Allow netrw to remove non-empty local directories

" Vim jsx
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Syntastic
Plugin 'scrooloose/syntastic'
" Jumping around errors
let g:syntastic_always_populate_loc_list = 1
noremap [ :lprev<CR>
noremap ] :lnext<CR>

" Syntastic shouldn't bother with HTML files
let g:syntastic_ignore_files = ['.html$']
let g:syntastic_scss_checkers = ['scss_lint']
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_debug=1

execute pathogen#infect()

" All of your Plugins must be added before the following line
call vundle#end()            " required

syntax on
filetype plugin indent on

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

" ----------------------------------    General
set nocompatible                      " Use Vim settings, rather than Vi settings
set relativenumber
set number
set hidden                            " This makes vim act like all other editors, buffers can exist in the background without being in a window. http://items.sjbach.com/319/configuring-vim-right
set nobackup                          " Prevent goofy backup files
set noswapfile                        " Prevent the creation of swp files, they're just a mess
set backspace=indent,eol,start        " Allow backspace in insert mode
set history=1000                      " Store lots of :cmdline history
set showcmd                           " Show incomplete cmds down the bottom
set showmode                          " Show current mode down the bottom
set gcr=a:blinkon0                    " Disable cursor blink
set visualbell                        " No sounds
set autoread                          " Reload files changed outside vim
let mapleader = ','
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
set clipboard=unnamed                 " Use system clipboard by default

if &term =~ '^screen'                 " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" ----------------------------------    Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set noshiftround

filetype indent on
filetype plugin on

set linebreak

" ----------------------------------    Scrolling
set scrolloff=8                       " Start scrolling when we're 8 lines away from margins
set mouse=a

" ----------------------------------    Centralize backups, swapfiles, and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if has('persistent_undo')
    silent !mkdir $VIM/undo > /dev/null 2>&1
    set undodir=$VIM/undo
    set undofile
endif

" ----------------------------------    Search
set incsearch                         " Find the next match as we type the search
set hlsearch                          " Highlight searches by default
set ignorecase                        " Ignore case when searching...
set smartcase                         " ...unless we were typing a capital
set wildignore+=**/tmp/**             " Ignore tmp directories when searching
" set nowrap                            " Prevent line wrapping
set wildmenu                          " Auto complete filenames when in :Ex mode, etc
set wildmode=list:longest
set showmatch                         " Visually display matching braces

" ----------------------------------    Spelling
autocmd BufRead,BufNewFile *.md setlocal spell
set complete+=kspell                  " Turn spellcheck on for .md files + word completion

" ----------------------------------    Commands & Mappings
autocmd BufWritePre * :%s/\s\+$//e    " Trim trailing whitespace
command! FindNonAscii                   normal /[^\x00-\x7f]<cr>
map      <leader>d                      :bp\|bd #<CR>

nnoremap <esc> :noh<return><esc>      " Clear highlighting on escape in normal mode
nnoremap <esc>^[ <esc>^[

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" The Silver Searcher
" brew install the_silver_searcher or something like this
if executable('ag')
  " :echo "Hello, world!"
  " via http://codeinthehole.com/writing/using-the-silver-searcher-with-vim/
  " Note we extract the column as well as the file and line number
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column\ --only-matching\ --pager\ 'cut\ -c1-120'
  set grepformat=%f:%l:%c%m
  let g:ackprg = 'ag --nogroup --nocolor --column'

  " this is for the ag command with ag.vim
  " let g:ag_working_path_mode="r"
endif

nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>

" Remap Esc to do nothing and make that function jk, or jj instead
inoremap jj <esc>
inoremap <esc> <nop>

"automagic paste
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" ----------------------------------    Appearance and Color Schemes
set guifont=Inconsolata\ for\ Powerline:h15
" let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

" solarized options. Having problems? http://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized
syntax enable
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors = 16  " If set to 256 you'd have problems see above s.o. link
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

