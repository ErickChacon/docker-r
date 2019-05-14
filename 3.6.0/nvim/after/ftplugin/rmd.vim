set foldcolumn=2                             " fold column
" " Mapping and nvim-r
" inoremap <buffer> >> <Esc>:normal! a%>%<CR>a
" inoremap <buffer> __ <Esc>:normal! a<-<CR>a
" inoremap <leader>, <C-x><C-o>
" nmap <LocalLeader>ll <Plug>RSendLine
"
" " Add snippets of rmd, r and tex
" UltiSnipsAddFiletypes rmd.r.tex
"
" " " Recoganize equations
" " call textobj#user#plugin('equation', {
" " \  'dollar-math-a': {
" " \     '*pattern*': '[$][^$]*[$]',
" " \     'select': 'a$',
" " \ },
" " \  'dollar-math-i': {
" " \     '*pattern*': '[$]\zs[^$]*\ze[$]',
" " \     'select': 'i$',
" " \ },
" " \ })
