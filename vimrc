if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif
"===Vundle===
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Vim plugin Library
Plugin 'rizzatti/funcoo.vim'

" Smart input
Plugin 'kana/vim-smartinput'

" Color schemas
Plugin 'chriskempson/base16-vim'
Plugin 'rainglow/vim'

" Powerful comment functions
Plugin 'scrooloose/nerdcommenter'

" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" Fuzzy file, buffer, mru, tag, etc finder
Plugin 'ctrlpvim/ctrlp.vim'
" Function navigator
Plugin 'tacahiroy/ctrlp-funky'
" Switcher for ctrl-p
Plugin 'ivan-cukic/vim-ctrlp-switcher'

" Editor config
Plugin 'editorconfig/editorconfig-vim'

" Airline and themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'vim-scripts/PreserveNoEOL'
Plugin 'ervandew/supertab'
Plugin 'bkad/CamelCaseMotion'
Plugin 'tpope/vim-surround'
Plugin 'danro/rename.vim'
Plugin 'schickling/vim-bufonly'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

"Git
Plugin 'vim-scripts/fugitive.vim'
Plugin 'airblade/vim-gitgutter'

" Buffers surfing
Plugin 'ton/vim-bufsurf'

" Ultisnips
Plugin 'SirVer/ultisnips'
" More snippets
Plugin  'honza/vim-snippets'

"Search and replace
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'

" Configuration files syntax
Plugin 'cespare/vim-toml'

" Easymotion!!
Plugin 'easymotion/vim-easymotion'

" EasyTags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

" Json
Plugin 'elzr/vim-json'

call vundle#end()
filetype plugin indent on

"===General===
let mapleader=","
set nu
set viminfo='1000,n$HOME/.vim/viminfo
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set visualbell
set noerrorbells
set history=1000
set nofoldenable
set foldmethod=marker
set confirm
set t_Co=256
set mouse=a
set report=0
set incsearch
set ignorecase
set smartcase
set showmatch
set showcmd
set title
set laststatus=2
set matchtime=2
set matchpairs+=<:>
set hidden

set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"===FileType===
" Special filetype tabstop
autocmd FileType * setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType js,vue,html,json,md,css,h,c,cc setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
" Syntax support
au BufNewFile,BufRead *.ejs set filetype=html
au! BufRead,BufNewFile *.json set filetype=json

"===Encoding===
set encoding=utf8
set fileencoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

"===GUI===
set guifont=Input\ Mono\ Narrow:h16
set guioptions-=e
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set linespace=10
set showmode
set autoread
set autowriteall
set complete=.,w,b,u,i
set completeopt=longest,menuone

"===Interface===
syntax on
set background=dark

let base16colorspace=256
" colorscheme base16-onedark
colorscheme rainbow

let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

" set transparency=5

" Highlight current line
au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline

" Show line number and fake a custom left padding area with 4 width
set number
hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg

"===MacVim===
highlight LineNr ctermbg=NONE
if has("gui_running")
    set macligatures
    highlight LineNr guibg=NONE
endif

"===Mappings===
" Make it easy to edit the Vimrc file
nmap <Leader>ev :tabe ~/.vimrc<cr>
" New file at current path
nmap :ed :edit %:p:h/
" Cd to current file's path
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
" Type j twice to exit insert mode
imap jj <esc>
" Easy window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>
" File explorer
nmap <leader>ee :Explore<cr>
" Save file with sudo
cmap w!! %!sudo tee > /dev/null %
" Quickly go forward or backward to buffer
" ton/vim-bufsurf
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>
nnoremap <F3> :bn<CR>
nnoremap <F4> :bp<CR>

" Some tips
nnoremap <Up> :echomsg "use k !"<cr>
nnoremap <Down> :echomsg "use j !"<cr>
nnoremap <Left> :echomsg "use h !"<cr>
nnoremap <Right> :echomsg "use l !"<cr>

"===Plugins===

"====scrooloose/nerdcommenter====
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

"====terryma/vim-multiple-cursors====
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"====ctrlpvim/ctrlp.vim====
let g:ctrlp_map = '<d-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'"
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky', 'switcher']
let g:ctrlpswitcher_mode = 1
nmap <D-r> :CtrlPFunky<Cr>
nmap <Leader>hh :CtrlPSwitch<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"===editorconfig/editorconfig-vim===
let g:EditorConfig_verbose=0
let g:EditorConfig_core_mode = 'external_command'
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

"===vim-airline/vim-airline===
let g:airline_powerline_fonts=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_detect_modified=1
let g:airline_theme='onedark'

"===netrw===
" let g:netrw_liststyle=3
let g:netrw_winsize=30
let g:netrw_hide=1
let g:netrw_list_hide='.*\.DS_Store,.*\.git,.*\.src,.*\.tags,.*\.o,.*\.deps,.*\.dirstamp'


"===Ultisnips===
let g:UltiSnipsExpandTrigger="<D-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

"===SupreTab===
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

"===SearchAndReplace===
" Greplace
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"===EasyTags===
let g:easytags_dynamic_files = 1
let g:easytags_async = 1
let g:easytags_syntax_keyword = 'always'
let g:easytags_always_enabled = 1
let g:easytags_suppress_ctags_warning = 1

"===color_coded===
let g:color_coded_enabled = 1
let g:color_coded_filetypes = ['c', 'cpp', 'h']

" Move a line of text using Comamnd+[jk]
nmap <D-j> mz:m+<cr>`z
nmap <D-k> mz:m-2<cr>`z
vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z
