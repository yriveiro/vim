execute pathogen#infect()
syntax on
filetype plugin indent on

"" Change shape of cursor in insert mode in iTerm 2
if exists('$ITERM_PROFILE')
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"" NERDTree symbols

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'