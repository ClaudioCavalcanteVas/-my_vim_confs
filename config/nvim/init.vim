""""""""""""""""""""""""""""""""""""""""""
" Claudio's Neovim Plugins configuration
""""""""""""""""""""""""""""""""""""""""""

""" Main nvim configurations
"""""""""""""""""""""""""""""

syntax on
set encoding=utf-8
set splitright " vsplit commands will create a new pane on right
set splitbelow " split command will create a new pane below
set number
set ruler
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set laststatus=2

""" Plugins
""""""""""""

" Plug's initialization - Plugin manager
" git: https://github.com/junegunn/vim-plug

call plug#begin("/root/.local/share/nvim/plugged")

" Utilities
Plug 'scrooloose/nerdtree'
Plug 'shougo/neocomplete.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'} 
Plug 'junegunn/fzf.vim'

" Themes
Plug 'ajh17/Spacegray.vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" -- Plug's End --

""" Plugins Configuration
""""""""""""""""""""""""""

" Neocomplete

" Enable at vim start
let g:neocomplete#enable_at_startup = 1

""" Themes Configuration
"""""""""""""""""""""""""

set background=dark
colorscheme spacegray

""" Key Mapping
""""""""""""""""

map <C-m> :NERDTreeToggle<CR>
