set nocompatible
" Set vars
set clipboard=unnamed
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set incsearch		" Incremental search
"set t_Co=256
set tabstop=2
set shiftwidth=2
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
set vb t_vb=
set backspace=2
set mouse=a
set guifont=Source\ Code\ Pro:h18
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'voldikss/vim-floaterm'
Plug 'rust-lang/rust.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tmhedberg/matchit'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'ludovicchabant/vim-gutentags'
"Plug 'vim-airline/vim-airline-themes'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'TimUntersberger/neogit'
call plug#end()


set number
set hidden
set termguicolors
"set shell=bash
let mapleader = ','

nnoremap <F2> :setlocal spell! spelllang=en_us<cr>
noremap <space> :

nnoremap <leader>n :NvimTreeToggle<CR>

" Paste keeping exact indentation
nnoremap <C-v> "+P=']

nnoremap <leader>r :source ~/.vimrc<cr>

"coc settings
"let g:node_client_debug = 1
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" Map Controls to change windows
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Fix windows ctrl v set to paste
vnoremap <C-b> <C-v>


if !has('nvim')
	set termwinkey=<C-w>
endif
autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' |  clip.exe')


" Map controls to swap window locations
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>


"Stop escape lag
set timeoutlen=1000 ttimeoutlen=0

"set lazyredraw

" easy escape
imap jk <esc>
imap Jk <esc>
imap JK <esc>


" Vim folding
nnoremap zo zO
nnoremap zf zMzr

" Map Controls to change windows
"noremap <C-k> <C-w><Up>
"noremap <C-j> <C-w><Down>
"noremap <C-l> <C-w><Right>
"noremap <C-h> <C-w><Left>

" Map to navigate quickfix
nnoremap [q :cn<CR>
nnoremap ]q :cp<CR>

"Allows for highlighting and then control-r replacing
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"Jump to last line
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

set encoding=utf-8

set wildignore+=*.parquet,*/.git

"nnoremap <silent> <Leader>t :Files<CR>
"nnoremap <silent> <Leader>s :Rg<CR>
"nnoremap <silent> <Leader>b :Buffers<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>t <cmd>Telescope find_files<cr>
nnoremap <leader>s <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>c <cmd>Telescope coc workspace_symbols<cr>
nnoremap <leader>p <cmd>Telescope help_tags<cr>

nnoremap <F1> <cmd>FloatermToggle<cr>
tnoremap <F1> <cmd>FloatermToggle<cr>

"augroup coc-highlighting
	"autocmd!
	"autocmd ColorScheme * hi CocInfoFloat guifg='DarkBlue' guibg='White'
	"autocmd ColorScheme * hi CocErrorFloat guifg='Red' guibg='White'
	"autocmd ColorScheme * hi CocWarningFloat guifg='DarkCyan' guibg='White'
	"autocmd ColorScheme * hi CocHintFloat guifg='DarkBlue' guibg='White'
	"autocmd ColorScheme * hi CocHighlightText guifg='DarkBlue' guibg='White' guisp='Green'
	"autocmd ColorScheme * hi CocErrorHighlight guifg='DarkBlue' guibg='White'
	"autocmd ColorScheme * hi CocErrorSign guifg='DarkBlue' guibg='White'
	"autocmd ColorScheme * hi Pmenu guifg='DarkBlue' guibg='White' guisp='Red'
"augroup END
colorscheme gruvbox


set nohlsearch
