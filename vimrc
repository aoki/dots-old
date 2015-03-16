let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_mac = !s:is_windows && !s:is_cygwin
      \ && (has('mac') || has('macunix') || has('gui_macvim') ||
      \   (!executable('xdg-open') &&
      \     system('uname') =~? '^darwin'))
 
 
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

if has('clipboard')
  set clipboard=unnamed,autoselect
endif

if has('mouse')
  set mouse=a
endif

if v:version >= 700
  set cursorline      " show line guide
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

filetype plugin indent on  " Required! neobundle
syntax on
 
" Highlight
hi Search term=bold cterm=bold ctermfg=166 ctermbg=190 gui=bold
hi IncSearch term=bold cterm=bold ctermfg=166 ctermbg=190 gui=bold
 
" Key map
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>


"NeoBundle 'bling/vim-airline'
"let s:bundle = neobundle#get('vim-airline')

" for lightline
" ==============
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"\u2b64":""}',
      \ },
      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
      \ }
NeoBundle 'tpope/vim-surround'


NeoBundleLazy 'elzr/vim-json', {
      \'autoload': {'filetypes': [ 'json' ]}
      \}
NeoBundleLazy '5t111111/neat-json.vim', {
      \'autoload': {'filetypes': [ 'json' ]}
      \}
NeoBundleLazy 'mattn/emmet-vim', {
      \'autoload': {'filetypes': [ 'html' ]}
      \}
NeoBundleLazy 'derekwyatt/vim-scala', {
      \'autoload': {'filetypes': [ 'scala' ]}
      \}
NeoBundleLazy 'jnwhiteh/vim-golang', {
      \'autoload': {'filetypes': [ 'go' ]}
      \}



NeoBundleCheck

set nobackup
set noswapfile
set noundofile

set laststatus=2
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set modeline
set lazyredraw
set visualbell t_vb=  " no beep, no visual-bell

set t_Co=256
set nu
set ttyfast

autocmd! BufRead,BufNewFile FileType vim setl ts=2 sts=2 sw=2 et
 

" for VimDiff
" ============
if &diff
  echo 'Open diff mode'
  hi DiffAdd    ctermfg=black ctermbg=2
  hi DiffChange ctermfg=black ctermbg=3
  hi DiffDelete ctermfg=black ctermbg=6
  hi DiffText   ctermfg=black ctermbg=4
endif
 
 
" for Paste
" ==========
if &term =~ "xterm"
  let &t_ti .= "\e[?2004h"
  let &t_te .= "\e[?2004l"
  let &pastetoggle = "\e[201~"
 
  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction
 
  noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
  cnoremap <special> <Esc>[200~ <nop>
  cnoremap <special> <Esc>[201~ <nop>
endif
