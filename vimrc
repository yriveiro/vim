call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'valloric/youcompleteme'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'roosta/srcery'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'scrooloose/nerdcommenter'

" Loaded when specific file type is opened
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
Plug 'rust-lang/rust.vim', {'for': 'rust'}

" Add plugins to &runtimepath
call plug#end()


" ----------------------
" Vim configurations
" ----------------------

set tabstop=4
set nocompatible
set mouse=a
set smartindent
set autowrite
set foldmethod=syntax
set foldlevel=99
set hidden
set ignorecase
set smartcase
set showcmd
set cursorline
set dir=/tmp
set relativenumber
set list
set listchars=tab:▸\ ,eol:¬
set gfn=Monaco\ for\ Powerline:h12:cANSI
set undofile
set undodir=$TEMP
set synmaxcol=2048
set wildmode=list:longest
set completeopt=menuone,longest,preview
set clipboard=unnamed
set splitbelow
set splitright
set termguicolors
set so=999

colorscheme srcery

if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=7 guibg=red
endif

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ----------------------
" Plugin Configurations
" ----------------------

" Syntactic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs=1
let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_php_checkers=['php']
let g:syntastic_json_checkers=['json']
let g:syntastic_xml_checkers=['xml']

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nn :NERDTreeFocus<CR>

let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'

" NERDTree Git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ctrlp
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_dont_split = 'NERD'

noremap <leader>tt :CtrlPMRU<CR>
noremap <leader>t :CtrlPMixed<CR>

" Airline
let g:airline_powerline_fonts=1
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

set laststatus=2

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"

" YCM
let g:ycm_rust_src_path='/usr/local/src/rustc/src'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0

" Ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a <Esc>:Ack!<Space>

" Gitgutter
nmap gn <Plug>GitGutterNextHunk
nmap gp <Plug>GitGutterPrevHunk

" ----------------------
" AutoCommands
" ----------------------

autocmd BufWritePre * :%s/\s\+$//e
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

augroup phpcs_configuration
    autocmd filetype php let g:php_cs_fixer_path='/usr/local/bin/php-cs-fixer'
    autocmd filetype php let g:php_cs_fixer_level='psr2'
    autocmd filetype php let g:php_cs_fixer_fixers_list='PSR2,concat_with_spaces,short_array_syntax'
    autocmd filetype php let g:php_cs_fixer_php_path='/usr/local/bin/php'
    autocmd filetype php nnoremap <silent><leader>f :call PhpCsFixerFixFile()<CR>
augroup END

" ----------------------
" Commands
" ----------------------

command! CloseHiddenBuffers call s:CloseHiddenBuffers()
function! s:CloseHiddenBuffers()
  let open_buffers = []

  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor

  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bdelete ".num
    endif
  endfor
endfunction

" ----------------------
" Terminal configuration
" ----------------------

" Change shape of cursor in insert mode in iTerm 2

if exists('$ITERM_PROFILE')
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" vim:set ft=vim et sw=2:
