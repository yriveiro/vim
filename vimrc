execute pathogen#infect()
syntax on
filetype plugin indent on

"" Save swap files centrally if possible
set dir=/tmp

"" Show invisibles
set list
set listchars=tab:▸\ ,eol:¬

"" Change shape of cursor in insert mode in iTerm 2
if exists('$ITERM_PROFILE')
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"" Highlight current line
set cursorline

"" Look and Feel
set background=dark
colorscheme srcery
set gfn=Monaco\ for\ Powerline:h12:cANSI

if version >= 703
	set colorcolumn=80
	set undofile
	set undodir=$TEMP
endif

set number
set ruler

"" NERDTree configurations
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

"" Syntactic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_php_checkers=['php']
let g:syntastic_json_checkers=['json']
let g:syntastic_xml_checkers=['xml']

"" Airline
let g:airline_powerline_fonts = 1
let g:airline_enable_branch = 1
let g:airline_enable_syntastic = 1

"" ctrlp
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
noremap <leader>tt :CtrlPMRU<CR>
noremap <leader>t :CtrlPMixed<CR>

"" YCM
let g:ycm_rust_src_path = '/usr/local/rust/rustc/src'

"" Remove unnecessary whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"" Can't really expect that this is usefull on shitty repositories. Erase all empty spaces
autocmd BufWritePre * :%s/\s\+$//e

