call plug#begin('~/.local/share/nvim/plugged')

" EXPLORE FOLDER AND DOCUMENTS
Plug 'ctrlpvim/ctrlp.vim'                                       " find files
Plug 'scrooloose/nerdtree'                                      " folder manager
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'                                         " fuzzy matching

" DEVELOPMENT ENVIRONMENT TOOLS
Plug 'jalvesaq/vimcmdline'                                      " command line
Plug 'hkupty/iron.nvim'                                         " repls over neovim
Plug 'SirVer/ultisnips'                                         " snippets
Plug 'honza/vim-snippets'                                       " snippets scripts
Plug 'christoomey/vim-tmux-navigator'                           " tmux ctrl navigation
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

" VISUAL IMPROVEMENT
Plug 'itchyny/lightline.vim'                                    " status and tab lines
Plug 'edkolev/tmuxline.vim'                                     " tmux status and tab lines
Plug 'ryanoasis/vim-devicons'                                   " filetype icons
Plug 'kshenoy/vim-signature'                                    " display and navigate marks
Plug 'mhinz/vim-signify'                                        " show differences
Plug 'majutsushi/tagbar'                                        " display tags
Plug 'ntpeters/vim-better-whitespace'                           " whitespace
Plug 'ap/vim-css-color'                                         " TODO: closes rmd chunk

" PROGRAMS
Plug 'vimwiki/vimwiki'                                          " vimwiki: notes and agenda
Plug 'lervag/vimtex'                                            " latex: compile
Plug 'vim-pandoc/vim-pandoc'                                    " pandoc: integration
Plug 'vim-pandoc/vim-pandoc-syntax'                             " pandoc: syntax
Plug 'cespare/vim-toml'                                         " toml: syntax highlight
Plug 'jalvesaq/Nvim-R'                                          " R: support
Plug 'tpope/vim-fugitive'                                       " git: wrapper
Plug 'airblade/vim-gitgutter'                                   " git: shows changes
Plug 'vim-python/python-syntax'                                 " python: syntax
Plug 'octol/vim-cpp-enhanced-highlight'                         " cpp: better syntax
Plug 'JuliaEditorSupport/julia-vim'                             " julia: support

" Motions
Plug 'tpope/vim-surround'                                       " sorround
Plug 'kana/vim-textobj-indent'                                  " copy indented block
Plug 'kana/vim-textobj-user'                                    " custom text object
Plug 'tomtom/tcomment_vim'                                      " easy comment: nice for rmd
Plug 'godlygeek/tabular'                                        " format as table

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'sickill/vim-monokai'
Plug 'ajh17/Spacegray.vim'
Plug 'icymind/NeoSolarized'
Plug 'mhartington/oceanic-next'
Plug 'KeitaNakamura/neodark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'challenger-deep-theme/vim', {'as': 'challenger-deep' }
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
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

call plug#end()
