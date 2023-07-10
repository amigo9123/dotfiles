" set nocompatible
"
" " set nowrap
" set number
" set linebreak
" set textwidth=100
" set showmatch
" set visualbell
" set hlsearch
" set smartcase
" set ignorecase
" set incsearch
" set autoindent
" set expandtab
" set shiftwidth=2
" set smartindent
" set smarttab
" set softtabstop=2
" set ruler
" set undolevels=1000
" set backspace=indent,eol,start
"
" call plug#begin()
" Plug 'morhetz/gruvbox'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'mattn/emmet-vim'
" Plug 'dense-analysis/ale'
" " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" " Plug 'neoclide/coc.nvim', {'branch': 'release'}
" call plug#end()
"
" let g:gruvbox_contrast_dark='hard'
"
" colorscheme gruvbox
"
" " Go back
" :noremap <M-O> <C-o>
" " Search text
" :noremap <M-F> :Rg <Enter>
" " Search files
" :noremap <M-P> :Files <Enter>
" " Emmet trigger key
" let g:user_emmet_leader_key='<M-,>'
" " Remap delete word
" :inoremap <M-BS> <C-w>
"
" let mapleader = "<M-M>" " map leader to Space
"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " ALE Config
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :nmap gd :ALEGoToDefinition <Enter>
"
" let g:ale_completion_enabled = 1
" let g:ale_fix_on_save = 1
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'javascript': ['prettier', 'eslint'],
" \   'javascriptreact': ['prettier', 'eslint'],
" \   'typescript': ['prettier', 'eslint'],
" \   'typescriptreact': ['prettier', 'eslint'],
" \}
