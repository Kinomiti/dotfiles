let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let &runtimepath = &runtimepath . "," . s:dein_repo
let g:deoplete#enable_at_startup = 1
let g:dein#types#git#clone_depth = 1
let g:LanguageClient_serverCommands = {
  \ 'python': ['/usr/local/bin/pyls'],
  \ }

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
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/defx.nvim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('thinca/vim-quickrun')
  call dein#add('janko-m/vim-test')
  call dein#add('rhysd/clever-f.vim')
  "deoplete&sources
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neoinclude.vim')
  call dein#add('zchee/deoplete-clang')
  call dein#add('Shougo/neco-vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
  "colorscheme
  call dein#add('morhetz/gruvbox')
  "end
  call dein#end()
  call dein#save_state()
endif

"mappings
inoremap <C-[> <C-[>l
cnoremap <C-Space> <C-^>

lnoremap e <C-u>e $MYVIMRC
lnoremap s <C-u>source %
lnoremap c <C-u>call dein#install()
lnoremap d <C-u>call dein#update()
lnoremap j <C-u><C-^>e ~/kinomiti.github.io/_posts/<C-R>=strftime("%Y-%m-%d-")<CR>
lnoremap l <C-u>e ~/.config/nvim/dein.toml

nnoremap <C-l> 
      \:nohlsearch<CR>
      \:call clever_f#reset()<CR>
      \<C-l>

"[S]mappings
nmap <Space> [S]
nnoremap <silent>[S]d :Defx -columns="mark:type:filename"<CR>
nnoremap [S] :nnoremap [S]<CR>
nnoremap [S]b :Denite buffer -mode=normal<CR>
nnoremap [S]ch :Denite command_history -mode=normal<CR>
nnoremap [S]co :Denite command -mode=normal<CR>
nnoremap [S]f :Denite file -mode=normal<CR>
nnoremap [S]h <C-w>h
nnoremap [S]j <C-w>j
nnoremap [S]k <C-w>k
nnoremap [S]l <C-w>l
nnoremap [S]i zi
nnoremap [S]q :pclose<CR>
nnoremap [S]r :set relativenumber!<CR>
nnoremap [S]] :call LanguageClient#textDocument_definition()<CR>
nnoremap [S]y :%y<CR>
nnoremap [S]= :call LanguageClient#textDocument_formatting()<CR>

"augroup
augroup vimrc
  autocmd!
  autocmd Filetype help nnoremap <buffer> q :q<CR>
  autocmd BufWritePost $MYVIMRC mkview
  autocmd BufReadPost $MYVIMRC loadview
augroup END

augroup my_defx
  autocmd!
  autocmd Filetype defx call s:defx_my_settings()
augroup END

function! s:defx_my_settings() abort
  nmap <silent><buffer> <Space> [S]
  nnoremap <silent><buffer> [S] :filter defx nnoremap<CR>
  nnoremap <silent><buffer><expr> e defx#do_action('open')
  nnoremap <silent><buffer><expr> yc defx#do_action('copy')
  nnoremap <silent><buffer><expr> ym defx#do_action('move')
  nnoremap <silent><buffer><expr> yp defx#do_action('paste')
  nnoremap <silent><buffer><expr> h defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> m defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> N defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> n defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> u defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
  nnoremap <silent><buffer><expr> <Tab> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
endfunction

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

"call denite#custom#map
call denite#custom#map('insert', '<C-j>', '<Enter>')
call denite#custom#map('normal', '<C-j>', '<Enter>')

"filetype&syntax on
filetype plugin indent on
syntax on

"colorscheme
set background=dark
colorscheme gruvbox
