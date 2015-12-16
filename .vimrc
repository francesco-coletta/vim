" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2014 Feb 05
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"------------------------------------


"04/03/2014: Installed pathogen
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()


"-----------------------------
"https://github.com/altercation/vim-colors-solarized
"http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide
"https://github.com/scrooloose/syntastic

"Code Folding
set foldmethod=indent
set foldlevel=99

"Task lists
map <leader>td <Plug>TaskList

"Revision History
map <leader>g :GundoToggle<CR>

"Syntax Highlighting and Validation
syntax on                    " syntax highlighing
filetype on                  " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

"Pep8

"Tab Completion and Documentation
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

"File Browser
map <leader>n :NERDTreeToggle<CR>

"Refactoring and Go to definition
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

"Searching
nmap <leader>a <Esc>:Ack!

"Virtualenv
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

"-----------------------------
"https://github.com/altercation/vim-colors-solarized
syntax enable
set background=dark
"set background=light
colorscheme solarized

"light background mode of Solarized:
"set background=light

"if has('gui_running')
"    set background=light
"else
"    set background=dark
"endif



"------------------------------------------------
"Save edit session
"To save current session
" :SetSession PROJ1
"------------------------------------------------
au VimLeave * call VimLeave()
au VimEnter * call VimEnter()
let g:PathToSessions = $HOME . "/.vim/sessions/"

function! VimEnter()
  if argc() == 0
    let LoadLastSession = confirm("Restore last session?", "&Yes\n&No")
    if LoadLastSession == 1
      exe "source " . g:PathToSessions . "/LastSession.vim"
    else
      call LoadSessions()
    endif
  endif
endfunction

function! LoadSessions()
  let result = "List of sessions:"
  let sessionfiles = glob(g:PathToSessions . "/*.vim")
  while stridx(sessionfiles, "\n") >= 0
    let index = stridx(sessionfiles, "\n")
    let sessionfile = strpart(sessionfiles, 0, index)
    let result = result . "\n " . fnamemodify(sessionfile, ":t:r")
    let sessionfiles = strpart(sessionfiles, index + 1)
  endwhile
  let result = result . "\n " . fnamemodify(sessionfiles, ":t:r")
  let result = result . "\n" . "Please enter a session name to load (or empty to start normally):"
  let sessionname = input(result)
  if sessionname != ""
    exe "source " . g:PathToSessions . "/" . sessionname . ".vim"
  endif
endfunction


function! VimLeave()
  exe "mksession! " . g:PathToSessions . "LastSession.vim"
  if exists("g:SessionFileName") == 1
    if g:SessionFileName != ""
      exe "mksession! " . g:SessionFileName
    endif
  endif
endfunction
" A command for setting the session name
com -nargs=1 SetSession :let g:SessionFileName = g:PathToSessions . "/" . <args> . ".vim"
" .. and a command to unset it
com -nargs=0 UnsetSession :let g:SessionFileName = ""



"-----------------------------------------------------
" Folding
"-----------------------------------------------------
set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

