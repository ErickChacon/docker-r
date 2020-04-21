  " mywaikiki#Load {{{1
  function! mywaikiki#Load() abort
    if !get(g:, 'mywaikikisetup_loaded', 0)
      packadd vim-waikiki
      call waikiki#CheckBuffer(expand('%:p'))
    endif
  endfun

  " " mywaikiki#SetupBuffer {{{1
  " function! mywaikiki#SetupBuffer() abort
  "   nmap  <buffer>  zl                    <Plug>(waikikiFollowLink)
  "   nmap  <buffer>  zh                    <Plug>(waikikiGoUp)
  "   xn    <buffer>  <LocalLeader>c        <Esc>m`g'<O```<Esc>g'>o```<Esc>``
  "   nmap  <buffer><silent> <LocalLeader>i :let &l:cocu = (&l:cocu==""
  "                                          \ ? "n" : "")<cr>
  "   setl sw=2
  "   " setl cole=2
  " endfun
  "
  " " augroup Waikiki {{{1
  " augroup Waikiki
  "   au!
  "   autocmd User setup
  "         \ call mywaikiki#SetupBuffer()
  " augroup END
