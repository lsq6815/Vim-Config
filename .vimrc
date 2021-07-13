" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Use vim-plug to manage plugins  
" to add plugins in github use <username>/<repo> 
" Example: scrooloose/nerdtree
" you can find plugins in vim.org github.com and vimawesome.com
" I recommend vimawesome.com, because it collect plugins from the first two
" website

" Automatically executes `filetype plugin indent on` and `syntax enable`
call plug#begin('~/.vim/plugged')
" vim-plug itself, just for its help documentation
Plug 'junegunn/vim-plug' 
    let g:plug_timeout = 300 " Time limit of each task in seconds (Ruby & Python)

""""""""""""""""""""
" Language Support "
""""""""""""""""""""
" Smooth language-server-provider experience like VScode
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    let g:coc_global_extensions = [
                "\ for general-purpose language
                \ 'coc-omnisharp',
                "\ for front-end dev
                \ 'coc-css', 'coc-html', 'coc-json', 'coc-tsserver', 
                \ 'coc-html-css-support', 'coc-htmlhint',
                "\ for scripting languages
                \ 'coc-phpls', 'coc-pyright', 'coc-sh', 'coc-vimlsp', 'coc-lua',
                "\ lsp for .clang-format file
                \ 'coc-clang-format-style-options',
                \ 'coc-markdownlint',
                \ 'coc-xml',
                \ 'coc-cmake',
                \ 'coc-texlab',
                \ 'coc-emoji', 'coc-word',
                \ 'coc-marketplace'
                \]
    let g:tex_flavor = 'latex' " prevent Vim for treat empty .tex file as plaintext
    " required by coc-vimlsp
    let g:markdown_fenced_languages = [
                \ 'vim', 'help' ]

" Syntax highlighting for CJSON (JSON with Comments) in Vim
" useful when you edit configure in JSON format
Plug 'neoclide/jsonc.vim'

" Add the missing semantic highlighting of cxx lsp (cquery, ccls, and clangd)
" Is is SEMANTIC highlight!
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Plug 'dense-analysis/ale'
"     let g:ale_disable_lsp = 1
"     " Use modern C/C++
"     let g:ale_c_cc_options = '-Wall -O2 -std=c99'
"     let g:ale_cpp_cc_options = '-Wall -O2 -std=c++1z'
"     let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
"     let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++1z'
"     let g:ale_c_clang_options = '-Wall -O2 -std=c99'
"     let g:ale_cpp_clang_options = '-Wall -O2 -std=c++1z'
    
" DoGe is a Documentation Generator
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
    " Want to DoGe for language from other langauge, like Vue. Aliases it
    let g:doge_filetype_aliases = {
                \ 'javascript': [ 'vue' ]
                \}

" Plug 'StanAngeloff/php.vim', {'for': 'php'}              " PHP language support

" Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    let g:vim_markdown_math = 1 " Enable LaTeX math
    let g:vim_markdown_strikethrough = 1 " Enable ~~cancellation~~

" Markdown preview based on Web
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    let g:mkdp_auto_start = 0 " start after entering markdown buffer
    let g:mkdp_auto_close = 1 " close when change from markdown buffer to other buffer

" A Emmet implementation for Vim 
Plug 'mattn/emmet-vim'
    " enable emmet-vim in which filetype 
    autocmd FileType html,css,php,md,javascript EmmetInstall
    let g:user_emmet_install_global = 1
    let g:user_emmet_mode           = 'nvi' " work for all mode +insert, +normal and +visual

" Plug 'vim-latex/vim-latex', {'for': 'tex'}                   " old yet powerful
"     " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to 
"     " 'plaintext' instead of 'tex', which results in vim-latex not being loaded.
"     " The following changes the default filetype back to 'tex':

" A collection of language support packs for Vim. But it mostly supplies more syntax
" highlight, so it may more suited in Apperance area
Plug 'sheerun/vim-polyglot'                
    let g:polyglot_disabled = [ 'markdown' ] " Already has vim-markdown

" Plug 'rust-lang/rust.vim', {'for': 'rust'}                    " rust official language support

" Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries', 'for': 'go'} " golang language support

" 自动格式化、标准化中文排版。参考
" [中文文案排版指北](https://github.com/sparanoid/chinese-copywriting-guidelines)
Plug 'hotoo/pangu.vim' 

""""""""""""""
" Appearance "
""""""""""""""
" Beware of that colorschemes are based on syntax, if your used the built-in
" syntax, then some highlight setting may no work at all!, add some langauges
" syntax plug-in to improve the perfermence, like the vim-polyglot plug-in

" Navigating Color schemes via h/j/k/l
Plug 'vim-scripts/ScrollColors'

" Solarized Colorscheme
Plug 'altercation/vim-colors-solarized'
    let g:solarized_termcolors=256

" One-dark color schemes
Plug 'joshdick/onedark.vim'
    let g:onedark_hide_endofbuffer = 1 " set to 1 if you want to hide end-of buffer filler lines (~) for a cleaner look
    let onedark_terminal_italics   = 1

" Yet Another Color Schemes
Plug 'morhetz/gruvbox'
    let g:gruvbox_italic    = 1 " enforce displaying italics
    let g:gruvbox_bold      = 1
    let g:gruvbox_underline = 1
    let g:gruvbox_undercurl = 1
    let g:gruvbox_inverse   = 0 " increase contrast/brightenss of visual selection

Plug 'tomasr/molokai'

Plug 'dracula/vim', { 'as':'dracula' }
    let g:dracula_italic    = 1 " enforce displaying italics
    let g:dracula_bold      = 1
    let g:dracula_underline = 1
    let g:dracula_undercurl = 1
    let g:dracula_inverse   = 1 " increase contrast/brightenss of visual selection

Plug 'jnurmine/Zenburn'
    let g:zenburn_high_Contrast           = 1 " 1: the CursorBar will be bold
    let g:zenburn_disable_bold_CursorBars = 1 " 1: if you hate the bold cursorline
    let g:zenburn_transparent             = 0 " 1: set the background to black
    let g:zenburn_italic_Comment          = 1 " 1: make comment italic
    let g:zenburn_alternate_Visual        = 1 " 1: increase the contrast/brightenss of the Visual selection
    let g:zenburn_disable_Label_underline = 0 " To disableunderlining for Labels, set to 1

" Beautify status bar
Plug 'vim-airline/vim-airline'
" Themes for airline
Plug 'vim-airline/vim-airline-themes'       

" Support rainbow parentheses
Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1 " set to 0 if you want to enable it later via :RainbowToggle
    " Disable rainbow for css and html, because it disable the highlight for html tag attribute
    let g:rainbow_conf = {
            \   'separately': {
                \   '*': {},
                \   'css': 0,
                \   'html': 0,
            \}
        \}

" Css color preview
Plug 'ap/vim-css-color'                     

" Indentation
Plug 'Yggdroot/indentLine'                  

""""""""
" Edit "
""""""""
" Vim script for text filter and alignment based on regex
Plug 'godlygeek/tabular' 

" Repeat support plug like surround
Plug 'tpope/vim-repeat'     

" Simply quoting and parenthesizing
Plug 'tpope/vim-surround'   

" Commentray easily just `gcc`
Plug 'tpope/vim-commentary' 

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs' 
    " This sets |AutoPairs| to only match for parenthesis listed in {} for 'FILETYPE'. Which in here is none
    " Switch from vim-latex to vimlab, which do not handle auto-pairs itself, so this configure is no use now.
    " autocmd Filetype tex let b:AutoPairs = {}


""""""""""""
" Movement "
""""""""""""
" Motion with speed!
Plug 'easymotion/vim-easymotion' 

" Mapping [] with many useful keys and commands
Plug 'tpope/vim-unimpaired'      

" Extended % matching for HTML, LaTeX, and many other languages
Plug 'vim-scripts/matchit.zip'   

"""""""""""""""
" Integration "
"""""""""""""""
" Enable run command background
Plug 'skywind3000/asyncrun.vim' 

" Visual undo tree manipulation
" Plug 'sjl/gundo.vim'            

" File tree like modern IDE
Plug 'scrooloose/nerdtree'      

" Tag list
Plug 'majutsushi/tagbar'        

" Vim sugar for the UNIX shell commands that need it the most, 
" no need `r! sudo tee % > /dev/null` just SudoWrite
Plug 'https://github.com/tpope/vim-eunuch.git'    

call plug#end()

""""""""""""""""""""""""""""""""""""""
" Settings below is required by coc, " 
" i omitted some configure            "
" Example: i don't want to use <tab> "
" for completion                     "
""""""""""""""""""""""""""""""""""""""

set encoding=utf-8 " Anyone with sane use Unicode, and coc.nvim use it too
set hidden         " TextEdit might fail if hidden is not set
set nobackup       " Some servers have issues with backup files, see #649
set nowritebackup
set cmdheight=2    " Give more space for displaying message
set updatetime=300 " Avoid delays and improve user experience
set shortmess+=c   " Don't send message to ins-completion-menu

" Always show the signcolumn
if has("patch-8.1.1564")
    " Recently vim can merge sign column with number column
    set signcolumn=number
else
    set signcolumn=yes
endif

" Use <c-space> to trigger completion
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" For all diagnostics use `:CocDiagnostic`
nmap <silent> [g <Plug>(coc-diagnostic-perv)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `K` to show doc in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    " Use Vim built-in help document if available
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor (stop cursor
" at symbol)
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming with `<leader>rn`
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code with `<leader>f`
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
augroup cocgroup
    autocmd!
    " setup formatexpr specified filetype(s)
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line
nmap <leader>qf <Plug>(coc-fix-current)

" Map function and class text objects
" f: function
" c: class
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ?  coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ?  coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ?  "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ?  "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ?  coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ?  coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoClist
" Show all diagnostics
nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<CR>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<CR>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<CR>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<CR>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<CR>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Call coc-marketplace
nnoremap <silent><nowait> <space>m :<C-u>CocList marketplace<CR>

"""""""""""""""
" My settings "
"""""""""""""""

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

set background=dark " As the name say
colorscheme dracula " change the color scheme
" Wanna a transparent background
" need go below the `colorscheme *`
" NOTE: should go below `set background=*` too
hi Normal guibg=NONE ctermbg=NONE   
set nocursorline    " set the current line highlighting
set incsearch       " Enable searching as you type, rather than waiting till you press enter.
set number          " set the line number
set showcmd         " show key pressed in status bar on normal mode

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=
