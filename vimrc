" ----------------------------------    Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle initialization
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!

Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.


" Bundle 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'shime/vim-livedown'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-sleuth'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'https://github.com/bronson/vim-visual-star-search'
Plugin 'bling/vim-airline'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'mileszs/ack.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tomtom/tcomment_vim'
Plugin 'rking/ag.vim'
Plugin 'powerline/powerline'
Plugin 'justinmk/vim-sneak'

" Syntax and language plugins
Bundle 'Valloric/MatchTagAlways'
Bundle 'jiangmiao/auto-pairs'
Bundle 'scrooloose/syntastic'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'othree/html5-syntax.vim'
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-markdown'
" Bundle 'jelera/vim-javascript-syntax'
" Bundle 'othree/javascript-libraries-syntax.vim'
" Bundle 'jiangmiao/simple-javascript-indenter'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Bundle 'jQuery'

" use ag for recursive searching so we don't find 10,000 useless hits inside node_modules
nnoremap <leader>* :call ag#Ag('grep', '--literal ' . shellescape(expand("<cword>")))<CR>
vnoremap <leader>* :<C-u>call VisualStarSearchSet('/', 'raw')<CR>:call ag#Ag('grep', '--literal ' . shellescape(@/))<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
execute pathogen#infect()
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

" if exists('+relativenumber')
"   set rnu
" else
"   set nu
" endif
set hidden                            " This makes vim act like all other editors, buffers can exist in the background without being in a window. http://items.sjbach.com/319/configuring-vim-right

" Prevent goofy backup files
set nobackup

" Prevent the creation of swp files, they're just a mess
set noswapfile

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
set nowrap                            " Prevent line wrapping

" Auto complete filenames when in :Ex mode, etc
set wildmenu
set wildmode=list:longest

" Visually display matching braces
set showmatch

" ----------------------------------    Spelling
autocmd BufRead,BufNewFile *.md setlocal spell
set complete+=kspell                  " Turn spellcheck on for .md files + word completion

" ----------------------------------    Commands & Mappings
autocmd BufWritePre * :%s/\s\+$//e    " Trim trailing whitespace
command! FindNonAscii                   normal /[^\x00-\x7f]<cr>
map      <leader>d                      :bp\|bd #<CR>


" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" js beautify
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" airline options
let g:airline#extensions#tabline#enabled = 1
" Allow slimline to use powerline fonts
let g:airline_powerline_fonts=1
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

" ----------------------------------    Plugin Settings
" solarized options. Having problems? http://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized
syntax enable
set background=dark
:
let g:solarized_termtrans=1
let g:solarized_termcolors = 16  " If set to 256 you'd have problems see above s.o. link
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

let g:netrw_preview = 1
let g:netrw_localrmdir='rm -r' " Allow netrw to remove non-empty local directories

" ctrlp settings
" let g:ctrlp_prompt_mappings = {
"     \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
"     \ 'AcceptSelection("t")': ['<cr>'],
"     \ }

" Jumping around errors
let g:syntastic_always_populate_loc_list = 1
noremap [ :lprev<CR>
noremap ] :lnext<CR>

" Syntastic shouldn't bother with HTML files
let g:syntastic_ignore_files = ['.html$']
let g:syntastic_scss_checkers = ['scss_lint']

let g:syntastic_javascript_checkers = ['jshint']

" let g:syntastic_debug=1

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" The Silver Searcher
if executable('ag')

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command='ag %s -l -i --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching=0

  " via http://codeinthehole.com/writing/using-the-silver-searcher-with-vim/
  " Note we extract the column as well as the file and line number
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m

  " this is for the ag command with ag.vim
  " let g:ag_working_path_mode="r"
endif


nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>

set runtimepath^=~/.vim/bundle/ctrlp.vim
