call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree'
Plug 'wincent/command-t'

" Git support
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/syntastic'

Plug 'vim-airline/vim-airline'

"Python code folding
Plug 'tmhedberg/SimpylFold'
" better Ppython indenting

" window resizing
Plug 'directionalWindowResizer'

Plug 'vim-scripts/indentpython.vim'
call plug#end()
 
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='right'

map <leader>reload :source ~/.vimrc<CR>

syntax on
filetype on

set encoding=utf-8

" show invisibles˧
set listchars=tab:→\ ,trail:·,eol:˧
set list

set showmode
" show matching parens

set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" enable folding
set foldmethod=indent
set foldlevel=99

set statusline+=%#warningmsg#
set statusline+={fugitive#statusline()}
set statusline+={SyntasticStatuslineFlag()}
set statusline+=%*

" Tab stuff
set expandtab
set tabstop=3
set shiftwidth=3
set autoindent

" python specifics
au BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4 
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py match BadWhitespace /\s\+$/

set ttimeout
set ttimeoutlen=20
set notimeout

" Line, ruler and number settings
set cursorline
set number
set noruler
set laststatus=2
set colorcolumn=90

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
let g:syntastic_python_checkers = ['pyflakes', 'python']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '❌'
let g:syntastic_aggregate_errors = 1
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

