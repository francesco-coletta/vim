# vim
vim configuration

Installation:

   git clone https://github.com/francesco-coletta/vim.git ~/.vim

Create in home folder sylinks:

   * ln -s ~/.vim/vimrc ~/.vimrc
   * ln -s ~/.vim/gvimrc ~/.gvimrc




==========================================

--------------------------
Keep your dotfiles in git
--------------------------
This trick allows to archive in same folder vim configuration files.


reference:
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

In your home folder are contained the following vim file/dir:
   - .vim folder
   - .vimrc
   - .gvmirc (optional)

Move the configuration dotfiles -vimrc and .gvimrc into .vim directory:
   mv .vimrc ~/.vim/vimrc
   mv .gvimrc ~/.vim/gvimrc

Create symbolic links so that:
   - ~/.vimrc points to ~/.vim/vimrc
   - ~/.gvimrc points to ~/.vim/gvimrc

with following command:
   - ln -s ~/.vim/vimrc ~/.vimrc
   - ln -s ~/.vim/gvimrc ~/.gvimrc


--------------------------
Configurazione di vim come IDE javascript e non solo.
--------------------------

reference:
http://oli.me.uk/2015/06/17/wrangling-javascript-with-vim

Plugin management:
   vim-plug (https://github.com/junegunn/vim-plug)

Modularità:
La configurazione è modularizzata attraverso il file ".vim/bootstrap.vim" che carica tutti i file di configurazione presente nella directory modules.
Uno di questi file di configurazione è ".vim/plugin.vim" che configura vim-plug e carica i singoli file di configurazione di ogni plugin dalla directory ".vim/modules/plugins". Questo permette di avere la lista dei plugin utilizzati lineare e pulita, ognuno con la sua configurazione.
/
