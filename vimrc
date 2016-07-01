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
set gfn=Monaco:h12

"" NERDTree configurations
map <leader>n :NERDTreeToggle<CR>

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

"" Rust grammar configurations
let g:rustfmt_autosave = 1

"" Remove unnecessary whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"" Can't really expect that this is usefull on shitty repositories. Erase all empty spaces
autocmd BufWritePre * :%s/\s\+$//e
