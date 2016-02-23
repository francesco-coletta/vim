" Set 256 colors in vi
" Ref: http://vim.wikia.com/wiki/256_colors_in_vim
set t_Co=256


" Backspace is managed by vim-sensible, but I need it here too because some
" plugins depend on it during start up.
set backspace=indent,eol,start

" Enable line numbers.
set number

" Enable invisible characters.
set nolist

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:▸␣             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen
set listchars+=eol:$
set listchars+=nbsp:☠

"Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59


" More natural splitting.
set splitbelow
set splitright

" Set a default indent, but vim-sleuth should adjust it.
set tabstop=4
set shiftwidth=4
set expandtab

" Enable mouse. Great for resizing windows and keeping co-workers sane.
set mouse=a

" Disable swap files.
set noswapfile

" Write files as they are, don't mess with line endings etc.
set binary

" Disable the completion preview window.
set completeopt-=preview

" Make session files minimal.
set sessionoptions=blank,curdir,folds,help,tabpages,winsize

" folding
set foldmethod=indent
set foldlevel=99
set foldnestmax=10
"set foldopen=all
"set foldclose=all
set foldcolumn=0
set nofoldenable

" resize multiple windows
nnoremap <silent> <Leader><Down> :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader><Up> :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader><Left> 10<C-w>><CR>
nnoremap <silent> <Leader><Right> 10<C-w><<CR>

" Switching to another buffer
" http://vim.wikia.com/wiki/Using_tab_pages
set switchbuf=usetab,newtab
nnoremap <F8> :sbnext<CR>
nnoremap <S-F8> :sbprevious<CR>

