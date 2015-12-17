" Enable persistent undo.
"set undofile
"set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

if exists('+undofile')
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/.undo
  " :help undo-persistence

  "if isdirectory($HOME . '/.vim/.undo') == 0
  if isdirectory($HOME . '/tmp/vim/undo') == 0
    :silent !mkdir -p ~/tmp/vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//,~/tmp/vim/undo//
  set undofile
endif
