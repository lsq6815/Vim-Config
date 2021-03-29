" install vim-plug if yet not installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" use vim-plug to manage plugins  
" to add plugins in github use <username>/<repo> e.g. scrooloose/nerdtree
" you can find plugins in vim.org github.com and vimawesome.com
" I recommend vimawesome.com, because it scrape plugins from the first two
" website
call plug#begin()
""""""""""""""""""
" Global Setting "
""""""""""""""""""
Plug 'junegunn/vim-plug' " vim-plug itself, just for its help document
    let g:plug_timeout = 300 " Add timeout for plugin

""""""""""""""""""""
" Language Support "
""""""""""""""""""""
" Support native senmatic c/c++ auto-completion, and auto-completion for JavaScript and TypeScript
Plug 'Valloric/YouCompleteMe', { 'do': 'sudo ./install.py --clangd-completer --ts-completer --java-completer --rust-completer --go-completer --cs-completer'} " Super auto-completion 
    " semantic auto-completion is not set by default
    let g:ycm_semantic_triggers= {
        \ 'c,cpp,sh,bash,makefile,rust,python,java,go,prel': ['re!\w{2}'],
        \ 'cs,lua,html,css,javascript,typescript,php': ['re!\w{2}'], 
        \ }
    " I want to use C++17 standard, do not warning me!
    " let g:ycm_filter_diagnostics = {
    "     \ 'cpp': {
    "         \ 'regex': ['17', ],
    "         \    }
    "     \}
    set completeopt=menu,menuone                 
    " No annoying preview window
    let g:ycm_add_preview_to_completeopt=0
    let g:ycm_clangd_binary_path = '/usr/bin/clangd'
    " gh is by default used for select mode(as weaker visual mode), change it to GoTo 
    nnoremap gh :YcmCompleter GoTo<cr>
    " Disable built-in Lint, using ale instead
    let g:ycm_enable_diagnostic_signs = 0
    let g:ycm_enable_diagnostic_highlighting = 0

Plug 'dense-analysis/ale'                                " have had enough with ycm's linting
    let g:ale_c_cc_options = '-Wall -O2 -std=c99'
    let g:ale_cpp_cc_options = '-Wall -O2 -std=c++1z'
    let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
    let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++1z'
    let g:ale_c_clang_options = '-Wall -O2 -std=c99'
    let g:ale_cpp_clang_options = '-Wall -O2 -std=c++1z'

Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } } " DoGe is a Documentation Generator

Plug 'StanAngeloff/php.vim', {'for': 'php'}              " PHP language support

Plug 'plasticboy/vim-markdown', {'for': 'markdown'}      " Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
    let g:vim_markdown_math = 1                          " Enable LaTeX math

Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && ./install.sh', 'for': 'markdown'} " Markdown preview based on Web

Plug 'mattn/emmet-vim'                                       " A Emmet implementation for Vim
    let g:user_emmet_install_global = 1
    augroup emmetVim
        autocmd FileType html,css,php,md,javascript EmmetInstall
    augroup END
    let g:user_emmet_mode='nvi'                              " work for all mode +insert, +normal and +visual

Plug 'vim-latex/vim-latex', {'for': 'tex'}                   " old yet powerful
    " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to 
    " 'plaintext' instead of 'tex', which results in vim-latex not being loaded.
    " The following changes the default filetype back to 'tex':
    let g:tex_flavor='latex'

Plug 'sheerun/vim-polyglot'                " A collection of language packs for Vim. But it mostly supplies more syntax highlight, so it more suited in Apperance area;)
    let g:polyglot_disabled = ['markdown'] " Already has vim-markdown

Plug 'rust-lang/rust.vim', {'for': 'rust'}                    " rust official language support

Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries', 'for': 'go'} " golang language support

""""""""""""""
" Appearance "
""""""""""""""

" Beware of that colorschemes are based on syntax, if your used the built-in
" syntax, then some highlight setting may no work at all!, add some langauges
" syntax plug-in to improve the perfermence, like the vim-polyglot plug-in

Plug 'vim-scripts/ScrollColors'             " Navigating Color schemes via h/j/k/l

Plug 'altercation/vim-colors-solarized'     " Solarized Colorscheme
    let g:solarized_termcolors=256

Plug 'joshdick/onedark.vim'                 " One-dark color schemes
    let g:onedark_hide_endofbuffer=1        " set to 1 if you want to hide end-of buffer filler lines (~) for a cleaner look
    let onedark_terminal_italics=1

Plug 'morhetz/gruvbox'                      " Yet Another Color Schemes
    let g:gruvbox_italic=1                  " enforce displaying italics
    let g:gruvbox_bold=1
    let g:gruvbox_underline=1
    let g:gruvbox_undercurl=1
    let g:gruvbox_inverse=0                 " increase contrast/brightenss of visual selection

Plug 'tomasr/molokai'

Plug 'dracula/vim', {'as':'dracula'}
    let g:dracula_italic=1                  " enforce displaying italics
    let g:dracula_bold=1
    let g:dracula_underline=1
    let g:dracula_undercurl=1
    let g:dracula_inverse=1                 " increase contrast/brightenss of visual selection

Plug 'jnurmine/Zenburn'
    let g:zenburn_high_Contrast=1           " 1: the CursorBar will be bold
    let g:zenburn_disable_bold_CursorBars=1 " 1: if you hate the bold cursorline
    let g:zenburn_transparent=0             " 1: set the background to black
    let g:zenburn_italic_Comment=1          " 1: make comment italic
    let g:zenburn_alternate_Visual=1        " 1: increase the contrast/brightenss of the Visual selection
    let g:zenburn_disable_Label_underline=0 " To disableunderlining for Labels, set to 1

Plug 'vim-airline/vim-airline'              " Beautify status bar

Plug 'vim-airline/vim-airline-themes'       " Themes for airline

Plug 'luochen1990/rainbow'                  " Support rainbow parentheses
    let g:rainbow_active = 1                " set to 0 if you want to enable it later via :RainbowToggle
    " Disable rainbow for css and html, because it disable the highlight for html tag attribute
    let g:rainbow_conf = {
            \   'separately': {
                \   '*': {},
                \   'css': 0,
                \   'html': 0,
            \}
        \}

Plug 'ap/vim-css-color'                     " Css color preview

""""""""
" Edit "
""""""""
Plug 'godlygeek/tabular'    " Vim script for text filter and alignment based on regex

Plug 'tpope/vim-repeat'     " Repeat support plug like surround

Plug 'tpope/vim-surround'   " simply quoting and parenthesizing

Plug 'tpope/vim-commentary' " commentray easily

Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
    " This sets |AutoPairs| to only match for parenthesis listed in {} for 'FILETYPE'.
    " which in here is none
    augroup autoPairs
        au Filetype tex let b:AutoPairs = {}
    augroup END


""""""""""""
" Movement "
""""""""""""
Plug 'easymotion/vim-easymotion' " motion with speed!

Plug 'tpope/vim-unimpaired'      " mapping [] with many useful keys and commands

Plug 'vim-scripts/matchit.zip'   " extended % matching for HTML, LaTeX, and many other languages

"""""""""""""""
" Integration "
"""""""""""""""
" Plug 'tpope/vim-fugitive'              " A powerful bind of Git for Vim

Plug 'skywind3000/asyncrun.vim' " enable run command background

Plug 'sjl/gundo.vim'            " Visual undo tree manipulation

Plug 'scrooloose/nerdtree'      " File tree like modern IDE

" Plug 'mileszs/ack.vim'          " built-in ack for Vim

Plug 'majutsushi/tagbar'        " tag list

" Vim sugar for the UNIX shell commands that need it the most, 
" no need `r! sudo tee % > /dev/null` just SudoWrite
Plug 'https://github.com/tpope/vim-eunuch.git'    

call plug#end()
" Regenerate tags file every time matched file is saved
" some error occur, comment it temporarily
" autocmd BufWritePost *.py *.c *.cpp *.h *.hpp *.js *.ts silent! !ctags -R &

syntax enable             " support syntax highlight, set on, then vim will overwrite your setting, using enable to enable most features of colorschemes
filetype plugin indent on " auto indent according to different file type

set tags=tags;                 " search tags file recursively in parent fold
set wildmenu
set wildmode=list:longest,full " first auto-completion the longest filename, then active wildmenu
packloadall                    " load all plugins
silent! helptags ALL           " load help document for all plugins

set foldmethod=indent         " fold lines by them indent
set nofoldenable              " but have folds open by default
set autoindent                " Copy indent from current line when starting a new line.
set shiftwidth=4              " the space number used to indentation
set expandtab                 " In Insert mode: Use the appropriate number of spaces to insert a <Tab>.  Spaces are used in indents with the '>' and '<' commands and when 'autoindent' is on.
set tabstop=4                 " Number of spaces that a <Tab> in the file counts for (default 8)
" set spell                     " Automatically set spell check

" set backspace=2 " change the behavior of Backspace in most of terminal
" just make the backspace work when in insert mode, better use <c-h> instead 
if has('termguicolors')
    set termguicolors                   " true color terminal, beyond term256color
endif

if has('autocmd')
    " define your skeleton/template file here
    augroup templates
        autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
        autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c
        autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
        autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
        autocmd BufNewFile makefile,Makefile,GMakefile 0r ~/.vim/templates/makefile
    augroup END
endif

colorscheme gruvbox                 " change the color scheme
set background=dark                 " As the name say
set guifont=Fira\ Code\ Regular\ 15 " The default font is too ugly, and size is too small
set showcmd                         " show key pressed in status bar on normal mode
set incsearch                       " Enable searching as you type, rather than waiting till you press enter.
set number                          " set the line number
set cursorline                      " set the current line highlighting

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" if you want disable <up>/<dowm>/<left>/<right>
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" A very useful mapping
" deprecated due to plug auto-pairs
" replaced by auto-pairs
" insert a pair of bracket in insert mode
" inoremap ' ''<esc>i
" inoremap " ""<esc>i
" inoremap ( ()<esc>i
" inoremap [ []<esc>i
