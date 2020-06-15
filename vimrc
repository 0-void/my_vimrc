syntax on

set t_Co=256
set noerrorbells
set tabstop=3 softtabstop=3
set shiftwidth=3
set expandtab
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set ruler
set wildmenu
set scrolloff=5
set hidden
set colorcolumn=100

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'tpope/vim-fugitive'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" visual plugins
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'	


call plug#end()

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox 
set background=dark


if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_banner = 0
 
let g:ctrlp_use_caching = 0 
let g:netrw_winsize = 25

"experimental
" --- The Greatest plugin of all time.  I am not bias
"  let g:vim_be_good_floating = 1
"
"  " --- vim go (polyglot) settings.
"  let g:go_highlight_build_constraints = 1
"  let g:go_highlight_extra_types = 1
"  let g:go_highlight_fields = 1
"  let g:go_highlight_functions = 1
"  let g:go_highlight_methods = 1
"  let g:go_highlight_operators = 1
"  let g:go_highlight_structs = 1
"  let g:go_highlight_types = 1
"  let g:go_highlight_function_parameters = 1
"  let g:go_highlight_function_calls = 1
"  let g:go_highlight_generate_tags = 1
"  let g:go_highlight_format_strings = 1
"  let g:go_highlight_variable_declarations = 1
"  let g:go_auto_sameids = 1

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
"nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

"Install coc extensions if not in the vim
let g:coc_global_extensions = [
        \ 'coc-tsserver',
        \]
"        \'coc-eslint'
 
" Give more space for displaying messages.
set cmdheight=2

"Update delay time(save file time)
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"support for vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}