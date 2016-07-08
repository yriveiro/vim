" ------------------
" Vim configurations
" ------------------

" Load pathogen to work with plugins
execute pathogen#infect()

" Vim general settings
syntax on
filetype plugin indent on

set mouse=r
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
set synmaxcol=2048
set completeopt-=preview

colorscheme srcery

" ----------------------
"  Plugin configurations
" ----------------------

" NERDTree configurations

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>nn :NERDTreeFocus<CR>

let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufWinEnter * NERDTreeFind

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
let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_php_checkers=['php']
let g:syntastic_json_checkers=['json']
let g:syntastic_xml_checkers=['xml']

" Airline
"
let g:airline_powerline_fonts=1
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1

" ctrlp

let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'
noremap <leader>tt :CtrlPMRU<CR>
noremap <leader>t :CtrlPMixed<CR>

" YCM

let g:ycm_rust_src_path='/usr/local/src/rustc/src'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0

" PHP-CS-FIXER
let g:php_cs_fixer_path='/usr/local/bin/php-cs-fixer'
let g:php_cs_fixer_level='psr2'
let g:php_cs_fixer_fixers_list='PSR2,concat_with_spaces,short_array_syntax'
let g:php_cs_fixer_php_path='/usr/local/bin/php'

nnoremap <silent><leader>f :call PhpCsFixerFixFile()<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"

" If you want :UltiSnipsEdit to split your window.
 let g:UltiSnipsEditSplit="vertical"

" Remove unnecessary whitespace

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


" ----------------------
" AutoCommands
" ----------------------

" Can't really expect that this is usefull on shitty repositories. Erase all empty spaces
autocmd BufWritePre * :%s/\s\+$//e

" Rust Cargo cmd
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo

" Set file type for specific extensions
autocmd BufNewFile,BufRead *.twig set filetype=twig
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig


" ----------------------
" Terminal configuration
" ----------------------

" Change shape of cursor in insert mode in iTerm 2

if exists('$ITERM_PROFILE')
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
