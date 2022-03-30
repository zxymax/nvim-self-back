set nocompatible
set clipboard^=unnamed,unnamedplus
"color
syntax on
set path+=**

source $HOME/.config/nvim/mappings.vim

let mapleader=","
let g:maplocalleader=';'

"filetype
filetype on
filetype indent on
filetype plugin on

set splitright
set ruler
set scrolloff=5
set nowrap
set noswapfile
set nolist
set noshowmatch
set showtabline=2
set laststatus=2
set hidden
set t_Co=256
set title
set tabstop=2
set shiftwidth=2
set background=dark

"search
set hlsearch
set incsearch
set smartcase
set ignorecase

autocmd FileType json syntax match Comment +\/\/.\+$+

autocmd BufWritePre * :%s/\s\+$//e

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.9/bin/python3'

let g:python_host_prog = '/usr/bin/python2'

call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'tomtom/tcomment_vim'

Plug 'mileszs/ack.vim'


Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'markdown', 'vue']}
call plug#end()

"airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"defx
nnoremap <silent> <LocalLeader>e
			\ :<C-u>Defx -toggle -buffer-name=explorer`tabpagenr()`<CR>
nnoremap <silent> <LocalLeader>a
			\ :<C-u>Defx
			\   -search=`escape(expand('%:p'), ' :')`
			\   -buffer-name=explorer`tabpagenr()`<CR>



call defx#custom#option('_', {
	\ 'resume': 1,
	\ 'winwidth': 25,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'show_ignored_files': 0,
	\ 'columns': 'indent:git:icons:filename',
	\ 'root_marker': '',
	\ 'ignored_files':
	\     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
	\   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc'
	\ })


" the silver searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

"Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>ff :Ack!<Space>

" prettier
nmap <leader><c-f> :Prettier<CR>
let g:prettier#config#tab_width = 4
let g:prettier#config#single_quote = 'true'
