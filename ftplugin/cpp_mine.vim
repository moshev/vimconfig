setlocal cindent
setlocal cinoptions=t0
setlocal cinwords=if,else,while,do,for,switch,case
setlocal tabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal noexpandtab
setlocal foldmethod=syntax
setlocal formatprg=astyle\ -T4\ -A3\ -p\ -H\ -U\ -j\ -J\ --mode=c
setlocal comments^=:///
setlocal isk-=-
setlocal isk-=.

"nmap <C-F12> :!ctags -R --c++-kinds=+p  --fields=+iaS --extra=+q %:p:h<CR>

"OmniCpp Completion plugin options
"Search namespaces in this buffer and included files
let g:OmniCpp_NamespaceSearch = 2
let g:OmniCpp_ShowPrototypeInAbbr = 1
"Automatic completion
let g:OmniCpp_MayCompleteDot = 0
let g:OmniCpp_MayCompleteArrow = 0
let g:OmniCpp_MayCompleteScope = 0
let g:AutoComplPop_MappingDriven = 1

