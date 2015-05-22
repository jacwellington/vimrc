set clipboard=unnamed
set nocompatible               " be iMproved
set runtimepath=~/.vimruntime,$VIMRUNTIME
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set incsearch		" Incremental search
set t_Co=256
syntax on
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
colorscheme desert
set number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
match OverLength /\%81v.\+/
set tabstop=4
set shiftwidth=4
set foldmethod=indent
set foldlevel=99
set ignorecase
set smartcase
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup
set noswapfile
set vb
set hidden
set backspace=2
if has("mouse")
	set mouse=a
endif
set guifont=Source\ Code\ Pro:h18

"Makes rvm work with vim
set shell=bash

set ttyfast


"Allows for highlighting and then control-r replacing
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
au BufNewFile,BufRead *.erb set filetype=eruby.html
au BufNewFile,BufRead *.god set filetype=ruby
au BufNewFile,BufRead *.js.erb set filetype=eruby.javascript
au BufNewFile,BufRead *.md set filetype=markdown

" Change leader mapping to ','
let mapleader = ','
" Set F2 to spell check
map <F2> :setlocal spell! spelllang=en_us<cr>

" Use space to go to command mode
noremap <space> :
" Paste keeping exact indentation
:nnoremap <C-v> "+P=']
" Add Tab Hotkeys
:nmap <S-Tab>} :tabn<cr>
:nmap <S-Tab>{ :tabp<cr>
:map <C-t> :tabnew<cr>
:map <leader>r :source ~/.vimrc<cr>

" Add Buffer Hotkeys
:map <leader>l :tabn<cr>
map <leader>h :tabp<cr>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>d :bdelete<CR>


" Open Nerdtree in current file
map <leader>n :NERDTreeToggle<cr>

let NERDTreeShowHidden=1

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tmhedberg/matchit'
Bundle 'scrooloose/nerdtree'
Bundle 'tyok/ack.vim'
Bundle 'tyok/nerdtree-ack'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-notes'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-surround'
" vim-scripts repos
Bundle 'Vundle.vim'
Bundle 'LustyJuggler'
Bundle 'LustyExplorer'
Bundle 'yaml.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'wincent/Command-T'

call vundle#end()
filetype plugin indent on     " required!

" Tab completion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


" Map Controls to change windows
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Map controls to swap window locations
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>

"Stop escape lag
set timeoutlen=1000 ttimeoutlen=0

" Open Nerdtree Tabs on startup
"let g:nerdtree_tabs_open_on_console_startup=1
"let g:nerdtree_tabs_open_on_gui_startup=1

" Show buffers at the top
"let g:airline#extensions#bufferline#enabled = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

"Integrate with syntastic
let g:airline#extensions#syntastic#enabled = 1
" Syntastic only show errors (not warnings)
let g:syntastic_quiet_messages = { "level": "warnings"}

"Git Gutter
let g:gitgutter_enabled = 0
let g:gitgutter_map_keys = 0
map <leader>gg :GitGutterToggle<cr>
"let g:airline#extensions#hunks#enabled = 1

autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

set ttyfast
set lazyredraw

" Git shortcuts
map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit<cr>
map <leader>gd :Gdiff<cr>
imap jk <esc>
imap Jk <esc>
imap JK <esc>

map <leader>j :LustyJuggler<cr>
let g:LustyJugglerShowKeys = 'a'



" Close all buffers but the open ones
function! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! Bdi :call DeleteInactiveBufs()
map <leader>o :call DeleteInactiveBufs()<cr>

" Vim folding
nnoremap zo zO
nnoremap zf zMzr

" Show statusline always
set laststatus=1
nnoremap <leader>a :set laststatus=1<CR>
nnoremap <leader>s :set laststatus=2<CR>

" Handlebars
au  BufNewFile,BufRead *.mustache,*.hogan,*.hulk,*.hjs set filetype=html.mustache syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
au  BufNewFile,BufRead *.handlebars,*.hbs set filetype=html.handlebars syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim

" Map Controls to change windows
noremap <C-k> <C-w><Up>
noremap <C-j> <C-w><Down>
noremap <C-l> <C-w><Right>
noremap <C-h> <C-w><Left>

"Allows for highlighting and then control-r replacing
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"Set filetypes
au BufNewFile,BufRead *.erb set filetype=eruby.html
au BufNewFile,BufRead *.god set filetype=ruby
au BufNewFile,BufRead *.js.erb set filetype=eruby.javascript
au BufNewFile,BufRead *.json.erb set filetype=eruby.javascript
au BufNewFile,BufRead *.md set filetype=markdown

"Command-T
let g:CommandTSCMDirectories = "pwd"
if &term =~ "xterm" || &term =~ "tmux"
	let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif

" NERDTree
map <leader>n :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

" Macvim fullscreen workaround
nnoremap <silent> <F5> :set lines=999 columns=999<CR>

"Supress conque term warnings
let g:ConqueTerm_StartMessages = 0

"Change cursor to line on insert
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

"Jump to last line
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
