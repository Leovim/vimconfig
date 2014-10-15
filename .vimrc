set expandtab
set showmatch
set lbr
set fileencodings=utf-8,chinese
set encoding=utf-8
set number
set mouse=a
set nobackup
set nowritebackup
set wildmenu
set wildmode=longest:full
set cursorline
" set cursorcolumn
set nocursorcolumn
set foldmethod=syntax
set helplang=cn
set backspace=indent,eol,start
set nocompatible

" set vundle
filetype off
filetype plugin on 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage Vundle
Plugin 'gmarik/Vundle.vim'
" my Bundle
Plugin 'L9'
" Bundle 'mattn/emmet-vim'
Plugin 'Shougo/neocomplcache.vim'
" Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'showcolor.vim'
Plugin 'msanders/snipmate.vim'
Plugin 'godlygeek/tabular'
Plugin 'taglist.vim'
" Bundle 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'nathanaelkane/vim-indent-guides'
" Bundle 'maksimr/vim-jsbeautify'
Plugin 'edsono/vim-matchit'
Plugin 'Lokaltog/vim-powerline'
" Bundle 'bling/vim-airline'
Plugin 'lukaszb/vim-web-indent'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-commentary'
Plugin 'terryma/vim-multiple-cursors'
" Bundle 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'rizzatti/dash.vim'
Plugin 'rizzatti/funcoo.vim'
Plugin 'file:///Users/leo/.vim/bundle/customed-files'

call vundle#end()
filetype indent on

" set ai
set hls
syntax on
syntax enable
set history=100
set ruler
set shiftwidth=2
set tabstop=2
set softtabstop=2
set ignorecase
set hlsearch
set t_Co=256
" set background=dark
colorscheme molokai
let g:molokai_original=1

let g:indent_guides_start_level=2
let g:indent_guides_guide_size=2
" let g:user_zen_leader_key='<c-e>'
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<c-e>'
let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function;m:member'

inoremap <c-b> <left>
inoremap <c-f> <right>
nmap <BS> gcc
vmap <BS> gc

imap <c-j> <Esc>
nmap <c-j> <Esc>
vmap <c-j> <Esc>
 
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd

set complete-=k complete+=k

autocmd! bufwritepost .vimrc source %
autocmd BufNewFile,BufRead  *.coffee set filetype=coffee
autocmd BufNewFile,BufRead  *.scala set filetype=scala

set guioptions-=T
set guioptions-=r
set guioptions-=b
set guioptions-=L
set guifont=Monaco\ for\ Powerline:h13
map <silent> <F2> :if &guioptions =~#'T' <Bar>
\set guioptions-=T <Bar>
\else <Bar>
\set guioptions+=T <Bar>
\endif<CR>

:inoremap <S-ENTER> <c-r>=SkipPair()<CR>
:inoremap <S-SPACE> <ESC>la
:inoremap <C-ENTER> <ESC>A;<CR>
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
":inoremap { <c-r>=ClsoeBrace()<CR>
":inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:nnoremap ;; A;<ESC><CR>
":noremap <c-t>=NERDTree

function! ClosePair(char)
   if getline('.')[col('.') - 1] == a:char
      return "\<Right>"
   else
      return a:char
   endif
endf
function! Semicolon()
   "echo getline('.')[col('.')]
   if getline('.')[col('.')] == ')'
      return "<ESC>A;"
   elseif getline('.')[col('.')] == '}'
      return "\<ESC>A;"
   elseif getline('.')[col('.')] == ']'
      return "\<ESC>A;"
   elseif getline('.')[col('.')] == '>'
      return "\<ESC>A;"
   else
      return ";"
   endif
endf
function! SkipPair()
   if getline('.')[col('.') - 1] == ')'
      return "\<ESC>o"
   else
      normal j
      let curline = line('.')
      let nxtline = curline
      while curline == nxtline
         if getline('.')[col('.') - 1] == '}'
            normal j
            let nxtline = nxtline + 1
            let curline = line('.')
            continue
         else
            return "\<ESC>i"
         endif
         
      endwhile
      return "\<ESC>o"
   endif
endf
function! ClsoeBrace()
   if getline('.')[col('.') - 2] == '='
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 3] == '='
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 1] == '{'
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 2] == '{'
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 2] == ','
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 3] == ','
      return "{}\<ESC>i"
   else
      return "{\<ENTER>}\<ESC>O"
   endif
endf

" 载入neocomplcache的配置文件
source ~/.vim/neocomplcache.conf

"始终显示状态栏并设置powerline插件主题
set laststatus=2
"powerline{
let g:Powerline_symbols = 'fancy'
"}

" airline configurations
" let g:airline_powerline_fonts = 0
" let g:airline_theme = 'molokai'

"关于taglist的配置
"taglist{
let Tlist_Show_One_File = 1 "只显示当前文件的taglist，默认是显示多个
let Tlist_Exit_OnlyWindow = 1  "如果taglist是最后一个窗口，则退出vim
let Tlist_Use_Left_Window = 1 "在右侧窗口中显示taglist
let Tlist_GainFocus_On_ToggleOpen = 1 "打开taglist时，光标保留在taglist窗口
let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags' "设置ctags命令的位置
nnoremap <leader>tl : Tlist<CR> "设置关闭和打开taglist窗口的快捷键
"set tags=/Users/changtong2011/python/tags, /Users/changtong2011/c/tags
"}

" set vim-coffee-script

" 此处用来进行各种配置新选项的测试写入
let g:user_emmet_settings = {
\   'php': {
\       'extends': 'html',
\       'filters': 'c',
\   },
\   'xml': {
\       'extends': 'html',
\   },
\   'haml': {
\       'extends': 'html',
\   },
\}

" 80 tip
if exists('+colorcolumn')
  set colorcolumn=80
else
  " Emulate
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif

" you complete me
let g:ycm_key_list_select_completion = ['<C-N>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-P>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-N>'
