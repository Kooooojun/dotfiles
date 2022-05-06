"#######################################################
"################### Kooooojun vimrc ###################
"#######################################################

" <F2>  				:w save the file
" <F3>  				:q
" <F4>  				:q!
" <F5>  				nerdtree
" <F6> 					YCM FixIt
" <r> 					compile/run .c .cpp .py in ./build
"						compile/run .java in current directory
" <Ctrl-x> + <Ctrl-o>	completion in css/javascript
" <Ctrl-p>  			search the file

"#######################################################
" Basic settings
"#######################################################
set nocompatible
filetype plugin indent on
syntax on
set number
set nowrap
set backspace=2         " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=100         " keep 100 lines of command line history
set noruler             " don't show the cursor position all the time
set wildchar=<TAB>      " such as <TAB> in shell
set tabstop=4
set smarttab
set shiftwidth=4
set showcmd             " show command
set noshowmode          " don't show current mode
set incsearch           " While typing a search pattern, show immediately
                        " where the so far typed pattern matches.
set hlsearch            " When there is a previous search pattern,
                        " highlight all its matches.
hi Search cterm=reverse ctermfg=none ctermbg=none
set autowrite
set confirm
set ai 					"auto indent
set ignorecase
set smartcase
set cindent
set showmatch
set secure
set noswapfile
set mouse=a 			"make nouse available
set clipboard=unnamed
filetype indent on

"#######################################################
" Autocmd
"#######################################################
autocmd BufNewFile *.c 0r ~/template.c 									"C Templates
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead *.html set ai et sw=2 ts=2 								"html setting
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS 	"javascript completion
autocmd FileType css set omnifunc=csscomplete#CompleteCSS              	"css completion
"#######################################################
" make chinese readable and writable
"#######################################################
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
"#######################################################
" Plugin
"#######################################################
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'preservim/nerdtree'
Plugin 'patstockwell/vim-monokai-tasty'
Plugin 'morhetz/gruvbox'
Plugin 'luochen1990/rainbow'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bfrg/vim-cpp-modern'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/syntastic'
call vundle#end()
"#######################################################
" Colors
"#######################################################
set t_Co=256
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_termcolors=256
colorscheme gruvbox
"colorscheme molokai
set cursorline
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=none
hi CursorLineNr cterm=bold ctermfg=LightBlue ctermbg=Blue
hi CursorLine cterm=bold ctermfg=none ctermbg=DarkGrey
highlight SpecialKey ctermfg=Yellow
hi htmlEqualSign guifg=#00ff00
hi htmlTag            guifg=#90b0d1 gui=NONE
hi htmlSpecialTagName guifg=#90b0d1 gui=NONE
hi htmlTagName        guifg=#90b0d1 gui=NONE
hi htmlEndTag         guifg=#90b0d1 gui=NONE
hi htmlLink           guifg=blue3   gui=underline

"#######################################################
" Key
"#######################################################
map <silent> <F2> :update<CR>
map <silent> <F3> :update<CR>:q<CR>
map <silent> <F4> :q!<CR>
nnoremap <silent> <F5> :exec 'NERDTreeToggle' <CR>
nnoremap <silent> <F6> :YcmCompleter FixIt<CR>
noremap <silent> r :call CompileRunGcc()<CR>

" setting about ycm
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{4}', 're!:\s+'],
    \   'html': [ '</' ],
    \ }

" setting about indentLine
let g:indentLine_enabled = 1
let g:indentLine_char = '┆'
let g:indentLine_setColors = 0

" setting about javasript
let javascript_enable_domhtmlcss = 1

" setting about emmet
autocmd FileType html,css,js EmmetInstall
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','

" setting about rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

"#######################################################
" Quickly Run
"#######################################################
func! CompileRunGcc()
	execute "w"
	if &filetype == 'c'
		if !isdirectory('build')
			execute "!mkdir build"
		endif
		execute "!gcc % -o build/%<"
		execute "!time ./build/%<"
	" compile/run .c

	elseif &filetype == 'cpp'
		if !isdirectory('build')
			execute "!mkdir build"
		endif
		execute "!g++ % -o build/%<"
		execute "!time ./build/%<"
	" compile/run .cpp

	elseif &filetype == 'java'
		execute "!javac %"
		execute "!java %<"
	" compile/run .java

	elseif &filetype == 'python'
		execute "!time python3 %"
	" compile/run .py

	endif
endfunc

"#######################################################
"#######################################################
