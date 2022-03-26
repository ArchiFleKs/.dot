" Map the leader key to SPACE
let mapleader="\<SPACE>"
set termguicolors

" Neovim remap
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

call plug#begin()


" Visual
Plug 'altercation/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'romainl/Apprentice'
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'artanikin/vim-synthwave84'
Plug 'averak/laserwave.vim'
Plug 'NLKNguyen/papercolor-theme'

" Moving
Plug 'easymotion/vim-easymotion'

" Format
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
Plug 'dylanaraps/wal.vim'
Plug 'rhysd/vim-fixjson'

" Completion / Syntax
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'Valloric/YouCompleteMe'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Glench/Vim-Jinja2-Syntax'
"Plug 'davidhalter/jedi-vim'

" System
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'

" Scratchpad
Plug 'metakirby5/codi.vim'

" Files & Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'

" Git symbol
Plug 'airblade/vim-gitgutter'

" Generate TOC
Plug 'mzlogin/vim-markdown-toc'

"Sudo
Plug 'lambdalisue/suda.vim'

" Pass
Plug 'fourjay/vim-password-store'

" Snippet
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

set colorcolumn=81
set showcmd               " Show (partial) command in status line.
set showmatch             " Show matching brackets.
set showmode              " Show current mode.
set ruler                 " Show the line and column numbers of the cursor.
set number                " Show the line numbers on the left side.
set formatoptions+=o      " Continue comment marker in new lines.
set textwidth=0           " Hard-wrap long lines as you type them.
set wrap linebreak nolist
set expandtab             " Insert spaces when TAB is pressed.
set tabstop=2             " Render TABs using this many spaces.
set shiftwidth=2          " Indentation amount for < and > commands.
set noerrorbells          " No beeps.
set modeline              " Enable modeline.
set linespace=0           " Set line-spacing to minimum.
set nojoinspaces          " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow " Horizontal split below current.
set splitright " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3     " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5 " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline     " Do not jump to first character with page commands.

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set hlsearch   " Highlight search results.
set ignorecase " Make searching case insensitive
set smartcase  " ... unless the query has capital letters.
set incsearch  " Incremental search.
set gdefault   " Use 'g' flag by default with :s/foo/bar/.
set magic      " Use 'magic' patterns (extended regular expressions).


set background=dark " Background
colorscheme PaperColor " Colorscheme
set noshowmode " Do not show mode

" Transparent background
hi Normal guibg=NONE ctermbg=NONE

" Mutt config
au BufRead /tmp/mutt-* set tw=72

" Markdown config
au BufRead,BufNewFile *.md setlocal textwidth=80

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Use ; for commands
nnoremap ; :

" Use Q to execute default register.
nnoremap Q @q

" Open file menu
nnoremap <C-o> :CtrlP<CR>

" Open buffer menu
nnoremap <C-b> :CtrlPBuffer<CR>

" Open most recently used files
nnoremap <C-f> :CtrlPMRUFiles<CR>

" Autoupdate diff
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" Remap paste to black hole buffer
vnoremap <C-p> "_dP

" airline
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:powerline_loaded = 1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#keymap#enabled = 0
"let g:airline_theme='wal'

" Markdown
let g:vim_markdown_folding_disabled = 1

" Terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1
let g:terraform_fold_sections=0

" yaml indentation
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" let g:ansible_unindent_after_newline = 1
let g:ansible_name_highlight = 'b'
let g:ansible_attribute_highlight = "ob"
let g:ansible_unindent_after_newline = 1

" Automatic syntax highlighting for files
filetype plugin indent on
augroup FileTypeRules
  autocmd!
  autocmd BufNewFile,BufRead *.md           set ft=markdown
  autocmd BufNewFile,BufRead *.tex          set ft=tex
  autocmd BufNewFile,BufRead *.txt          set ft=sh
  autocmd BufNewFile,BufRead *.bash*        set ft=sh
  autocmd BufNewFile,BufRead *.jsonnet      set ft=jsonnet
  autocmd BufNewFile,BufRead *.libjsonnet   set ft=jsonnet
augroup END

set nowb
set noswapfile

" Delete trailing whitespaces
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

" You can delete trailing whitespaces each time you save a document
" Python
" autocmd BufWrite *.py :call DeleteTrailingWS()

" CoffeeScript
" autocmd BufWrite *.coffee :call DeleteTrailingWS()

" SH
" autocmd BufWrite *.sh :call DeleteTrailingWS()

" All files
autocmd BufWrite * :call DeleteTrailingWS()

" Gopass
au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile

" Coc
" TextEdit might fail if hidden is not set.
set hidden

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

" Use <c-space> to trigger completion.
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
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
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
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

" Coc snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" 1. base64-encode(visual-selection) -> F2 -> encoded base64-string
:vnoremap <F2> c<c-r>=system("base64 -w 0", @")<cr><esc>

" 2. base64-decode(visual-selection) -> F3 -> decoded string
:vnoremap <F3> c<c-r>=system("base64 -d", @")<cr>
