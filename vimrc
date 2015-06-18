" ----------------------------------    Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'shime/vim-livedown'
Plugin 'tpope/vim-sensible'

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

" ----------------------------------    General
let base16colorspace=256              " Access colors present in 256 colorspace
set nocompatible                      " Use Vim settings, rather than Vi settings
syntax on                             " Show syntax highlighting
match ErrorMsg '\s\+$'                " Highlight trailing whitespace
set number                            " Show line numbers
set hidden                            " This makes vim act like all other editors, buffers can exist in the background without being in a window. http://items.sjbach.com/319/configuring-vim-right
set background=dark
colorscheme base16-ocean
set backspace=indent,eol,start        " Allow backspace in insert mode
set history=1000                      " Store lots of :cmdline history
set showcmd                           " Show incomplete cmds down the bottom
set showmode                          " Show current mode down the bottom
set gcr=a:blinkon0                    " Disable cursor blink
set visualbell                        " No sounds
set autoread                          " Reload files changed outside vim

syntax on                             " Turn on syntax highlighting

let mapleader=','                     " Change leader to a comma because the backslash is too far away. That means all \x commands turn into ,x

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

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
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set noshiftround

filetype indent on
filetype plugin on

set linebreak

" ----------------------------------    Scrolling
set scrolloff=8                       " Start scrolling when we're 8 lines away from margins

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

" ----------------------------------    Commands & Mappings
command! NukeTrailingWhitespace         %s/\s\+$//
command! FindNonAscii                   normal /[^\x00-\x7f]<cr>
map      <leader>d                      :bp\|bd #<CR>

" ----------------------------------    Plugin Settings
let g:NERDTreeChDirMode                 = 2
map      <leader>\                      :NERDTreeToggle<CR>
let NERDTreeShowHidden                  = 1

let g:ctrlp_working_path_mode           = 'rw'
let g:ctrlp_map                         = '<leader>p'
let g:ctrlp_show_hidden                 = 1
let g:ctrlp_custom_ignore               = { 'dir': 'Build\|sass-cache\|git\|DS_Store' }
nnoremap <silent> <leader>p :CtrlP<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>

nmap <leader><ESC> ,,w
nmap <leader><TAB> ,,b
let g:EasyMotion_keys='asdfjkowerip'  " These keys are easier to type than the default set. 
                                      " We exclude semicolon because it's hard to read and 
                                      " i and l are too easy to mistake for each other slowing 
                                      " down recognition. The home keys and the immediate keys 
                                      " accessible by middle fingers are available

nmap <leader>m :LivedownPreview<CR>
