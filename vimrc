call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype plugin indent on
" set tabstop=4
set smarttab
set shiftwidth=4
set softtabstop=4
set autoindent
set expandtab
set number
set numberwidth=3
set nowrap
" set t_Co=256

"set guioptions=aAce

let g:DisableAutoPHPFolding = 1

"map <C-D> :execute 'NERDTreeToggle ' .getcwd()<CR>
"map <C-M> :execute 'NERDTreeMirror'<CR>
"nmap <C-N> :execute 'NERDTreeToggle ' .getcwd()<CR>
"nmap <C-M> :execute 'NERDTreeMirror'<CR>
nmap <S-N> :NERDTreeToggle \| :silent NERDTreeMirror<CR>
nmap <C-N><C-N> :set invnumber<CR>

nmap tt  :tabnew<CR>
nmap tn  :tabnext<CR>
nmap tp  :tabprevious<CR>
nmap tf  :tabfirst<CR>
nmap tl  :tablast<CR>
nmap tc  :tabclose<CR>

colorscheme desert

"au VimEnter *  NERDTree
set guitablabel=%M%t
