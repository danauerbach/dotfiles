call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree'

" Git support
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/syntastic'

Plug 'vim-airline/vim-airline'

"Python code folding
Plug 'tmhedberg/SimpylFold'

call plug#end()

map <C-n> :NERDTreeToggle<CR>

syntax on

set encoding=utf-8

" show invisibles˧
set listchars=tab:→\ ,trail:·,eol:˧
set list

set showmode
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" enable folding
set foldmethod=indent
set foldlevel=99

set statusline+=%#warningmsg#
set statusline+={fugitive#statusline()}
set statusline+=%*

" Tab stuff
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

set ttimeout
set ttimeoutlen=20
set notimeout

" Line, ruler and number settings
set cursorline
set number
set noruler
set laststatus=2

" Split config
set splitbelow
set splitright

" airline config
let g:airline#extensions#tabline#enabled = 1

" SimplFold config
let g:SimpylFold_docstring_preview = 1

" increase vim-plug timeout values for large installs like YCM
let g:plug_timeout = 600
" Some syntastic defaults
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '❌'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

