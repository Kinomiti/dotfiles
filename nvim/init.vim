  let s:dein_dir = expand('~/.cache/dein')
  let s:dein_repo = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
  let g:Jekyll_dir = expand('~/kinomiti.github.io/')
  let g:Jekyll_posts_dir = g:Jekyll_dir . '_posts/'
  let &runtimepath = &runtimepath . "," . s:dein_repo

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
  "Note: It executes :filetype off automatically.
  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    "add
    call dein#add(s:dein_repo)
    call dein#add('Shougo/defx.nvim')
    call dein#add('Shougo/denite.nvim')
    "deoplete&sources
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neoinclude.vim')
    call dein#add('zchee/deoplete-clang')
    call dein#add('Shougo/neco-vim')
    call dein#add('rhysd/clever-f.vim')
    "colorscheme
    call dein#add('morhetz/gruvbox')
    "end
    call dein#end()
    call dein#save_state()
  endif
  
"map

  inoremap <C-]> <C-[>l

  cnoremap <C-Space> <C-^>

  lnoremap e <C-u>e $MYVIMRC
  lnoremap s <C-u>source %
  lnoremap c <C-u>call dein#install()
  lnoremap d <C-u>call dein#update()
  lnoremap j <C-u>e <C-^><C-R>=g:Jekyll_posts_dir<CR><C-R>=strftime("%Y-%m-%d-")<CR>
  lnoremap t <C-u>call ReadJekyllTemplatePost()

  nnoremap K "addk"aP
  nnoremap J "add"ap
  nnoremap <C-l> 
        \:nohlsearch<CR>
        \:call clever_f#reset()<CR>
        \<C-l>

  nmap <Space> [spacemap]
  nnoremap [spacemap] :nnoremap [spacemap]<CR>
  nnoremap [spacemap]f :Denite file -mode=normal<CR>
  nnoremap [spacemap]co :Denite command -mode=normal<CR>
  nnoremap [spacemap]ch :Denite command_history -mode=normal<CR>
  nnoremap [spacemap]b :Denite buffer -mode=normal<CR>
  nnoremap <silent>[spacemap]d :Defx<CR>
  nnoremap [spacemap]r :set relativenumber!<CR>

  augroup vimrc
    autocmd!
    autocmd Filetype help nnoremap <buffer> q :q<CR>
    autocmd Filetype defx call s:defx_my_settings()
    autocmd BufNewFile *.md 0read ~/kinomiti.github.io/_template/post.md
  augroup END

	function! s:defx_my_settings() abort
	  " Define mappings
	  nnoremap <silent><buffer><expr> yc
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> ym
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> yp
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer> q <C-w><C-z>
    nnoremap <silent><buffer> e 
          \:only<CR>
          \:call defx#_do_action('open', ['vsplit'])<CR>
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> n
    \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> u
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> <Tab>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer> <Space>
    \ :filter defx nnoremap<CR>
	endfunction

"call denite#custom#map
  call denite#custom#map('insert', '<C-j>', '<Enter>')
  call denite#custom#map('normal', '<C-j>', '<Enter>')
"deoplete settings
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#clang#libclang_path = '/usr/lib/x86_64-linux-gnu/libclang-6.0.so.1'
  let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

"filetype&syntax on
  filetype plugin indent on
  syntax on

"colorscheme
  set background=dark
  colorscheme gruvbox

