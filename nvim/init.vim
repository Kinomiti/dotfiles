  set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
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

"dein settings
  "Note: It executes :filetype off automatically.
  if dein#load_state($HOME . '/.cache/dein')
    call dein#begin($HOME . '/.cache/dein')
    "add
    call dein#add($HOME . '/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/defx.nvim')
    call dein#add('Shougo/denite.nvim')
    call dein#add('lyuts/vim-rtags')
    "deoplete&sources
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neoinclude.vim')
    call dein#add('zchee/deoplete-clang')
    call dein#add('Shougo/neco-vim')
    "colorscheme
    call dein#add('morhetz/gruvbox')
    "end
    call dein#end()
    call dein#save_state()
  endif

"map
  
  "lnoremap
  cnoremap <C-Space> <C-^>
  lnoremap e <C-u>e $MYVIMRC
  lnoremap s <C-u>source %
  lnoremap c <C-u>call dein#install()
  lnoremap d <C-u>call dein#update()

  nnoremap <silent> <C-h> :nohlsearch<CR>

  nmap <Space> [denite]
  nnoremap [denite] :nnoremap [denite]<CR>
  nnoremap [denite]f :Denite file<CR>
  nnoremap [denite]co :Denite command<CR>
  nnoremap [denite]ch :Denite command_history<CR>
  nnoremap [denite]b :Denite buffer<CR>
  nnoremap [denite]d :Defx<CR>
  

"autocmd
  augroup vimrc
    autocmd!
    autocmd Filetype help nnoremap <buffer> q :q<CR>
    autocmd Filetype defx call s:defx_my_settings()
  augroup END

	function! s:defx_my_settings() abort
	  " Define mappings
	  nnoremap <silent><buffer><expr>
    \ M defx#do_action('open')
	  nnoremap <silent><buffer><expr>
    \ e defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr>
    \ m defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr>
    \ K defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr>
    \ N defx#do_action('new_file')
	  nnoremap <silent><buffer><expr>
    \ d defx#do_action('remove')
	  nnoremap <silent><buffer><expr>
    \ r defx#do_action('rename')
	  nnoremap <silent><buffer><expr>
    \ u defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr>
    \ ~ defx#do_action('cd')
	  nnoremap <silent><buffer><expr>
    \ q defx#do_action('quit')
	  nnoremap <silent><buffer><expr>
    \ <Tab> defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr>
    \ * defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr>
    \ j line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr>
    \ k line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr>
    \ <C-l> defx#do_action('redraw')
    nnoremap <silent><buffer><expr>
    \ <C-g> defx#do_action('print')
	  nnoremap <silent><buffer> 
    \<Space> :filter defx nnoremap<CR>
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

