# vim
vim configuration

==========================================
2015-12-16
Configurazione di vim come IDE javascript e non solo.

reference:
http://oli.me.uk/2015/06/17/wrangling-javascript-with-vim

Plugin management:
   vim-plug (https://github.com/junegunn/vim-plug)

Modularità:
La configurazione è modularizzata attraverso il file ".vim/bootstrap.vim" che carica tutti i file di configurazione presente nella directory modules.
Uno di questi file di configurazione è ".vim/plugin.vim" che configura vim-plug e carica i singoli file di configurazione di ogni plugin dalla directory ".vim/modules/plugins". Questo permette di avere la lista dei plugin utilizzati lineare e pulita, ognuno con la sua configurazione.
/
