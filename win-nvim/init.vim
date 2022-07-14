""""""""""""""""""""""""
" Plug-ins Managements "
""""""""""""""""""""""""
" `plug.vim` are installed at `stdpath('data')/site/autoload/plug.vim`
" Plug-ins are installed in `stdpath('data')/plugged`
" Make sure you use single quotes
call plug#begin()

" Smooth language-server-provider experience like VSCode
" Extensions are installed at 'stdpath('data')/coc/'
" yes, share the same extensions with Vim
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
  " |coc-vimlsp| document highlight
  let g:markdown_fenced_languages = [ 'vim', 'help' ]
  " |coc-css| for scss files
  autocmd FileType scss setl iskeyword+=@-@
  " |coc-prettier| relative settings
  command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" Say goodbye for regex-based colorscheme
" welcome to the world of AST
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" vim-plug itself, just for its help documentation
Plug 'junegunn/vim-plug'

" A dependence that many plug-ins depends
Plug 'nvim-lua/plenary.nvim'

" All in one fuzzy finder
Plug 'nvim-telescope/telescope.nvim'

" Enable Neovim's builtin spellchecker for buffers with tree-sitter 
" highlighting.
Plug 'lewis6991/spellsitter.nvim'

" Directory Tree
Plug 'kyazdani42/nvim-tree.lua'

" # Edit

" Vim script for text filter and alignment based on regex
Plug 'godlygeek/tabular'

" Repeat support plug like vim-surround
Plug 'tpope/vim-repeat'

" Simply quoting and parenthesizing
Plug 'tpope/vim-surround'

" Commentray that known treesitter
Plug 'numToStr/Comment.nvim'

" A better EsayMotion
Plug 'phaazon/hop.nvim'

" Extend `%`
" match-up will automatically disable matchit and matchparen
" enable it by: `let g:loaded_matchit = 1`
Plug 'andymass/vim-matchup'

" Autopair
Plug 'windwp/nvim-autopairs'

" Emmet
Plug 'mattn/emmet-vim'

" # UI

" Rainbow
Plug 'p00f/nvim-ts-rainbow'

" Startup
Plug 'goolord/alpha-nvim'

" color highlighter like #234
Plug 'norcalli/nvim-colorizer.lua'

" Statusline
Plug 'nvim-lualine/lualine.nvim'

" Indent line
" Unlike 'Yddgroot/indentLine', it uses Neovims virtual text feature and 
" **no conceal**
Plug 'lukas-reineke/indent-blankline.nvim'

" A fork of vim-devicons
Plug 'kyazdani42/nvim-web-devicons'

" Tabs, as understood by any other editor
Plug 'romgrk/barbar.nvim'

" ## Color scheme
Plug 'navarasu/onedark.nvim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasiser/vim-code-dark'
Plug 'Mofiqul/vscode.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'bluz71/vim-moonfly-colors'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'kyazdani42/blue-moon'

call plug#end()

set termguicolors

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable                            = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable         = true,
    extended_mode  = true,
    max_file_lines = nil,
  },
  matchup = {
    enable = true,
  }
}
require'colorizer'.setup()
require'lualine'.setup()

vim.opt.list = true
vim.opt.listchars:append("trail:⋅")
vim.opt.listchars:append("eol:↴")

require'indent_blankline'.setup {
  space_char_blankline       = " ",
  show_current_context       = true,
  show_current_context_start = true,
}

require'Comment'.setup()
require'hop'.setup {
  keys = 'etovxqpdygfblzhckisuran'
}
-- add hint for f/F
vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
-- add hint for t/T
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
-- jump to end
vim.api.nvim_set_keymap('n', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
vim.api.nvim_set_keymap('v', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
vim.api.nvim_set_keymap('o', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>", {})
-- jump to start
vim.api.nvim_set_keymap('n', '<leader>w', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.START })<cr>", {})
vim.api.nvim_set_keymap('v', '<leader>w', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.START })<cr>", {})
vim.api.nvim_set_keymap('o', '<leader>w', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.START, inclusive_jump = true })<cr>", {})

require'nvim-tree'.setup()

require'alpha'.setup(require'alpha.themes.startify'.config)

vim.g.vscode_style               = "dark"
vim.g.vscode_transparent         = 1
vim.g.vscode_italic_comment      = 1
vim.g.vscode_disable_nvimtree_bg = true

vim.g.nightflyCursorColor = 1

require'nvim-autopairs'.setup()
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" # Tab control
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>

" <C-n> to toggle nvim-tree
nnoremap <C-n> :NvimTreeToggle<CR>

"""""""""""""""""""""
" My Configurations "
"""""""""""""""""""""

" # Neovim Default
" For details `:help nvim-defaults`
"
" ## Default Plug-ins
" Neovim has two pre-installed plug-ins: |man.vim| and |matchit|
" 
" ## Default Mappings
" nnoremap Y y$ -- keep same logic of `D` and `C`
" nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR> -- nohls
" inoremap <C-U> <C-G>u<C-U> -- `d0` in insert mode
" inoremap <C-W> <C-G>u<C-W> -- `db` in insert mode
" xnoremap * y/\V<C-R>"<CR>  -- `*` can work in visual mode too
" xnoremap # y?\V<C-R>"<CR>  -- `#` can work in visual mode too
" Explain: 
"   `y`      -- yank the selected text into `"` register
"   `/`      -- enter search mode
"   `\V`     -- enter very no magic mode
"   `<C-R>"` -- insert text from `"` register
"   `<CR>`   -- start search

" # Tab relative
" |smarttab| is set by default in Neovim
set tabstop=2     " Number of spaces that a <Tab> in the file counts for
set shiftwidth=2  " Number of spaces to use for each step of (auto)indent
set expandtab     " In Insert mode: Use the appropriate number of spaces to insert a <TAB>.
set softtabstop=2 " Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.

set scrolloff=1    " Always show at least one line above / below the cursor
set number         " yes?
set relativenumber " work great with huge lines of code

" set foldmethod=indent
" set nofoldenable " open fold at begin

" required by Neovide
set guifont=CaskaydiaCove\ NF

colorscheme material

""""""""""""""""""""""""""""""""""""
" coc.nvim relative configurations "
""""""""""""""""""""""""""""""""""""
" NOTE: Omitting some configuration that is set by default in Neovim
" NOTE: Not use <TAB> and <s-TAB> for trigger and navigate.

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" Recently vim can merge signcolumn and number column into one
set signcolumn=number

" Use <c-space> to trigger completion
inoremap <silent><expr>  <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `K` to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup COCgroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" TODO: work badly with lualine.nvim
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Call coc-marketplace.
nnoremap <silent><nowait> <space>m  :<C-u>CocList marketplace<CR>
