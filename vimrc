" set backupdir
" set backupdir=~/.vim/bkup

set textwidth=0
" set encoding
set encoding=utf8

" Mark tabs and spaces
set list listchars=tab:»\ ,trail:·,extends:»,precedes:«

" Work coding style 2 spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
" For kernel set tabstop to 8
" set tabstop=8 set softtabstop=8 set shiftwidth=8

" Personal tab to 4
" set tabstop=8 set softtabstop=8 set shiftwidth=8

" This paragraph was taken from defaults.vim
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200         " keep 200 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set wildmenu            " display completion matches in a status line

set ttimeout            " time out for key codes
set ttimeoutlen=100     " wait up to 100ms after Esc for special key

" When expandtab is set => tab = x spaces
set expandtab
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
set mouse=

map <Tab> <C-W>w

map - <c-w><
map + <c-w>>

nmap <Space> <PageDown>

set hlsearch

" Highlight with red characters over 80 on a line
set colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
command M80 match OverLength /\%80v.\+/
command NOM80 match
" Automatically remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

""" Tree View for files """
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 12
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

"source ~/.vim/plugins/cscope_maps.vim

if has("cscope")
        " Look for a 'cscope.out' file starting from the current directory,
        " going up to the root directory.


"        if filereadable("cscope.out")
"            cs add cscope.out
        let s:dirs = split(getcwd(), "/")
        while s:dirs != []
                let s:path = "/" . join(s:dirs, "/")
                if (filereadable(s:path . "/cscope.out"))
                        set nocscopeverbose
                        execute "cs add " . s:path . "/cscope.out " . s:path . " -v"
                        break
                endif
                let s:dirs = s:dirs[:-2]
        endwhile

        set csto=0	" Use cscope first, then ctags
        set cst		" Only search cscope
        set csverb	" Make cs verbose

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

nnoremap <F5> :cp<CR>
nnoremap <F6> :cn<CR>
