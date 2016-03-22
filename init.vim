" Some stuff added by me, some stuff cannibalized
" from various sources around the net. Feel free to rip this apart and use it
" to your own nefarious ends.

filetype off

" Load bundles
call plug#begin()

" see https://github.com/junegunn/vim-plug

Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Konfekt/FastFold'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py --clang-completer --omnisharp-completer' }
Plug 'kopischke/vim-stay'
Plug 'leafgarland/typescript-vim'
Plug 'lyuts/vim-rtags'
Plug 'majutsushi/tagbar'
Plug 'rdnetto/YCM-Generator', { 'branch':'stable' }
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'tikhomirov/vim-glsl'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
"broken on neovim :(
"Plug 'wincent/Command-T'
Plug 'wting/rust.vim'

call plug#end()

" basic options
let mapleader = ","
set autowrite
set cmdheight=1
set diffopt=filler,iwhite,vertical
set enc=utf-8
set ff=unix
set ffs=unix,mac,dos
set fileencodings=ucs-bom,utf-8,cp1251,default,latin1
set hidden
set history=1000
set history=200
set linebreak
set modeline
set nocursorline
set noerrorbells
set nomousef
set novisualbell
set number
set relativenumber
set shortmess+=at
set showcmd
set showfulltag
set showmatch
set showmode
set switchbuf=usetab,newtab
set title
set titlestring=%<%F
set undolevels=1000
set viminfo='1000,f1,<500,:1000,@1000,/1000,%1
set wildmenu
set wildmode=list:full
colorscheme desert
set bg=dark
syntax on

" text layout settings 
set noexpandtab 
set wrap

" indent settings 
set autoindent 
set backspace=eol,start,indent 
set shiftwidth=8
set smartindent
set tabstop=8
set nosmarttab

" folding 
set foldmethod=indent 
set foldopen -=hor
set foldlevel =99

" search options 
set gdefault 
set incsearch 
set isk=@,48-57,_,192-255,-,.,@-@ 
set nohlsearch 
set noignorecase 

" omnicompletion 
set completeopt=menu,preview
set tags+=~/.vim/systags 

" set comment formats 
set comments-=s1:/*,mb:*,ex:*/ 
set comments+=s:/*,mb:**,ex:*/ 
set comments+=fb:* 
set comments+=b:\" 
set comments+=n:: 

" use css for generated html files 
let html_use_css=1 

" setup a funky statusline 
set laststatus=2 
set statusline= 
set statusline+=%-3.3n\                      " buffer number 
set statusline+=%t\                          " file name 
set statusline+=%h%m%r%w                     " flags 
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype 
set statusline+=%{&fileencoding},            " fileencoding 
set statusline+=%{&fileformat}]              " file format 
set statusline+=%{fugitive#statusline()}     " git status
set statusline+=%=                           " right align 
set statusline+=0x%-8B\                      " current char 
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset 

" enable filetype detection 
filetype on 
filetype plugin on 
filetype indent on 

" shortcuts
nnoremap <silent><C-F11> :let @/=''<cr>
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
"noremap <leader>td <Plug>TaskList
nnoremap <silent> <F5> :GundoToggle<cr>
"noremap <leader>nt :NERDTreeToggle<cr>
"noremap <leader>a :Ack!<cr>
"noremap <leader>mk :call MakeGreen()<cr>
nnoremap <silent> <leader>s :w<CR>
inoremap <silent> <leader>с :w<CR>
inoremap <silent> <leader>s <C-o>:w<CR>
inoremap <silent> <leader>с <C-o>:w<CR>
nnoremap ]y do]c
nnoremap <silent> gy :YcmCompleter GoTo<CR>

" Plugin configs
let g:proj_flags = "gimst"
let g:pyflakes_use_quickfix = 0
let g:pep8_map = '<leader>8'
let g:tagbar_vertical = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:SuperTabDefaultCompletionType = "context"
let g:ycm_confirm_extra_conf = 0

" Breaks things a bit
"autocmd BufEnter * cd %:p:h

" command to save as root
cnoremap w!! w !sudo tee > /dev/null %

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Function to strip trailing whitespace when desired
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre *.c,*.cpp,*.h,*.java,*.php,*.py :call <SID>StripTrailingWhitespaces()

" Restore position in file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

