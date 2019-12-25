
" local config
set foldcolumn=2                                   " fold column
set foldlevel=1                                    " fold level
set foldtext=MyFoldText()                          " custom fold text

" functions
function! RObjBrowserNerd()
  call RObjBrowser()
  execute 'NERDTreeToggle'
endfunction

" Mapping and nvim-r
inoremap <buffer> >> <Esc>:normal! a %>%<CR>a
inoremap <buffer> <leader>, <C-x><C-o>
nmap <buffer> <silent> <leader>ro :call RObjBrowserNerd()<CR>
nmap <buffer> <LocalLeader>rgj :RSend dev.set(which = dev.next())<CR>
nmap <buffer> <LocalLeader>rgk :RSend dev.set(which = dev.prev())<CR>
nmap <buffer> <LocalLeader>rgn :RSend dev.new()<CR>


" Add snippets of rmd, r and tex
" UltiSnipsAddFiletypes rmd.r.tex

" " Recoganize equations
" call textobj#user#plugin('equation', {
" \  'dollar-math-a': {
" \     '*pattern*': '[$][^$]*[$]',
" \     'select': 'a$',
" \ },
" \  'dollar-math-i': {
" \     '*pattern*': '[$]\zs[^$]*\ze[$]',
" \     'select': 'i$',
" \ },
" \ })
