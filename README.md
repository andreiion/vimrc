
# vimrc

## Method 1. Add cscope to vim using plug-in
```
apt-get install vim
apt-get install cscope
mkdir ~/.vim/plugins
cd ~/.vim/plugins
wget http://cscope.sourceforge.net/cscope_maps.vim
echo "source ~/.vim/plugins/cscope_maps.vim" >> ~/.vimrc
```

## Method 2. Copy vimrc to ~/.vimrc :)
```
apt-get install vim
apt-get install cscope
```
Simple as that :)

## Final step
Copy script `gentags` to `$PATH` or to `/usr/bin/` so you can have global access.

## Usefull links
- Tutorial on [cscope](http://cscope.sourceforge.net/cscope_vim_tutorial.html)

# add plugins with new vim 8 package manager

## Plugin 1. Add Syntastic and Swift.vim

First, you need to be familiar with the new update from vim 8. Read the `:help packages` in vim.
```
vim # open vim from terminal 
:help packages
```

As seen in `:help packages`, everyting that is in the 'start' folder will automatically run when vim is opened.
```
mkdir -p ~/.vim/pack/bundle/start # use '-p' to create intermediate directories
```

Install Syntastic and Swift.vim
```
cd !$ # go to ~/.vim/pack/bundle/start
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
git clone --depth=1 https://github.com/keith/swift.vim
```

Copy the recommended settings into your vimrc file [1].
```
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
```

You're good to go! 
```
vim tadaaa.swift
```  

I personally do not use syntax checker, but you can read more stuff on it here [2].

## References
[1] https://github.com/vim-syntastic/syntastic  
[2] http://www.thecodedself.com/Vim-Swift/
