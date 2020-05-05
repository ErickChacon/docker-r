" Neovim settings
" Language:     Neovim
" Last Change:  12 May 2019

so ~/.config/nvim/init/config.vim       " simple settings
so ~/.config/nvim/init/plugins-docker.vim    " plugins

so ~/.config/nvim/init/colorscheme.vim   " select colorscheme
so ~/.config/nvim/init/folding.vim

so ~/.config/nvim/init/lightline.vim
so ~/.config/nvim/init/tmuxline.vim
" so ~/.config/nvim/init/devicons.vim

" ide features
so ~/.config/nvim/init/navigation.vim
so ~/.config/nvim/init/languageserver.vim
so ~/.config/nvim/init/deoplete.vim
so ~/.config/nvim/init/neosnippets.vim
" so ~/.config/nvim/init/vimwiki.vim
"

so ~/.config/nvim/init/lang-r.vim
" so ~/.config/nvim/init/lang-tex.vim
so ~/.config/nvim/init/lang-pandoc.vim
" so ~/.config/nvim/init/lang-cpp.vim
"
" so ~/.config/nvim/init/wiki.vim
"
"
so ~/.config/nvim/init/easyalign.vim

" here it comes my test


let g:wiki_root = '~/Documents/Organizer'
let g:wiki_filetypes = ['md', 'Rmd']

let g:wiki_journal = {
    \ 'name': 'journal',
    \ 'frequency': 'daily',
    \ 'date_format': {
    \   'daily' : '%Y-%m-%d',
    \   'weekly' : '%Y_w%V',
    \   'monthly' : '%Y_m%m',
    \ },
    \}
