let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let &runtimepath = &runtimepath . "," . s:dein_repo

"set
set hidden
set clipboard+=unnamedplus
set expandtab 
set tabstop=2
set shiftwidth=2
set completeopt=menuone
set scrolloff=3
set smartcase
set ignorecase
set number
set splitright
set belloff=
set previewheight=10

"dein settings
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  "add
  call dein#add(s:dein_repo)
  "colorscheme
  call dein#add('morhetz/gruvbox')
  "end
  call dein#end()
  call dein#save_state()
endif

"filetype&syntax on
filetype plugin indent on
syntax on

"colorscheme
set background=dark
colorscheme gruvbox
