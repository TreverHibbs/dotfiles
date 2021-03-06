" Name:         New Theme
" Author:       Trever Hibbs
" Maintainer:   Trever Hibbs
" License:      Vim License (see `:help license`)
" Last Updated: Tue 12 Jul 2022 02:19:52 PM PDT

" Generated by Colortemplate v2.2.0

set background=dark

hi clear
let g:colors_name = 'New'

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 1

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#fafafa', '#fafafa', '#fafafa', '#fafafa', '#fafafa', '#fafafa', '#fafafa', '#fafafa', '#333333', '#333333', '#333333', '#333333', '#333333', '#333333', '#333333', '#333333']
endif
hi Normal guifg=#fafafa guibg=#333333 gui=NONE cterm=NONE

if s:t_Co >= 256
  hi Normal ctermfg=231 ctermbg=236 cterm=NONE
  unlet s:t_Co
  finish
endif

" Background: dark
" Color:      myblack #333333 ~
" Color:      mywhite #fafafa ~
" Term colors: mywhite mywhite mywhite mywhite mywhite mywhite mywhite mywhite
" Term colors: myblack myblack myblack myblack myblack myblack myblack myblack
" vim: et ts=2 sw=2
