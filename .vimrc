set nocompatible
" Set vars
set clipboard=unnamed
set runtimepath=~/.vimruntime,$VIMRUNTIME
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set incsearch		" Incremental search
set t_Co=256
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
" Initialize Vundle
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
Bundle 'othree/html5.vim'
Bundle 'vim-scripts/svg.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'derekwyatt/vim-scala'
Bundle 'tmhedberg/matchit'
Bundle 'scrooloose/nerdtree'
Bundle 'tyok/nerdtree-ack'
Bundle 'ivalkeen/nerdtree-execute'
Bundle 'tyok/ack.vim'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-notes'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-surround'
Bundle 'dag/vim-fish'
Bundle 'godlygeek/tabular'
"Bundle 'chrisbra/csv.vim'
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

syntax on
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
colorscheme elflord
set number
"match OverLength /\%81v.\+/


"Makes rvm work with vim
set shell=bash

set ttyfast

"Allows for highlighting and then control-r replacing
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Change leader mapping to ','
let mapleader = ','
" Set F2 to spell check
nnoremap <F2> :setlocal spell! spelllang=en_us<cr>

" Use space to go to command mode
noremap <space> :
" Paste keeping exact indentation
nnoremap <C-v> "+P=']
" Add Tab Hotkeys
nnoremap <leader>r :source ~/.vimrc<cr>

" Add Buffer Hotkeys
nnoremap <leader>q :bp <BAR> bd #<CR>
nnoremap <leader>d :bdelete<CR>

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
nnoremap <C-k> <C-w><Up>
nnoremap <C-j> <C-w><Down>
nnoremap <C-l> <C-w><Right>
nnoremap <C-h> <C-w><Left>

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



" Vim folding
nnoremap zo zO
nnoremap zf zMzr

" Show statusline always
set laststatus=1
nnoremap <leader>a :set laststatus=1<CR>
nnoremap <leader>s :set laststatus=2<CR>


" Map Controls to change windows
noremap <C-k> <C-w><Up>
noremap <C-j> <C-w><Down>
noremap <C-l> <C-w><Right>
noremap <C-h> <C-w><Left>

nnoremap <leader>ca :1,$ArrangeColumn<CR>
nnoremap <leader>cu :1,$UnArrangeColumn<CR>

" Map to navigate quickfix
nnoremap [q :cn<CR>
nnoremap ]q :cp<CR>

"Allows for highlighting and then control-r replacing
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>


"Command-T
let g:CommandTSCMDirectories = "pwd"
if &term =~ "xterm" || &term =~ "tmux"
	let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif

" Open Nerdtree in current file
nnoremap <leader>n :NERDTreeToggle<cr>
" NERDTree show hidden files
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

" Set command t ignore
set wildignore+=**/.git/*,**/doc/yard/*

" Command T show by most recently used
" nnoremap <silent> <leader>t :CommandTMRU<CR>


" Screen/tmux can also handle xterm mousiness, but Vim doesn't
" detect it by default.
if &term == "screen"
	set ttymouse=xterm2
endif
if v:version >= 704 && &term =~ "^screen"
	" Odds are good that this is a modern tmux, so let's pick the
	" best mouse-handling mode.
	set ttymouse=sgr
endif

augroup ftgroup
	autocmd!
	au BufNewFile,BufRead *.erb set filetype=eruby.html
	au BufNewFile,BufRead *.god set filetype=ruby
	au BufNewFile,BufRead *.js.erb set filetype=eruby.javascript
	au BufNewFile,BufRead *.md set filetype=markdown
	au BufNewFile,BufRead *.json.erb set filetype=eruby.javascript
	" Handlebars
	au  BufNewFile,BufRead *.mustache,*.hogan,*.hulk,*.hjs set filetype=html.mustache syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
	au  BufNewFile,BufRead *.handlebars,*.hbs set filetype=html.handlebars syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
	autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
augroup END
