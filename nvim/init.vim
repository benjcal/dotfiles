"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.config/dein')
  call dein#begin('~/.config/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.config/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

set backspace=indent,eol,start
set autoindent
set backup
set history=50
set ruler
set showcmd
set incsearch
syntax on
set hlsearch
filetype plugin indent on
