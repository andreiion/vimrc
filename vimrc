set textwidth=0
" set encoding
set encoding=utf8

" Mark tabs and spaces
set list listchars=tab:»\ ,trail:·,extends:»,precedes:«

" Number of context lines you would like to see above and below the cursor.
set scrolloff=5

" Allow backspacing over everything in insert mode (taken from defaults.vim)
set backspace=indent,eol,start

set history=200               " keep 200 lines of command line history
set ruler                     " show the cursor position all the time
set showcmd                   " display incomplete commands
set wildmenu                  " display completion matches in a status line

set ttimeout                  " time out for key codes
set ttimeoutlen=100           " wait up to 100ms after Esc for special key

set autoindent
set smartindent
set hidden
set splitright
set splitbelow
set number                    " display line numbers
set relativenumber            " display relative line numbers

set mouse=a                    " now we can use middle click to paste over SSH
set hlsearch                  " highlight all search matches
set term=screen-256color

set path+=shared/**           " add all subdir from shared to path. Relative to current pwd

syntax on
filetype plugin indent on
set cinoptions=:0,l1,(0
syn on se title

" load manual pages
runtime ftplugin/man.vim

" Automatically remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e



""""""""""""""""""""""""""""
""" Vimrc quick commands """
""""""""""""""""""""""""""""

" Open vimrc
nnoremap <silent> <Leader>ev :<C-U>tab drop $MYVIMRC<CR>

" Reload vimrc
command! ReloadVimrc :source $MYVIMRC

""""""""""""""""""""""""""""
""" Vimrc quick commands """
""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""
""" Background Color Scheme and Higlight """"
"""""""""""""""""""""""""""""""""""""""""""""
"colorscheme desert
"set cursorline
"highlight CursorLine term=bold cterm=bold

set colorcolumn=120
highlight ColorColumn  ctermbg=252
"""""""""""""""""""""""""""""""""""""""""""""
""" End Background Color Scheme and Higlight """"
"""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
""" Coding Style Settings """"
""""""""""""""""""""""""""""""
" When expandtab is set => tab = x spaces
set expandtab

" 2 Spaces Coding Style
" set tabstop=2 softtabstop=2  shiftwidth=2 smarttab

" Personal weird Coding Style
set tabstop=4 softtabstop=0 shiftwidth=4 smarttab

" Linux Kernel Coding Style
"set tabstop=8 softtabstop=8 shiftwidth=8 smarttab
"""""""""""""""""""""""""""""""""
""" End Coding Style Settings """
"""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""
""" Mappings for a better life """
""""""""""""""""""""""""""""""""""
" Write buffer to file
nnoremap <silent> <Leader>w :<C-U>write<CR>


" Change between windows with Tab key
map <Tab> <C-W>w

" Reduce and increase the size of windows in split screen mode
map - <c-w><
map + <c-w>>

" Mapping for easy navigate in quickfix window (opened by cscope)
nnoremap <C-k> :cp<CR>
nnoremap <C-j> :cn<CR>

" Set <Leader>
let g:mapleader = ' '

" Go to previous/next tab
nnoremap <Leader>j gT<CR>
nnoremap <Leader>k gt<CR>


" Keep the screen centered or not (toggle action)
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
""""""""""""""""""""""""""""""""""""""
""" End Mappings for a better life """
""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""
""" Vim Airlines Theme settings """
"""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.linenr = 'Ξ'
let g:airline_symbols.readonly = 'ro'
"""""""""""""""""""""""""""""""""""""""
""" End Vim Airlines Theme settings """
"""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""
"""Syntastic recommended default values """
"""""""""""""""""""""""""""""""""""""""""""
"set statusline+=%F
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

"let g:syntastic_python_checkers = ['pylint']

"let g:syntastic_c_check_header = 1
"let g:syntastic_c_no_include_search = 1
"let g:syntastic_c_remove_include_errors = 1
"let g:syntastic_c_config_file = '.syntastic_config'                   " example: '-Ishared/dir1'
"let g:syntastic_c_include_dirs = [ 'shared/test1', 'shared/test2' ]   " does not include subdir

""""""""""""""""""""""""""""""""""""""""""""""""
""" End Syntastic recommended default values """
""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""
""" Clang integration """
"""""""""""""""""""""""""
"let g:clang_format#code_style="llvm"
"let g:clang_format#auto_format = 0
"map <C-h> :ClangFormat <CR>
"""""""""""""""""""""""""""""
""" End Clang integration """
"""""""""""""""""""""""""
""" NERD Tree integration """
"""""""""""""""""""""""""
nnoremap <Leader>n :NERDTree <CR>
nnoremap <Leader>nc :NERDTreeClose <CR>
"""""""""""""""""""""""""""""
""" end NERD Tree integration """
"""""""""""""""""""""""""""""



" [Windows only] Use this to make cursor block pretty in the amazing WCL
" let &t_ti.="\e[1 q"
" let &t_SI.="\e[5 q"
" let &t_EI.="\e[1 q"
" let &t_te.="\e[0 q"


""""""""""""""""""""""
""" Cscope Mapping """
""""""""""""""""""""""
if has("cscope")

    " Map cscope refresh
    nnoremap <Leader>c :!gentags <CR>
                       \:cs reset <CR>

    set cscopetag             " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set nocscopeverbose
    set csto=0                " use cscope first, then ctags
    set cst                   " only search cscope
    "set csverb i             " make cs verbose

    " add any cscope database in current directory
    if filereadable("cscope.out")
            cs add cscope.out
    elseif $CSCOPE_DB != ""   " else add the database pointed to by environment variable
            cs add $CSCOPE_DB
    endif

    " 's' symbol: găsește toate referințele simbolului marcat de cursor
    " 'g' global: găsește definițiile globale ale simbolului marcat de cursor
    " 'c' calls: găsește toate apelurile funcției marcate de cursor
    " 't' text: găsește toate instanțele textului marcat de cursor
    " 'e' egrep: căutare egrep pentu cuvântul marcat de cursor
    " 'f' file: deschide fișierul cu numele marcat de cursor
    " 'i' includes: găsește fișiere care includ numele fișierului marcat de cursor
    " 'd' called: găsește funcțiile apelate de către funcția marcată de cursor
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
""""""""""""""""""""""""""
""" End Cscope Mapping """
"""""""""""""""""""""""""
