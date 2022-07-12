" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="my_theme"

hi Pmenu	guifg=White guibg=Grey
hi Whitespace	guifg=White guibg=Grey

"vim: sw=4
