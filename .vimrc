py3 3
"{{{ Pathogen
set modeline
set modelines=5
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"}}}

set shortmess=a
set debug=
if has('balloon_eval')
    set noballooneval
endif
"set scrolloff=10
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
set wildmode=list:longest
set wildignore+=*.o,*.obj,.git,*.pyc
let $GOPATH="/HDD/Users/shtucer/Projects/go"

set pumheight=8 " Keep a small completion window
set matchpairs+=<:>
"{{{ GUI
if has('win32')
"    set guifont=Consolas:h13:cRUSSIAN
"    set guifont=DejaVu_Sans_Mono_for_Powerline:h13:cRUSSIAN
    set guifont=Consolas\ for\ Powerline\ FixedD:h13:cRUSSIAN
elseif has('unix') && !has('gui_macvim')
    set guifont=Consolas\ for\ Powerline\ FixedD\ 13
endif
if has('gui_macvim')
"    set guifont=Inconsolata\ for\ Powerline:h16
"    set guifont=Ubuntu\ Mono\ for\ Powerline:h17
"    set guifont=Menlo:h14
"    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
    set guifont=InputMono\ Thin:h12
    set lines=999 columns=9999
    set macmeta
endif
if has("gui_running")
"	colorscheme zenburn-no-bold
    colorscheme yowish
else
"	colorscheme desert
    colorscheme yowish
    syntax on
endif
"language mes en
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=b
set guioptions-=L
set colorcolumn=79
set nu
set rnu
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
set linespace=2
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
set si  " smartindent
set shiftround
set cindent shiftwidth=4 " Set cindent on to autoinent when editing C/C++ file, with 4 shift width
set shiftwidth=4
set tabstop=4 " Set tabstop to 4 characters
set expandtab " Set expandtab on, the tab will be change to space automaticaly
set softtabstop=4
"{{{ Guides
    let g:indent_guides_start_level=2
    let g:indent_guides_guide_size=1
    let g:indent_guides_space_guides=4
    let g:indent_guides_enable_on_vim_startup=0

    let g:indentLine_char="│"
    let g:indentLine_color_gui = "#A4E57E"
    let g:indentLine_enabled = 1
"}}}
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

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

map <silent> <C-s> :w<cr>
imap <silent> <C-s> <esc>:w<cr>
map <silent> <F8> :WMToggle<cr>
imap <silent> <F8> <esc>:WMToggle<cr>

map <silent> <S-F8> :TagbarToggle<cr>
imap <silent> <S-F8> <esc>:TagbarToggle<cr>i

map <silent> <leader>w :set wrap!<cr>
map <silent> <leader>n :set number!<cr>
map <silent> <leader>rn :set relativenumber!<cr>
" Buffer switching
map <silent> <C-S-Tab> :bp<cr>
map <silent> <C-Tab> :bn<cr>
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


" Autocomplete remap to Control-Space
imap <C-Space> <C-X><C-O>

" Drag line/lines verticaly
noremap <A-j> :m+<CR>
noremap <A-k> :m-2<CR>
inoremap <A-j> <Esc>:m+<CR>
inoremap <A-k> <Esc>:m-2<CR>
vnoremap <A-j> :m'>+<CR>gv

nmap <silent><leader>o :browse confirm e<cr>
vmap <silent><leader>o <esc>:browse confirm e<cr>
" imap <silent><C-S-O> <esc>:browse confirm e<cr>

" copy paragraph
noremap cp yap<S-}>p

map <silent><C-S-Up> :resize +2<cr>
map <silent><C-S-Down> :resize -2<cr>
map <silent><C-S-Right> :vertical resize +2<cr>
map <silent><C-S-Left> :vertical resize -2<cr>
" set Ctrl+j in insert mode, like VS.Net
"imap <unique> <C-j> <C-X><C-O>
"imap <unique> <C-Tab> <C-X><C-O>

map <silent><C-S-Up> :resize +2<cr>
map <silent><C-S-Down> :resize -2<cr>
map <silent><C-S-Right> :vertical resize +2<cr>
map <silent><C-S-Left> :vertical resize -2<cr>
" set Ctrl+j in insert mode, like VS.Net
"imap <unique> <C-j> <C-X><C-O>
"imap <unique> <C-Tab> <C-X><C-O>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>C :cclose<CR>

" Buffer list
nmap <leader>b :ls<CR>:buffer<Space>
nmap <leader>be :BufExplorer<CR>
" Better intendation
vnoremap > >gv
vnoremap < <gv

" Scroll and word jump
nmap <C-j> 10jzz
imap <C-j> <esc>10jzzi
nmap <C-h> b
imap <C-h> <esc>bi
nmap <C-k> 10kzz
imap <C-k> <esc>10kzzi
nmap <C-l> w
imap <C-l> <esc>wi
nmap <C-Left> b
nmap <C-Right> w
nmap <C-Up> 10kzz
nmap <C-Down> 10jzz
imap <C-Left> <esc>bi
imap <C-Right> <esc>wi
imap <C-Up> <esc>10kizz
imap <C-Down> <esc>10jizz
"
" Providing by Project plugin
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
map <C-w>w <esc>:wincmd w<cr>
map <C-w>k <esc>:wincmd k<cr>
map <C-w>j <esc>:wincmd j<cr>
map <c-w>h <esc>:wincmd h<cr>
imap <C-w>w <esc>:wincmd w<cr>
imap <C-w>k <esc>:wincmd k<cr>
imap <C-w>j <esc>:wincmd j<cr>
imap <c-w>h <esc>:wincmd h<cr>
"}}}
"{{{ Commands
cmap w!! w !sudo tee % > /dev/null %
"}}}
"{{{ Plugins
"{{{ Auto Pairs
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '<':'>'}

"}}}
"{{{ Bufexplorer
let g:bufExplorerResize=0
"}}}
"{{{ Clang Complete
let g:clang_complete_copen=1
let g:clang_hl_errors=1
let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"
"}}}
"{{{ Tagbar
let g:tagbar_iconchars = ['►', '▼']

let g:tagbar_type_scala = {
            \ 'ctagstype' : 'Scala',
            \ 'kinds'     : [
            \ 'p:packages:1',
            \ 'V:values',
            \ 'v:variables',
            \ 'T:types',
            \ 't:traits',
            \ 'o:objects',
            \ 'a:aclasses',
            \ 'c:classes',
            \ 'r:cclasses',
            \ 'm:methods'
            \ ]
            \ }

let g:tagbar_type_css = {
            \ 'ctagstype' : 'css',
            \ 'kinds' : [
            \ 'c:class',
            \ 'i:id',
            \ 't:tag',
            \ 'm:media'
            \ ]
            \ }

let g:tagbar_type_htmldjango = {
            \ 'ctagstype' : 'htmldjango',
            \ 'kinds' : [
            \ 'i:objects',
            \ 'c:classes'
            \ ]
            \}

let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }

"}}}
"{{{ Winmanager
"let g:winManagerWindowLayout = "ProjectExplorer,FileExplorer"
let g:winManagerWindowLayout = "ProjectExplorer,NERDTree"
let g:debugWinManager = 0
"}}}
"{{{ Project
let g:proj_flags = "imtsb"
au BufCreate,BufEnter,BufLeave *.vimprojects :setlocal nonu nornu

"}}}

"{{{ CMakeProject
if has('win32')
    let g:cmake_project_keys='-G "MinGW Makefiles"'
endif
"}}} CMakeProject
"{{{ Jedi Vim
let g:jedi#auto_initialization=1
let g:jedi#auto_vim_configuration=1
let g:jedi#force_py_version=3
"call jedi#force_py_version(3)
"}}}"

"{{{ Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=2
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_python_python_exec = 'python3'
"}}}

"{{{ Powerline
let g:Powerline_symbols = 'unicode'
let g:Powerline_symbols_override = {'BRANCH': 'ψ', 'LINE': '↳',}
set fillchars+=stl:~
"let g:Powerline_symbols = 'fancy'
let g:Powerline_dividers_override=['►','►','◁','◁']
"let g:airline_left_sep="►"
"let g:airline_right_sep="◁"
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
"let g:airline_theme="solarized"
let g:airline_theme="yowish"

"{{{ File type specific
"{{{ C++
au FileType c,cpp,h set completeopt=menuone,menu,longest
set	cinoptions=>s,e0,n0,f0,{0,}0,^0,:0,=s,l0,b0,g0,hs,ps,ts,is,+s,c3,C0,0,(0,us,U0,w0,W0,m0,j0,)20,*30

"}}}

"{{{ Scala


"}}}

"{{{ Go
let g:go_fmt_autosave = 1
au FileType go set expandtab

au FileType go nmap <leader>gi :GoImport 
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>K <Plug>(go-doc)

au BufNew,BufEnter *.go :setlocal expandtab
"au FileType go set omnifunc=go#complete#Complete
"
let g:go_highlight_methods=1
let g:go_highlight_extra_types=1
let g:go_highlight_operators=1
let g:go_highlight_functions=1

"}}}

"{{{ Java/Scala

au FileType scala setlocal omnifunc=eclim#scala#complete#CodeComplete
au FileType scala setlocal completefunc=eclim#scala#complete#CodeComplete


au FileType java setlocal omnifunc=eclim#java#complete#CodeComplete
"au FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
au FileType java setlocal completefunc=eclim#java#complete#CodeComplete
au FileType scala setlocal shiftwidth=4

au FileType scala nnoremap <leader>gd :ScalaSearch<cr>
au FileType scala nnoremap <leader>gi :ScalaImport<cr>
au FileType java nnoremap <leader>gi :JavaImport<cr>
au FileType java nnoremap <leader>gd :JavaSearchContext<cr>
"}}}

"{{{ Python
" python-mode
" https://github.com/klen/python-mode
let g:pymode_python='python3'
let g:pymode_virtualenv=1 " Auto fix vim python paths if virtualenv enabled
let g:pymode_folding=1  " Enable python folding
let g:pymode_utils_whitespaces=0  " Do not autoremove unused whitespaces
map <Leader>rgd :call RopeGotoDefinition()<CR>
map <Leader>pl :PyLint<CR>
let ropevim_enable_shortcuts=1
let g:pymode_rope_goto_def_newwin="vnew"
let g:pymode_rope_extended_complete=0
let g:pymode_syntax=1
let g:pymode_syntax_builtin_objs=1
let g:pymode_syntax_builtin_funcs=1
let g:pymode_lint_ignore = "C0110 Exported"  " ignore pep257 missing docstring warning
let g:pymode_lint_minheight = 5   " Minimal height of pylint error window
let g:pymode_lint_maxheight = 15  " Maximal height of pylint error window
let g:pymode_lint_write = 0  " Disable pylint checking every save
let g:pymode_run_key = "<leader>run"  " default key conflicts with jedi-vim
let g:pymode_lint_mccabe_complexity = 10
let g:pymode_lint_checker="pyflakes,pep8,pep257,mccabe"
let g:pymode_syntax_highlight_self=1  " do not highlight self
let g:pymode_rope_vim_completion=0  " use jedi-vim for completion
let g:pymode_rope_guess_project=0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_doc_key="<leader>k"  " used jedi-vim for help
let g:pymode_rope=1
let g:pymode = 1
let g:pymode_folding = 1
"let g:pymode_utils_whitespaces = 1
""{{{ Pymode highlight
"" Enable pymode's custom syntax highlighting
"let g:pymode_syntax = 1

"" Enable all python highlightings
"let g:pymode_syntax_all = 1

"" Highlight "print" as function
"let g:pymode_syntax_print_as_function = 0

"" Highlight indentation errors
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all

"" Highlight trailing spaces
"let g:pymode_syntax_space_errors = g:pymode_syntax_all

"" Highlight string formatting
"let g:pymode_syntax_string_formatting = g:pymode_syntax_all

"" Highlight str.format syntax
"let g:pymode_syntax_string_format = g:pymode_syntax_all

"" Highlight string.Template syntax
"let g:pymode_syntax_string_templates = g:pymode_syntax_all

"" Highlight doc-tests
"let g:pymode_syntax_doctests = g:pymode_syntax_all

"" Highlight builtin objects (__doc__, self, etc)
"let g:pymode_syntax_builtin_objs = g:pymode_syntax_all

"" Highlight builtin functions
"let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all

"" Highlight exceptions
"let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all

"" For fast machines
"let g:pymode_syntax_slow_sync = 0"
""}}}

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
function! g:ActivateVirtualEnv()
"    if has('python') || has('python3')
python3 << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    #    execfile(activate_this, dict(__file__=activate_this))
    exec(open(activate_this, 'rb').read(), dict(__file__=activate_this))
    print(project_base_dir)
EOF
"    endif
endfunction
call g:ActivateVirtualEnv()
au FileType python set foldmethod=indent
"au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal omnifunc=jedi#completions

au FileType python set completeopt-=preview

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"}}}
"}}}
"{{{ AutoCommand
" Tapestry template
au BufNewFile,BufRead *.tml :set filetype=html

" Vim keywords
autocmd FileType vim setlocal keywordprg=:help 
"}}}
"au BufNew,BufNewFile,BufRead * i
" vim: set fdm=marker fen fdl=4:
