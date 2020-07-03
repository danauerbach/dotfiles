call plug#begin('~/.vim/bundle')

" using CTRLP for pure vimscript implementation
"Plug 'scrooloose/nerdtree'
"Plug 'wincent/command-t'
Plug 'ctrlpvim/ctrlp.vim'

" Git support
Plug 'tpope/vim-fugitive'

" surround support
Plug 'tpope/vim-surround'

Plug 'scrooloose/syntastic'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"PYTHON plugins
" Python code folding
Plug 'tmhedberg/SimpylFold'
" better python indenting
Plug 'vim-scripts/indentpython.vim'

" window resizing
Plug '/vim-scripts/directionalWindowResizer'

call plug#end()

" other plugins...

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOS
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.git|CVS$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['CTRLP_ROOT']

" nmap <leader>n :NERDTreeToggle<CR>
" let NERDTreeMapActivateNode='right'

map <leader>reload :source ~/.vimrc<CR>

syntax on
filetype on
" make c comments grey
hi cComment term=None cterm=None ctermfg=Gray

" enable all Python syntax highlighting features
let python_highlight_all = 1
" make python comments grey
hi Comment term=None ctermfg=7  guifg=#80a0ff

set encoding=utf-8
set backspace=start,indent,eol

" show invisibles˧
set listchars=tab:→\ ,trail:·,eol:˧
set list

set showmode
" show matching parens
set showmatch

" enable folding
set foldmethod=indent
set foldlevel=99

set statusline+=%#warningmsg#
set statusline+={fugitive#statusline()}
set statusline+={SyntasticStatuslineFlag()}
set statusline+=%*

" Tab stuff
set expandtab
set tabstop=4
set shiftwidth=4
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
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='angr'

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
let g:syntastic_c_compiler = 'gcc'
"let g:syntastic_c_compiler_options = '-std=ansi -DDARWIN'
let OSNAME = 'DARWIN'
let g:syntastic_c_compiler_options = '-D'.OSNAME
let g:syntastic_c_include_dirs = ['/home/dauerbach/src/include', '/usr/include', '/Users/dauerbach/cvs/src/include']
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
