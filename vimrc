" ------------------
" Vim configurations
" ------------------

" Load pathogen to work with plugins
execute pathogen#infect()

" Vim general settings
syntax on
filetype plugin indent on

set mouse=a
set ruler
set dir=/tmp
set number
set list
set listchars=tab:▸\ ,eol:¬
set cursorline
set background=dark
set gfn=Monaco\ for\ Powerline:h12:cANSI
set colorcolumn=80
set undofile
set undodir=$TEMP

colorscheme srcery

" ----------------------
"  Plugin configurations
" ----------------------

" NERDTree configurations

nmap <leader>n :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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


" Syntactic configuration

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers=['php']
let g:syntastic_json_checkers=['json']
let g:syntastic_xml_checkers=['xml']

" Airline
"
let g:airline_powerline_fonts = 1
let g:airline_enable_branch = 1
let g:airline_enable_syntastic = 1

" ctrlp
"
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
noremap <leader>tt :CtrlPMRU<CR>
noremap <leader>t :CtrlPMixed<CR>

" YCM

let g:ycm_rust_src_path = '/usr/local/src/rustc/src'

" Remove unnecessary whitespace

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


" ----------------------
" Commands
" ----------------------

" Can't really expect that this is usefull on shitty repositories. Erase all empty spaces
autocmd BufWritePre * :%s/\s\+$//e

" Rust Cargo cmd
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo


" ----------------------
" Terminal configuration
" ----------------------

" Change shape of cursor in insert mode in iTerm 2

if exists('$ITERM_PROFILE')
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
