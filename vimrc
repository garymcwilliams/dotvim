" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2006 Nov 16
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Init {{{
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
if has("win32") || has("win64")
  call pathogen#infect('C:\\Users\\gmcwilliams\\vimfiles\\bundle\\{}')
else
  call pathogen#infect('/c/Users/gmcwilliams/vimfiles/bundle/{}')
endif

" enable airtime extensions
let g:airline#extensions#tabline#enabled = 1

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible " get out of horrible vi-compatible mode

if has("win32") || has("win64")
  source $VIMRUNTIME/mswin.vim
endif
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Processing {{{
set ignorecase " case insensitive search
set smartcase " ignore case if search pattern is all lowercase,
              "    case-sensitive otherwise
filetype on " detect the type of file
filetype plugin on " load filetype plugins
filetype indent on
set cf " enable error files and error jumping
set ffs=dos,unix,mac " support all three, in this order
set viminfo+=! " make sure it can save viminfo
set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors {{{
set background=light " we are using a dark background
syntax on " syntax highlighting on
"colorscheme koehler
colorscheme solarized
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files/Backups {{{
set makeef=error.err " When using make, where should it dump the file
if !isdirectory($TEMP."/vimtemp")
	call mkdir($TEMP."/vimtemp", "p")
endif
set backupdir+=$TEMP/vimtemp/
set directory+=$TEMP/vimtemp/
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI {{{
set lsp=0 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom 
"set cmdheight=2 " the command bar is 2 high
"set number " turn on line numbers
set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
set mouse=a " use mouse everywhere
set shortmess=atI " shortens messages to avoid 'press a key' prompt 
set report=0 " tell us when anything is changed via :...
" make the splitters between windows be blank
set fillchars=vert:\ ,stl:\ ,stlnc:\
set relativenumber
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues {{{
set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
"set nohlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
set lines=70 " 80 lines tall
set columns=160 " 160 cols wide
set so=5 " Keep 10 lines (top/bottom) for scope
set novisualbell " don't blink
set noerrorbells " no noises
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ %04l/%04L(%p%%),%04v
set statusline=%F%m%r%h%w\ %{&ff}\ %Y\ \%03.3b/\%02.2B\ %04l/%04L(%p%%),%04v
set laststatus=2 " always show the status line
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout {{{
set fo=tcrqn " See Help (complex)
set ai " autoindent
set si " smartindent 
set cindent " do c-style indenting
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify 
set noexpandtab " real tabs please!
"set nowrap " do not wrap lines  
set smarttab " use tabs at the start of a line, spaces elsewhere

set history=50		" keep 50 lines of command line history
set showcmd		" display incomplete commands
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Odds {{{
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq
map <C-n> :NERDTreeToggle<CR>

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_win32")
	set guifont=Consolas:h10:cANSI
  endif
else " not gui_running
  set term=xterm-256color
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
  colorscheme solarized
  set background=dark
endif


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
" }}}

" zo opens a fold, zc closes a fold, za toggles fold
" vim:foldmethod=marker:foldlevel=0

