"My vimrc file
" Author: Lawrence Wang
" Date: 2013年 04月 28日 星期日 16:09:04 CST
" Email: lawrence.4w17@gmail.com
" Instruction: 
"   I use yunio to store my plugins and vimwiki files, so before start must
"   define the right path to yunio folder
"
"   1. copy this file as _vimrc and _vimrc_win to vim install folder(For windows),
"   or as .vimrc and .vimrc_linux to home folder(For Linux);
"   2. change the path in this file below, let the vim can find _vimrc_win or
"   .vimrc_linux file
"   3. modify the paths in _vimrc_win or .vimrc_linuxfile
"
"===============================================================================

set nocompatible
set encoding=utf-8
set fileencoding=utf-8
call pathogen#infect()  "use pathogen to manage all vim plugins

"********* if new copied this file, change the path below ***************
"operation platform specific
if has("win32") || has("win64")
    source $VIMRUNTIME\delmenu.vim "resolve menu display problem
    source $VIMRUNTIME\menu.vim
    source $VIM\.vimrc_win    "for windows
    language messages zh_CN.utf-8 "solve the chinese display
else
    source ~/.vimrc_linux   "for linux
endif

"========================== Common Settings =====================================
set acd					"auto change to directory which contains the opened file
set showcmd				"show the command
colorscheme molokai		"set the color theme
set guioptions-=T		"disable the tools bar
set guioptions-=m		"disable the menu bar
set guioptions-=r		"Disabled the scroller on the right
set guioptions-=L       "Disable left side scroller
set number				"show the line number
set incsearch			"Enable increase search
set hlsearch			"Enable high light the search result
set cursorline			"high light the current line
set autoread			"Enable auto load the file changed by other editors
set backspace=2			"Enable backspace to delete all symbols -- copied from web
set shortmess=atI		"Disable the startup message
set lazyredraw          "Don't redraw while executing macros
"set magic              "For regular expressions turn magic on -- not tested, so comment it for now
set showmatch           "Show matching brackets when text indicator is over them
set hidden              "unsaved buffer can be hidden
set scrolloff=5         "Keep 5 lines when scroll near the bottom
set foldenable          "Enable fold

"Set the tab
set tabstop=4 			"tab width
set shiftwidth=4
set expandtab			"use whitespace instead of tab
set smarttab            "Be smart when using tabs

"========================= For Programming ==================================
filetype plugin indent on "For some plug in
syntax on 				"Enable syntax high light
set autoindent			"Enable auto indent
set smartindent			"Enable smart indent

"========================== My function maps and signs ========================
"----------------
"self define maps
"----------------

"cycling between buffers -- from <hacking vim>
"2013-4-28 minibufexpl support the same function, so commented these lines, if
"don't use minibufexpl anymore uncomment these lines to enable
"use ctrl-right key to open the next buffer
"map <C-right> <ESC>:bn<CR>      
"use ctrl-left key to open the previous buffer
"map <C-left> <ESC>:bp<CR>       

"-----------------
"self define signs
"-----------------
"define the todo sign
sign define todo text=TD texthl=SignColumn
"create a todo sign
map ,td :exe ":sign place 2 line=".line(".")." name=todo file=".expand("%:p")<cr>
"remove a sign in the current line
map ,ct :exe ":sign unplace"<cr>

"========================= Plugins Setting ==================================
"----- Power line setting ----
set laststatus=2 		"Always show the status bar
let g:Powerline_symbols='fancy'

"----- miniBufExpl -----
let g:miniBufExplMapWindowNavVim = 1    "this line maybe not correctly functional
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"----- NERDTree -------
"Toggle nerdtree
cabbr nt NERDTreeToggle
"Open from bookmark
cabbr nfb NERDTreeFromBookmark
"close nerdtree
cabbr nc NERDTreeClose
