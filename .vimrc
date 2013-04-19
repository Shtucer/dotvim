" vim:set fdm=marker:fen:fdl=4:
"{{{ Pathogen
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"}}}

set nocompatible
set noswapfile
set encoding=utf-8
set termencoding=utf-8
set t_Co=256
set fileformat=unix
set visualbell t_vb=
set novb
set noerrorbells
set title
set wildmenu
set wildmode=full
set wildignore+=*.o,*.obj,.git,*.pyc

set pumheight=8 " Keep a small completion window
set matchpairs+=<:>
"{{{ GUI
if has('win32')
"    set guifont=Consolas:h13:cRUSSIAN
"    set guifont=DejaVu_Sans_Mono_for_Powerline:h13:cRUSSIAN
    set guifont=Consolas\ for\ Powerline\ FixedD:h13:cRUSSIAN
elseif has('unix')
    set guifont=Consolas\ for\ Powerline\ FixedD\ 13
endif
if has("gui_running")
	colorscheme lordesert
else
	colorscheme desert 
endif
"language mes en
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=b
set guioptions-=L
set colorcolumn=79
set nu
set nowrap
set cursorline
set wildmenu " turn on wild menu, try typing :h and press <Tab> 
set showcmd	" display incomplete commands
set cmdheight=2 " 1 screen lines to use for the command-line 
set ruler " show the cursor position all the time
set hid " allow to change buffer without saving 
set shortmess=atI " shortens messages to avoid 'press a key' prompt 
set lazyredraw " do not redraw while executing macros (much faster) 
set display+=lastline " for easy browse last line with wrap text
set laststatus=2 " always have status-line
set linespace=1
"{{{ Folding
set fillchars+=fold:\ 
set foldcolumn=4
set numberwidth=4
"}}}
"{{{ Статусная строка
fun! <SID>SetStatusLine()
    let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
    let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
    let l:s3="%{fugitive#statusline()}"
    let l:s4="%=\\ 0x%-8B\\ \\ %-14.(%l:%L,%c%V%)\\ %<%P"
    execute "set statusline=" . l:s1 . l:s2 . l:s3 . l:s4
 endfun
call <SID>SetStatusLine()
" }}}
"}}}

"{{{ Syntax
filetype on
filetype plugin on
syntax on
set hlsearch

"}}}

"{{{ Indent
filetype indent on
set ai " autoindent
set so " smartindent
set shiftround
set cindent shiftwidth=4 " Set cindent on to autoinent when editing C/C++ file, with 4 shift width
set tabstop=4 " Set tabstop to 4 characters
set expandtab " Set expandtab on, the tab will be change to space automaticaly
set softtabstop=4

"}}}

"{{{ Search

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif
set incsearch " do incremental searching
set ignorecase " Set search/replace pattern to ignore case 
set smartcase " Set smartcase mode on, If there is upper case character in the search patern, the 'ignorecase' option will be override.
"}}}

"{{{ Key bindings
let mapleader=","

map <silent> <leader>ev :e $MYVIMRC<CR>
map <silent> <leader>/ :nohl<cr>
set backspace=indent,eol,start

map <silent> <C-s> :w<cr>
imap <silent> <C-s> <esc>:w<cr>
map <silent> <F8> :WMToggle<cr>
imap <silent> <F8> <esc>:WMToggle<cr>

" Buffer switching
map <silent> <C-Tab> :bn<cr>
map <silent> <C-S-Tab> :bp<cr>
imap <silent> <C-Tab> <esc>:bn<cr>
imap <silent> <C-S-Tab> <esc>:bp<cr>

" Undo/redo Ctrl-z and Ctrl-Shift-z
imap <silent><c-z> <esc>ui
nmap <silent><c-z> u
imap <silent><c-s-z> <esc>:red<cr>
nmap <silent><c-s-z> :red<cr>

map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

vmap <S-Delete> "+x
vmap <C-Insert> "+y
nmap <S-Insert> "+gp
imap <silent> <S-Insert> <esc> "+gp
vmap <C-X> "+x


nmap <silent><C-o> :browse confirm e<cr>
vmap <silent><C-o> <esc>:browse confirm e<cr>
imap <silent><C-o> <esc>:browse confirm e<cr>

map <silent><C-S-Up> :resize +2<cr>
map <silent><C-S-Down> :resize -2<cr>
map <silent><C-S-Right> :vertical resize +2<cr>
map <silent><C-S-Left> :vertical resize -2<cr>

" set Ctrl+j in insert mode, like VS.Net
imap <unique> <C-j> <C-X><C-O>
"imap <unique> <C-Tab> <C-X><C-O>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>


" Providing by Project plugin
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>

"}}}
"{{{ Commands
cmap w!! sudo tee % > /dev/null %
"}}}
"{{{ Plugins
"{{{ Bufexplorer
let g:bufExplorerResize=0
"}}}
"{{{ Clang Complete
let g:clang_complete_copen=1
let g:clang_hl_errors=1
"}}}
"{{{ Tagbar
let g:tagbar_iconchars = ['►', '▼']

"}}}
"{{{ Winmanager
let g:winManagerWindowLayout = "ProjectExplorer,CMakeProject,FileExplorer|TagbarExplorer,BufExplorer"
"}}}
"{{{ Project
let g:proj_flags = "imtsb"

"}}}

"{{{ CMakeProject
if has('win32')
    let g:cmake_project_keys='-G "MinGW Makefiles"'
endif
"}}} CMakeProject
"{{{ Powerline
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:~
"}}}Powerline
"}}}

"{{{ File type specific
"{{{ C++
au FileType c,cpp,h set completeopt=menuone,menu,longest
set	cinoptions=>s,e0,n0,f0,{0,}0,^0,:0,=s,l0,b0,g0,hs,ps,ts,is,+s,c3,C0,0,(0,us,U0,w0,W0,m0,j0,)20,*30

"}}}

"{{{ Python
"
let g:pymode_folding = 1
let g:pymode_utils_whitespaces = 1
"{{{ Pymode highlight
" Enable pymode's custom syntax highlighting
let g:pymode_syntax = 1

" Enable all python highlightings
let g:pymode_syntax_all = 1

" Highlight "print" as function
let g:pymode_syntax_print_as_function = 0

" Highlight indentation errors
let g:pymode_syntax_indent_errors = g:pymode_syntax_all

" Highlight trailing spaces
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Highlight string formatting
let g:pymode_syntax_string_formatting = g:pymode_syntax_all

" Highlight str.format syntax
let g:pymode_syntax_string_format = g:pymode_syntax_all

" Highlight string.Template syntax
let g:pymode_syntax_string_templates = g:pymode_syntax_all

" Highlight doc-tests
let g:pymode_syntax_doctests = g:pymode_syntax_all

" Highlight builtin objects (__doc__, self, etc)
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all

" Highlight builtin functions
let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all

" Highlight exceptions
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all

" For fast machines
let g:pymode_syntax_slow_sync = 0"
"}}}

au FileType python call s:CheckIfExpandTab() " if edit python scripts, check if have \t. ( python said: the programme can only use \t or not, but can't use them together )
function s:CheckIfExpandTab()
    let has_noexpandtab = search('^\t','wn')
    let has_expandtab = search('^    ','wn')

    "
    if has_noexpandtab && has_expandtab
        let idx = inputlist ( ["ERROR: current file exists both expand and noexpand TAB, python can only use one of these two mode in one file.\nSelect Tab Expand Type:",
                    \ '1. expand (tab=space, recommended)', 
                    \ '2. noexpand (tab=\t, currently have risk)',
                    \ '3. do nothing (I will handle it by myself)'])
        let tab_space = printf('%*s',&tabstop,'')
        if idx == 1
            let has_noexpandtab = 0
            let has_expandtab = 1
            silent exec '%s/\t/' . tab_space . '/g'
        elseif idx == 2
            let has_noexpandtab = 1
            let has_expandtab = 0
            silent exec '%s/' . tab_space . '/\t/g'
        else
            return
        endif
    endif

    " 
    if has_noexpandtab == 1 && has_expandtab == 0  
        echomsg 'substitute space to TAB...'
        set noexpandtab
        echomsg 'done!'
    elseif has_noexpandtab == 0 && has_expandtab == 1
        echomsg 'substitute TAB to space...'
        set expandtab
        echomsg 'done!'
    else
        " it may be a new file
        " we use original vim setting
    endif
endfunction

au FileType python set foldmethod=indent
au FileType python set omnifunc=pythoncomplete#Complete

au FileType python set completeopt-=preview

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"}}}
"}}}
