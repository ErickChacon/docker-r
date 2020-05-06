call plug#begin('~/.local/share/nvim/plugged')

" Aesthetics
Plug 'itchyny/lightline.vim'                             " statusline
Plug 'edkolev/tmuxline.vim'                              " tmux statusline
Plug 'ryanoasis/vim-devicons'                            " filetype icons
Plug 'kshenoy/vim-signature'                             " display marks
Plug 'mhinz/vim-signify'                                 " vcs differences
Plug 'majutsushi/tagbar'                                 " display tags
Plug 'ntpeters/vim-better-whitespace'                    " trailing space
Plug 'ap/vim-css-color'                                  " TODO: closes rmd chunk

" Ide features
Plug 'scrooloose/nerdtree'                               " file navigator
Plug 'ton/vim-bufsurf'                                   " buffer navigator
Plug 'christoomey/vim-tmux-navigator'                    " tmux-vim navigation
Plug 'junegunn/fzf'                    , {
            \ 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'                                  " fuzzy matching
Plug 'autozimu/LanguageClient-neovim'  , {
            \ 'branch': 'next', 'do': 'bash install.sh'} " language server
Plug 'Shougo/deoplete.nvim'            , {
            \ 'do': ':UpdateRemotePlugins' }             " completion
Plug 'tomtom/tcomment_vim'                               " commenting
Plug 'Shougo/neosnippet.vim'                             " snippets
Plug 'honza/vim-snippets'                                " snippets scripts
Plug 'jalvesaq/vimcmdline'                               " command line
Plug 'hkupty/iron.nvim'                                  " repls over neovim

" Languages
Plug 'lervag/vimtex'                                     " latex: compile
Plug 'vim-pandoc/vim-pandoc'                             " pandoc: filetype
Plug 'vim-pandoc/vim-pandoc-syntax'                      " pandoc: syntax
Plug 'cespare/vim-toml'                                  " toml: syntax
Plug 'jalvesaq/Nvim-R'                                   " R: support
Plug 'tpope/vim-fugitive'                                " git: wrapper
Plug 'airblade/vim-gitgutter'                            " git: shows changes
Plug 'vim-python/python-syntax'                          " python: better syntax
Plug 'octol/vim-cpp-enhanced-highlight'                  " cpp: better syntax
Plug 'JuliaEditorSupport/julia-vim'                      " julia: support

" Motions
Plug 'tpope/vim-surround'                                " sorround
Plug 'kana/vim-textobj-indent'                           " copy indented block
Plug 'kana/vim-textobj-user'                             " custom text object

" Others
Plug 'lervag/wiki.vim'                                   " make notes
Plug 'junegunn/vim-easy-align'                           " align
Plug 'junegunn/goyo.vim'                                 " distraction-free
Plug 'dkarter/bullets.vim'                               " smart bullets

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'sickill/vim-monokai'
Plug 'ajh17/Spacegray.vim'
Plug 'icymind/NeoSolarized'
Plug 'mhartington/oceanic-next'
Plug 'KeitaNakamura/neodark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'challenger-deep-theme/vim'       , {'as': 'challenger-deep' }
Plug 'joshdick/onedark.vim'
Plug 'nightsense/vim-crunchbang'
Plug 'exitface/synthwave.vim'
Plug 'jdkanani/vim-material-theme'
Plug 'dracula/vim'
Plug 'mhinz/vim-janah'
Plug 'jdsimcoe/abstract.vim'
Plug 'AlessandroYorba/Alduin'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'cseelus/vim-colors-lucid'
Plug 'rakr/vim-one'
Plug 'liuchengxu/space-vim-dark'
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'ajmwagar/vim-deus'
Plug 'sonph/onehalf'                   , {'rtp': 'vim/'}
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/tomorrow-theme'     , {'rtp': 'vim/'}

call plug#end()
