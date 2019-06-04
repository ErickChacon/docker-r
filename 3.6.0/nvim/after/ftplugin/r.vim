
" local config
setlocal spell

" functions
function! RObjBrowserNerd()
  call RObjBrowser()
  execute 'NERDTreeToggle'
endfunction

" Mapping and nvim-r
inoremap <buffer> >> <Esc>:normal! a %>%<CR>a
inoremap <leader>, <C-x><C-o>
nmap <buffer> <silent> <leader>ro :call RObjBrowserNerd()<CR>
nmap <buffer> <LocalLeader>rgj :RSend dev.set(which = dev.next())<CR>
nmap <buffer> <LocalLeader>rgk :RSend dev.set(which = dev.prev())<CR>
nmap <buffer> <LocalLeader>rgn :RSend dev.new()<CR>


" folding
setlocal foldmethod=expr
setlocal foldlevel=0
setlocal foldexpr=RFold()

function! RFold() " {{{

  let this_line = getline(v:lnum)

  if match(this_line, '}') >= 0
    if match(this_line, '{') >= 0
      return '=' " if { and } matches on the same line do not do anything.
    elseif match(this_line, '})\?$') >= 0
      return 's1' " reduce fold only when finish with } or })
    endif
  elseif match(this_line, '{$') >= 0
    return 'a1'
  elseif this_line =~ '^#\s.*---'
  " elseif this_line =~ '^#\s\d.*---' " to not fold commented sections
    return '>1'
  endif
  return '='
endfunction " }}}
