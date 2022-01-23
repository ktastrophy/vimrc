"set plugin location
call plug#begin('~/.local/share/nvim/plugged')
Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'scrooloose/nerdtree' "file tree
Plug 'airblade/vim-gitgutter' "git status hints in the gutter
Plug 'vim-airline/vim-airline' "status bar, for branch, line number, etc
Plug 'yggdroot/indentline'
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'hashivim/vim-terraform'
Plug 'metakirby5/codi.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
"initialize plugin system
call plug#end()

filetype indent plugin on


"set key mappings
let mapleader = ','
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>l :NERDTreeFind<CR>
nmap <leader>f :FZF<CR>
nmap <leader>p :CtrlP<CR>



"set t_Co=256
"let base16colorspace=256
set background=dark
colorscheme base16-default-dark
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled=1
"set termguicolors
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=2                                                " actual tabs occupy 2 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" adds crosshairs to active buffer except nerdtree
autocmd! BufLeave * call DisableCursorLine()
autocmd! BufAdd * call DisableCursorLine()
autocmd! BufEnter * call EnableCursorLine()

function! EnableCursorLine()
    if (bufname("%") =~ "NERD_Tree_")
        " do nothing
    else
        setlocal cursorline
        setlocal cursorcolumn
    endif
endfunction

function! DisableCursorLine()
    setlocal nocursorline
    setlocal nocursorcolumn
endfunction

autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType cs setlocal shiftwidth=4 softtabstop=4 expandtab

"terraform settings
let g:terraform_align=1
let g:terraform_fmt_on_save=1

"python config
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

"c# config
let g:OmniSharp_server_stdio = 1
