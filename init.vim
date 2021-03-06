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
Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py --clang-completer --omnisharp-completer' }
Plug 'benekastah/neomake'
Plug 'critiqjo/lldb.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kopischke/vim-stay'
Plug 'leafgarland/typescript-vim'
Plug 'lyuts/vim-rtags'
Plug 'majutsushi/tagbar'
Plug 'Quramy/tsuquyomi'
Plug 'rdnetto/YCM-Generator', { 'branch':'stable' }
Plug 'rking/ag.vim'
Plug 'sjl/gundo.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'tikhomirov/vim-glsl'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wting/rust.vim'

Plug 'chriskempson/base16-vim'

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
set shada=!,'100000,f1,<500,:100000,@100000,/100000,%1
set shortmess+=at
set showcmd
set showfulltag
set showmatch
set showmode
set switchbuf=useopen
set title
set titlestring=%<%F
set undolevels=1000
set viminfo='100000,f1,<500,:100000,@100000,/100000,%1
set wildmenu
set wildmode=list:full
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
set completeopt=menu,preview,noinsert
set tags+=~/.vim/systags 
set tags+=TAGS

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
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <C-PageUp> gT
nnoremap <C-PageDown> gt
inoremap <C-PageUp> <Esc>gT
inoremap <C-PageDown> <Esc>gt
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

" Plugin mappings
nnoremap <A-b> <Plug>LLBreakSwitch
vnoremap <F2> <Plug>LLStdInSelected
nnoremap <silent> <F4> :LLstdin<CR>
nnoremap <silent> <F5> :LLmode debug<CR>
nnoremap <silent> <S-F5> :LLmode code<CR>
nnoremap <silent> <F8> :LL continue<CR>
nnoremap <silent> <S-F8> :LL process interrupt<CR>
nnoremap <silent> <F9> :LL print <C-R>=expand('<cword>')<CR>
vnoremap <silent> <F9> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>
nnoremap <silent> <silent> gy :YcmCompleter GoTo<CR>

" Plugin configs
let g:proj_flags = "gimst"
let g:pyflakes_use_quickfix = 0
let g:pep8_map = '<leader>8'
let g:tagbar_vertical = 0
let g:tagbar_iconchars = ['▸', '▾']
let g:SuperTabDefaultCompletionType = "context"
let g:ycm_confirm_extra_conf = 0
if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
let g:ycm_global_ycm_extra_conf = '/home/moshev/.config/nvim/ycm_global_extra_conf.py'

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
"autocmd BufWritePre *.c,*.cpp,*.h,*.java,*.php,*.py :call <SID>StripTrailingWhitespaces()

" Restore position in file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" NyaoVim configuration
if exists('g:nyaovim_version')
    colorscheme base16-brewer
    set bg=light
else
    colorscheme default
    set bg=dark
endif

