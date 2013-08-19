" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "leo"

highlight Comment guifg=#808080 ctermfg=244
highlight Constant guifg=#ff0000 gui=NONE ctermfg=196 cterm=NONE
highlight Identifier guifg=#00ffff ctermfg=51
highlight Statement guifg=#c0c000 gui=bold ctermfg=3 cterm=bold
highlight PreProc guifg=#00ff00 ctermfg=46
highlight Type guifg=#00c000 ctermfg=2
highlight Special guifg=#ff7f3f ctermfg=12
highlight Error guibg=#ff0000 ctermbg=196
highlight Todo guifg=#000080 guibg=#c0c000 ctermfg=4 ctermbg=3
highlight Directory guifg=#00c000 ctermfg=2
highlight StatusLine guifg=#ffff00 guibg=#0000ff gui=NONE ctermfg=229 ctermbg=21 cterm=NONE
highlight Normal guifg=#ffffff guibg=#000000 ctermfg=231 ctermbg=16
highlight Search guibg=#c0c000 ctermbg=3
" Cursor line color
hi CursorLine cterm=underline gui=underline ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
hi CursorColumn cterm=NONE gui=NONE ctermbg=grey ctermfg=NONE guibg=darkorange guifg=NONE
" popup menu color
hi Pmenu ctermbg=255 guibg=#000000 guifg=#cc00ff
hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff
