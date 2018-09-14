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

nmap <Space> <PageDown>


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

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

    " Open a quickfix window for the following queries.
    set cscopequickfix=s-,c-,d-,i-,t-,e-,g-

endif

"if has("cscope")
"        " Look for a 'cscope.out' file starting from the current directory,
"        " going up to the root directory.
"        let s:dirs = split(getcwd(), "/")
"        while s:dirs != []
"                let s:path = "/" . join(s:dirs, "/")
"                if (filereadable(s:path . "/cscope.out"))
"                        execute "cs add " . s:path . "/cscope.out " . s:path . " -v"
"                        break
"                endif
"                let s:dirs = s:dirs[:-2]
"        endwhile
"
"        set csto=0	" Use cscope first, then ctags
"        set cst		" Only search cscope
"        set csverb	" Make cs verbose
"
""        's' symbol: găsește toate referințele simbolului marcat de cursor
""        'g' global: găsește definițiile globale ale simbolului marcat de cursor
""        'c' calls: găsește toate apelurile funcției marcate de cursor
""        't' text: găsește toate instanțele textului marcat de cursor
""        'e' egrep: căutare egrep pentu cuvântul marcat de cursor
""        'f' file: deschide fișierul cu numele marcat de cursor
""        'i' includes: găsește fișiere care includ numele fișierului marcat de cursor
""        'd' called: găsește funcțiile apelate de către funcția marcată de cursor
"        nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"        nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"        nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"
"        nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
"        nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"        nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
"
"
"        " Open a quickfix window for the following queries.
"        set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
"endif
