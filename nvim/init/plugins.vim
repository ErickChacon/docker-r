call plug#begin('~/.local/share/nvim/plugged')

" Aesthetics
Plug 'itchyny/lightline.vim'           , {'commit': 'bb0b401'}  " statusline
Plug 'edkolev/tmuxline.vim'            , {'commit': '1142333'}  " tmux statusline
Plug 'kshenoy/vim-signature'           , {'commit': '6bc3dd1'}  " display marks
Plug 'mhinz/vim-signify'               , {'commit': 'f34fea0'}  " vcs differences
Plug 'ntpeters/vim-better-whitespace'  , {'commit': 'f5726c4'}  " trailing space

" Ide features
Plug 'scrooloose/nerdtree'             , {'commit': '67fa9b3'}  " file navigator
Plug 'ton/vim-bufsurf'                 , {'commit': 'e93829b'}  " buffer navigator
Plug 'christoomey/vim-tmux-navigator'  , {'commit': '4e1a877'}  " tmux-vim navigation
Plug 'junegunn/fzf'                    , {'commit': '430e819',
            \ 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'                , {'commit': 'ac4e7bf'}  " fuzzy matching
Plug 'autozimu/LanguageClient-neovim'  , {'commit': '41c948e',
            \ 'branch': 'next', 'do': 'bash install.sh'}        " language server
Plug 'Shougo/deoplete.nvim'            , {'commit': 'a76d2fb',
            \ 'do': ':UpdateRemotePlugins' }                    " completion
Plug 'tomtom/tcomment_vim'             , {'commit': '622cc05'}  " commenting
Plug 'Shougo/neosnippet.vim'           , {'commit': 'ed80ae8'}  " snippets
Plug 'honza/vim-snippets'              , {'commit': '7ade68c'}  " snippets scripts

" Languages
Plug 'vim-pandoc/vim-pandoc'           , {'commit': 'c473c29'}  " pandoc: filetype
Plug 'vim-pandoc/vim-pandoc-syntax'    , {'commit': '0d1129e'}  " pandoc: syntax
Plug 'cespare/vim-toml'                , {'commit': '2295e61'}  " toml: syntax
Plug 'jalvesaq/Nvim-R'                 , {'commit': '7a551bd'}  " R: support
Plug 'tpope/vim-fugitive'              , {'commit': '5d99841'}  " git: wrapper


" Motions
Plug 'tpope/vim-surround'              , {'commit': 'ca58a2d'}  " sorround
Plug 'kana/vim-textobj-indent'         , {'commit': 'deb7686'}  " copy indented block
Plug 'kana/vim-textobj-user'           , {'commit': '074ce25'}  " custom text object

" Others
Plug 'lervag/wiki.vim'                 , {'commit': '92734dc'}  " make notes
Plug 'junegunn/vim-easy-align'         , {'commit': '12dd631'}  " align
Plug 'dkarter/bullets.vim'             , {'commit': 'c9f915e'}  " smart bullets

" Colorschemes
Plug 'morhetz/gruvbox'                 , {'commit': 'cb4e7a5'}

call plug#end()
