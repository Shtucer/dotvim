" Vim color file
" Maintainer:	Hans Fugal <hans@fugal.net>
" Last Change:	$Date: 2004/06/13 19:30:30 $
" Last Change:	$Date: 2004/06/13 19:30:30 $
" URL:		http://hans.fugal.net/vim/colors/desert.vim
" Version:	$Id: desert.vim,v 1.1 2004/06/13 19:30:30 vimboss Exp $

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
let g:colors_name="lordesert"

hi Normal	guifg=White guibg=#2e3436 

" highlight groups
hi Cursor	guibg=khaki guifg=slategrey
"hi CursorIM
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
hi ErrorMsg gui=undercurl guisp=red guibg=grey20
hi Pmenu guibg=slategrey guifg=gold
hi PmenuSel gui=underline guibg=grey30 guifg=gold
" hi ErrorMsg     guibg=grey20 guifg=orangered gui=undercurl guisp=red
hi VertSplit	guibg=slategrey guifg=#555753 gui=bold
hi SignColumn	guibg=grey20 guifg=grey50 gui=none

hi Folded	guibg=#272c2d guifg=lightblue
hi FoldColumn	guibg=#272c2d guifg=tan
hi IncSearch	guifg=slategrey guibg=khaki
hi LineNr guifg=lightblue
hi ModeMsg	guifg=goldenrod
hi MoreMsg	guifg=SeaGreen
hi NonText	guifg=LightBlue guibg=#272c2d
hi Question	guifg=springgreen
hi Search	guibg=peru guifg=wheat
hi SpecialKey	guifg=yellowgreen
hi StatusLine	guibg=slategrey guifg=black  gui=bold
hi StatusLineNC	guibg=slategrey guifg=black gui=none
hi Title	guifg=indianred
hi Visual	guifg=khaki guibg=olivedrab
"hi VisualNOS
hi WarningMsg	guifg=darkgrey
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting groups
hi Comment	guifg=SkyBlue
hi Constant	guifg=#ffa0a0
hi Identifier	guifg=palegreen
hi Statement	guifg=khaki gui=none
hi PreProc	guifg=indianred
hi Type		guifg=darkkhaki
hi Special	guifg=navajowhite
"hi Underlined
hi Ignore	guifg=grey40
"hi Error
hi Todo		guifg=orangered guibg=grey20 gui=bold,underline

" color terminal definitions
hi SpecialKey	ctermfg=darkgreen
hi NonText	ctermfg=darkblue
hi Directory	ctermfg=darkcyan
hi ErrorMsg	ctermfg=7 ctermbg=1
hi IncSearch	cterm=NONE ctermfg=yellow ctermbg=green
hi Search	cterm=NONE ctermfg=grey ctermbg=blue
hi MoreMsg	ctermfg=darkgreen
hi ModeMsg	cterm=NONE ctermfg=brown
hi LineNr	ctermfg=3
hi Question	ctermfg=green
hi StatusLine	cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi VertSplit	cterm=reverse
hi Title	ctermfg=5
hi Visual	cterm=reverse
hi VisualNOS	cterm=underline
hi WarningMsg	ctermfg=1
hi WildMenu	ctermfg=0 ctermbg=3
hi Folded	ctermfg=darkgrey ctermbg=NONE
hi FoldColumn	ctermfg=darkgrey ctermbg=NONE
hi DiffAdd	ctermbg=4
hi DiffChange	ctermbg=5
hi DiffDelete	ctermfg=4 ctermbg=6
hi DiffText	ctermbg=1
hi Comment	ctermfg=darkcyan
hi Constant	ctermfg=brown
hi Special	ctermfg=5
hi Identifier	ctermfg=6
hi Statement	ctermfg=3
hi PreProc	ctermfg=5
hi Type		ctermfg=2
hi Underlined	cterm=underline ctermfg=5
hi Ignore	ctermfg=7
hi Ignore	ctermfg=darkgrey
hi Error	ctermfg=7 ctermbg=1

hi ColorColumn	guibg=slategrey guifg=red

"vim: sw=4
