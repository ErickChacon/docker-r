setlocal spell
" setlocal formatoptions+=at                       " text wraping

" to recognize equations in any filetype
call textobj#user#plugin('equation', {
\  'dollar-math-a': {
\     '*pattern*': '[$][^$]*[$]',
\     'select': 'a$',
\ },
\  'dollar-math-i': {
\     '*pattern*': '[$]\zs[^$]*\ze[$]',
\     'select': 'i$',
\ },
\ })
