" Niente più .vimrc obesi o altrui, da oggi sarà commentato e spiegato fino all'ultima riga... da me!

" Non dovrebbe servire più a nulla nelle ultime versioni, ma lo lascio per compatibilità.
set nocompatible
set encoding=utf-8

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"Schemi colori
Plugin 'flazz/vim-colorschemes'

"Git Integration#1 
Plugin 'tpope/vim-fugitive'

"Git Integration#2 
Plugin 'airblade/vim-gitgutter'

"Barra fichissima, da commentare quando usata via ssh.
Plugin 'bling/vim-airline'

"Undo tree plugin
Plugin 'sjl/gundo.vim'

"Ctrl-p, cerca tutto ovunque
Plugin 'ctrlpvim/ctrlp.vim'

"Nerdtree, file browsing su vim
Plugin 'scrooloose/nerdtree'


call vundle#end()

" Syntax highlighting
syntax on

" Numeri riga 
 set number
" Numeri riga relativi
" set relativenumber
" Segnariga
set ruler
"set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P

" Permette di girare fra i buffers senza salvarli
set hidden

" Autocompletamento grafico comandi
set showcmd 

" autocompletamento status bar
set wildmenu 

" questa è davvero ovvia!
set autoindent

" configurazione CTRL-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>t :CtrlPMRU<CR>
nnoremap <leader>bp :CtrlPBuffer<CR>

" Barra di stato anche se senza tabs
set laststatus=2 

" Larghezza testo
"set tw=80
" Che l'andata a capo sia solo visuale
set wrap
" Come rompe la linea
"set showbreak=>\

" Autoindentazione files
filetype indent on

"Schema colori
colorscheme molokai
"o, in alternativa
"colorscheme candyman

" Risultati ricerca
set showmatch
set hlsearch

" Ricerca incrementale
set incsearch
set hls
"Modo nella barra di stato
set showmode

"Redraw rapido terminale
set ttyfast

" Ricerca insensibile
set ignorecase smartcase

" Comportamento TABs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"lunga history comandi
set history=300

" backup/persistance settings
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

" In che linea siamo?
set cursorline

" Mostra spazi bianchi
set list
" Cosa mostrare al posto di spazi bianchi e tabs
" set listchars=tab:▸\ ,trail:¬,nbsp:.,extends:❯,precedes:❮
set listchars=tab:▸\ ,trail:·,nbsp:.,extends:❯,precedes:❮
" augroup FileTypes
  " autocmd!
  " autocmd filetype html,xml set listchars-=tab:▸\ 
" augroup END

" persist (g)undo tree between sessions
set undofile
set history=100
set undolevels=100

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

"Statusline più informativa
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" ------------------------------------------------------------------------------
" ------------------------------ airline ---------------------------------------
" ------------------------------------------------------------------------------
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif

let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
" let g:airline_section_warning = airline#section#create([ "syntastic" ])
let g:airline#extensions#branch#empty_message  =  "No SCM"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

" ------------------------------------------------------------------------------
" ---------------------------- END airline -------------------------------------
" ------------------------------------------------------------------------------

" Remap up-down per linee che vanno a capo
map j gj
map k gk
"imap j <ESC>gj
"imap k <ESC>gk

" Vecchio remap
" map <DOWN> gj
" map <UP> gk
" imap <UP> <ESC>gki
" imap <DOWN> <ESC>gji

" Remap tasti freccia a switching delle tabs 
noremap <Up> :bfirst <CR>
noremap <Down> :blast <CR>
noremap <Left> :bprev <CR>
noremap <Right> :bnext <CR>

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession 
nnoremap <leader>ss :SaveSession 
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" ------------------------------------------------------------------------------
" ---------------------------------- SYNTAX ------------------------------------
" ------------------------------------------------------------------------------
" nmodl (see in $VIM/syntax/nmodl.vim) NEURON 
au BufRead,BufNewFile *.mod set filetype=NMODL

" .hoc, .ses NEURON
au BufReadPost *.hoc,*.ses set syntax=java

