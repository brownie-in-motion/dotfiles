filetype plugin indent on
set nocompatible

" syntax highlighting
syntax on

" tabs and indents
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" save history
set undofile

" wrap words
set linebreak

" scroll settings
set scrolloff=5
set sidescroll=1

" line numbers
set number
set relativenumber

" show spaces
set list

" wait less before end of typing registered
set updatetime=100

" set viminfo location
set viminfo+=n~/.config/nvim/viminfo

" folding and concealing
set foldmethod=indent
set foldlevel=0
set foldnestmax=1
highlight Folded ctermbg=NONE

" autocomplete braces etc. on next line
inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko
inoremap (<CR> (<CR>)<Esc>ko

tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <Esc> <C-\><C-n>

" latex compilation
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:tex_conceal=''
let g:indentLine_setConceal=0

" plugins 
call plug#begin('~/.config/nvim/plugged')

    " obvious stuff
    Plug 'sheerun/vim-polyglot'
    Plug 'mattn/emmet-vim'
    " Plug 'NLKNguyen/papercolor-theme'
    Plug 'joshdick/onedark.vim'
    Plug 'lervag/vimtex'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree'

    " status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'

    " commenting and surrounding
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'

    " display indentation levels
    Plug 'yggdroot/indentline'

    " fuzzy finding
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " git wrapper
    Plug 'tpope/vim-fugitive'

    " repeat plugin stuff
    Plug 'tpope/vim-repeat'

call plug#end()

" colors
set termguicolors
set t_Co=256
" colorscheme PaperColor
" set background=dark
augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
augroup END
colorscheme onedark

" statusbar/tabline config
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#whitespace#checks = ['indent', 'long', 'mixed-indent-file', 'conflicts' ]
let g:airline_theme='minimalist'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = ''

let g:indentLine_char='┆'

" stop folding
set nofoldenable

" make cursor not horrible
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " block in normal mode

" disable arrow keys
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" file finding with tab-completion
set path+=**
set wildmenu

" nerdtree config
let NERDTreeIgnore = ['\.meta$']

" coc actions
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc-prettier
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

nmap <leader>rn <Plug>(coc-rename)

" snippets
"
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

" documentation in coc
if has('nvim-0.4.3') || has('patch-8.2.0750')
    nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
endif

" hex editing
"
" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries 
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction
