
let g:neosnippet#disable_runtime_snippets = {
		\   '_' : 1,
		\ }
let g:neosnippet#snippets_directory=['~/.local/share/nvim/plugged/vim-snippets/snippets',
            \ '~/Documents/Repositories/dotfiles-ubuntu-18/neosnippets']
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['rmd'] = 'r,rmd'

imap <C-L>     <Plug>(neosnippet_expand_or_jump)
smap <C-L>     <Plug>(neosnippet_expand_or_jump)
xmap <C-L>     <Plug>(neosnippet_expand_target)

