" set backupdir
" set backupdir=~/.vim/bkup

set textwidth=80
" set encoding
set encoding=utf8

" Mark tabs and spaces
set list listchars=tab:»\ ,trail:·,extends:»,precedes:«
" For kernel set tabstop to 8
set tabstop=8
set softtabstop=8
set shiftwidth=8
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
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
command M80 match OverLength /\%80v.\+/
command NOM80 match
" Automatically remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e
