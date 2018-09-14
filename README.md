
# vimrc

##Method 1. Add cscope to vim using plug-in.
'''
apt-get install vim
apt-get install cscope
mkdir ~/.vim/plugins
cd ~/.vim/plugins
wget http://cscope.sourceforge.net/cscope_maps.vim
echo "source ~/.vim/plugins/cscope_maps.vim" >> ~/.vimrc
'''

##Method 2. Copy vimrc to ~/.vimrc.
Simple as that :)

## Final step. G
Copy script `gentags` to `$PATH` or to `/usr/bin/` so you can have global access.

##Usefull links
- Tutorial on [cscope](http://cscope.sourceforge.net/cscope_vim_tutorial.html)
