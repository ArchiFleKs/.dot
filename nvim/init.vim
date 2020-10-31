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

" Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'romainl/Apprentice'
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'saltstack/salt-vim'
Plug 'metakirby5/codi.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Valloric/YouCompleteMe'
Plug 'towolf/vim-helm'
Plug 'pearofducks/ansible-vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'arcticicestudio/nord-vim'
Plug 'lambdalisue/suda.vim'
Plug 'artanikin/vim-synthwave84'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-hashicorp-tools'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'fourjay/vim-password-store'
Plug 'elzr/vim-json'
Plug 'google/vim-jsonnet'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'davidhalter/jedi-vim'
Plug 'shougo/neosnippet'
Plug 'shougo/neosnippet-snippets'

call plug#end()

set colorcolumn=81
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0        " Hard-wrap long lines as you type them.
set wrap linebreak nolist
"set columns=80
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
"set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

set background=dark
colorscheme nord
hi Normal guibg=NONE ctermbg=NONE

" Mutt config
au BufRead /tmp/mutt-* set tw=72

"Markdown config
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

nnoremap ; :    " Use ; for commands.
nnoremap Q @q   " Use Q to execute default register.

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" Autoupdate diff
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" Remap paste to black hole buffer
vnoremap <leader>p "_dP

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

" Markdown
let g:vim_markdown_folding_disabled = 1

" Terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1
let g:terraform_fold_sections=0

" yaml indentation
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab foldmethod=indent

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

set nobackup
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
