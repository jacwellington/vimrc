set clipboard=unnamed
set nocompatible               " be iMproved
set runtimepath=~/.vimruntime,$VIMRUNTIME
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set incsearch		" Incremental search
filetype on
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
	set ttymouse=sgr
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

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

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
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'aspnet.vim'
Bundle 'django.vim'
"
" original repos on github
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-markdown'
Bundle 'aaronj1335/underscore-templates.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'farneman/Expression-Engine-Vim-syntax'
Bundle 'StanAngeloff/php.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tmhedberg/matchit'
Bundle 'iangreenleaf/yaml.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tyok/ack.vim'
Bundle 'tyok/nerdtree-ack'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-notes'
Bundle 'wesQ3/vim-windowswap'
Bundle 'sjl/vitality.vim'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-surround'
" vim-scripts repos
Bundle 'LustyJuggler'
Bundle 'LustyExplorer'
Bundle 'yaml.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Tabmerge'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


" Experimental

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
map <leader>bo :call DeleteInactiveBufs()<cr>
