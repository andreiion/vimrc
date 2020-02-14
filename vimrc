set textwidth=0
" set encoding
set encoding=utf8

" Mark tabs and spaces
set list listchars=tab:»\ ,trail:·,extends:»,precedes:«


"""""""""""""""""""""""""""""""""""""""""""""""""""
""" Coding Style Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""
" When expandtab is set => tab = x spaces
set expandtab

" 2 Spaces Coding Style
set tabstop=2 softtabstop=2  shiftwidth=2 smarttab

" Personal weird Coding Style
"set tabstop=4 softtabstop=0 shiftwidth=4 smarttab

" Linux Kernel Coding Style
"set tabstop=8 softtabstop=8 shiftwidth=8 smarttab
"""""""""""""""""""""""""""""""""""""""""""""""""""
" End Coding Style Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Number of context lines you would like to see above and below the cursor.
set scrolloff=5

" This paragraph was taken from defaults.vim
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200         " keep 200 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set wildmenu            " display completion matches in a status line

set ttimeout            " time out for key codes
set ttimeoutlen=100     " wait up to 100ms after Esc for special key

set autoindent
set smartindent
set hidden
set splitright
set splitbelow
set number

syntax on
filetype plugin indent on
set cinoptions=:0,l1,(0
syn on se title
" load manual pages
runtime ftplugin/man.vim

" now we can use middle click to paste over SSH
"set mouse=nicr
set mouse=

" Change between windows with Tab key
map <Tab> <C-W>w

" Reduce and increase the size of windows in split screen mode
map - <c-w><
map + <c-w>>

set hlsearch

set term=screen-256color

" Highlight with red characters over 80 on a line
set colorcolumn=100
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
command M80 match OverLength /\%80v.\+/
command NOM80 match
" Automatically remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e



"""""""""""""""""""""""""""""""
""" Vim Airlines Theme settings
"""""""""""""""""""""""""""""""
let g:airline_theme='dracula'


""""""""""""""""""""""""""""""
"""End Vim Airlines Theme"""""
""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""
"""Syntastic recommended default values""""""
"""""""""""""""""""""""""""""""""""""""""""""
"set statusline+=%F
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
"let g:syntastic_python_checkers = ['pylint']
""""""""""""""""""""""""""""""""""""""""""""""
"""End Syntastic recommended default values"""
""""""""""""""""""""""""""""""""""""""""""""""



if has("cscope")
        " Look for a 'cscope.out' file starting from the current directory,
        " going up to the root directory.

        " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
        set cscopetag

        set nocscopeverbose
        "set csverb " Make cs verbose

        " check cscope for definition of a symbol before checking ctags: set to 1
        " if you want the reverse search order.
        set csto=0

        set cst                 " Only search cscope

        " add any cscope database in current directory
        if filereadable("cscope.out")
                cs add cscope.out
        " else add the database pointed to by environment variable
        elseif $CSCOPE_DB != ""
                cs add $CSCOPE_DB
        endif

"        's' symbol: găsește toate referințele simbolului marcat de cursor
"        'g' global: găsește definițiile globale ale simbolului marcat de cursor
"        'c' calls: găsește toate apelurile funcției marcate de cursor
"        't' text: găsește toate instanțele textului marcat de cursor
"        'e' egrep: căutare egrep pentu cuvântul marcat de cursor
"        'f' file: deschide fișierul cu numele marcat de cursor
"        'i' includes: găsește fișiere care includ numele fișierului marcat de cursor
"        'd' called: găsește funcțiile apelate de către funcția marcată de cursor
        nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

        nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

        " Open a quickfix window for the following queries.
        set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
endif

" Mapping for Linux
"nnoremap <F5> :cp<CR>
"nnoremap <F6> :cn<CR>

" Mapping for OS X
nnoremap ∆ :cp<CR>
nnoremap ˚ :cn<CR>
