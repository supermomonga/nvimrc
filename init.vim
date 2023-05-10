
augroup vimrc
  autocmd!
augroup END

" Common settings {{{
set nocompatible
set cmdheight=2
set laststatus=2
set fileformat=unix
set formatoptions+=mb
set history=10000
set nobackup
set noswapfile
set noundofile
set clipboard=unnamedplus
set updatetime=300
set helplang=ja,en
set number
set expandtab
set tabstop=4
set shiftwidth=2
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" }}}

" Common keybindings {{{
let mapleader = "\<Space>"

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nmap k   gk
nmap j   gj
vmap k   gk
vmap j   gj

nnoremap <expr>0  col('.') == 1 ? '^' : '0'
nnoremap <expr>^  col('.') == 1 ? '^' : '0'

nnoremap _  :sp<CR>
nnoremap <bar>  :vsp<CR>

nnoremap <C-l>  i<Space><Esc><Right>
nnoremap <C-h>  i<Space><Esc>

nnoremap <Space>/  *<C-o>
nnoremap g<Space>/ g*<C-o>


function! s:search_forward_p()
  return exists('v:searchforward') ? v:searchforward : 1
endfunction
nnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
nnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'
vnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
vnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'

nnoremap <C-f> <C-d>
nnoremap <C-b> <C-u>
vnoremap <C-f> <C-d>
vnoremap <C-b> <C-u>
" }}}

" Dein install {{{
let s:config_dir = expand('~/.config/nvim/config')
let s:dein_base = expand('~/.cache/dein')
let s:dein_dir = s:dein_base .. '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_base)
  call mkdir(s:dein_base, 'p')
endif
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
  endif
  execute 'set runtimepath^=' .. s:dein_dir
endif
" }}}

if !isdirectory(s:config_dir)
  call mkdir(s:config_dir, 'p')
endif

call dein#begin(s:dein_base)
call dein#add(s:dein_dir)
call dein#load_toml(s:config_dir .. '/common.toml')
call dein#load_toml(s:config_dir .. '/ddu.toml')
call dein#end()


filetype indent plugin on

if has('syntax')
  syntax on
endif
