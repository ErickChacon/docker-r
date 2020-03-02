call plug#begin('~/.local/share/nvim/plugged')

" EXPLORE FOLDER AND DOCUMENTS
Plug 'ctrlpvim/ctrlp.vim'              , {'commit': '2e773fd'}  " find files
Plug 'scrooloose/nerdtree'             , {'commit': '67fa9b3'}  " folder manager
Plug 'junegunn/fzf'                    , {'commit': '430e819',
      \ 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'                , {'commit': 'ac4e7bf'}  " fuzzy matching

" DEVELOPMENT ENVIRONMENT TOOLS
Plug 'jalvesaq/vimcmdline'             , {'commit': '17275ab'}  " command line
Plug 'hkupty/iron.nvim'                , {'commit': 'c3542c2'}  " repls over neovim
Plug 'Shougo/neosnippet.vim'           , {'commit': 'ed80ae8'}  " snippets
Plug 'honza/vim-snippets'              , {'commit': '7ade68c'}  " snippets scripts
Plug 'christoomey/vim-tmux-navigator'  , {'commit': '4e1a877'}  " tmux ctrl navigation
Plug 'autozimu/LanguageClient-neovim'  , {'commit': '41c948e',
      \ 'branch': 'next', 'do': 'bash install.sh'}
Plug 'Shougo/deoplete.nvim'            , {'commit': '3e3b762',
      \ 'do': ':UpdateRemotePlugins' }

" VISUAL IMPROVEMENT
Plug 'itchyny/lightline.vim'           , {'commit': 'bb0b401'}  " status and tab lines
" Plug 'edkolev/tmuxline.vim'            , {'commit': '7001ab3'}  " tmux status and tab lines
Plug 'ryanoasis/vim-devicons'          , {'commit': 'cdc08fd'}  " filetype icons
Plug 'kshenoy/vim-signature'           , {'commit': '6bc3dd1'}  " display and navigate marks
Plug 'mhinz/vim-signify'               , {'commit': 'f34fea0'}  " show vcs differences
Plug 'majutsushi/tagbar'               , {'commit': '387bbad'}  " display tags
Plug 'ntpeters/vim-better-whitespace'  , {'commit': 'f5726c4'}  " whitespace
Plug 'ap/vim-css-color'                , {'commit': '5a31c72'}  " TODO: closes rmd chunk

" PROGRAMS
Plug 'vimwiki/vimwiki'                 , {'commit': 'be793e2'}  " vimwiki: notes and agenda
Plug 'lervag/vimtex'                   , {'commit': 'ef428bb'}  " latex: compile
Plug 'vim-pandoc/vim-pandoc'           , {'commit': '2e342ac'}  " pandoc: integration
Plug 'vim-pandoc/vim-pandoc-syntax'    , {'commit': 'e557ade'}  " pandoc: syntax
Plug 'cespare/vim-toml'                , {'commit': '2295e61'}  " toml: syntax highlight
Plug 'jalvesaq/Nvim-R'                 , {'commit': 'e7f4df0'}  " R: support
Plug 'tpope/vim-fugitive'              , {'commit': '5d99841'}  " git: wrapper
" Plug 'airblade/vim-gitgutter'          , {'commit': '7eeea63'}  " git: shows changes
Plug 'vim-python/python-syntax'        , {'commit': '1df5e5a'}  " python: syntax
Plug 'octol/vim-cpp-enhanced-highlight', {'commit': '3aa9562'}  " cpp: better syntax
Plug 'JuliaEditorSupport/julia-vim'    , {'commit': '386371f'}  " julia: support

" MOTIONS
Plug 'tpope/vim-surround'              , {'commit': 'ca58a2d'}  " sorround
Plug 'kana/vim-textobj-indent'         , {'commit': 'deb7686'}  " copy indented block
Plug 'kana/vim-textobj-user'           , {'commit': '074ce25'}  " custom text object
Plug 'tomtom/tcomment_vim'             , {'commit': '622cc05'}  " easy comment: nice for rmd
Plug 'godlygeek/tabular'               , {'commit': '339091a'}  " format as table

" COLORSCHEMES
Plug 'morhetz/gruvbox'                 , {'commit': 'cb4e7a5'}
Plug 'sickill/vim-monokai'             , {'commit': 'ae77538'}
Plug 'ajh17/Spacegray.vim'             , {'commit': '69e8fef'}
Plug 'icymind/NeoSolarized'            , {'commit': '1af4bf6'}
Plug 'mhartington/oceanic-next'        , {'commit': '08158ee'}
Plug 'KeitaNakamura/neodark.vim'       , {'commit': 'e95e924'}
Plug 'arcticicestudio/nord-vim'        , {'commit': 'de24841'}
Plug 'challenger-deep-theme/vim'       , {'commit': '927720e', 'as': 'challenger-deep' }
Plug 'joshdick/onedark.vim'            , {'commit': '7f36f83'}
Plug 'nightsense/vim-crunchbang'       , {'commit': '448e75e'}
Plug 'exitface/synthwave.vim'          , {'commit': 'a19772b'}
Plug 'jdkanani/vim-material-theme'     , {'commit': '33bd4bf'}
Plug 'dracula/vim'                     , {'commit': 'b68c4fd'}
Plug 'mhinz/vim-janah'                 , {'commit': '3b8ae97'}
Plug 'jdsimcoe/abstract.vim'           , {'commit': '16d0131'}
Plug 'AlessandroYorba/Alduin'          , {'commit': '379418b'}
Plug 'tyrannicaltoucan/vim-deep-space' , {'commit': '126d52f'}
Plug 'w0ng/vim-hybrid'                 , {'commit': 'cc58baa'}
Plug 'nanotech/jellybeans.vim'         , {'commit': 'ddf78cf'}
Plug 'cseelus/vim-colors-lucid'        , {'commit': 'a2bc8f6'}
Plug 'rakr/vim-one'                    , {'commit': '6695e13'}
Plug 'liuchengxu/space-vim-dark'       , {'commit': 'f707a39'}
Plug 'jacoborus/tender.vim'            , {'commit': '6b0497a'}
Plug 'rakr/vim-two-firewatch'          , {'commit': 'efa0689'}
Plug 'ajmwagar/vim-deus'               , {'commit': 'c6200a1'}
Plug 'sonph/onehalf'                   , {'commit': 'c0f08a2', 'rtp': 'vim/'}
Plug 'chriskempson/base16-vim'         , {'commit': '2073e2d'}
Plug 'chriskempson/tomorrow-theme'     , {'commit': '0e0d35a', 'rtp': 'vim/'}

call plug#end()
