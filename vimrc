
"-------------------------------------------
"Imposto la directory di backup e quella temporanea in modo che vim non crei i file di backup e temp nella cartella corrente
"IMP: the folder must be exist
"Reference: http://ammonsonline.com/stop-vim-from-crapping-in-my-directories/

set backupdir=~/tmp/vim,.
set dir=~/tmp/vim//,.





"-------------------------------------------
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

