" Neovim settings
" Language:     Neovim
" Last Change:  12 May 2019
"
" PLUGINS {{{

so ~/.config/nvim/plugins.vim
" challenger_deep
" deep-space

" }}}
" GENERAL SETTING {{{

" MAPPING AND KEYBOARD
let mapleader = "\\"                         " map leader as backslash (default)
let maplocalleader = "\\"                    " map localleader as backslash
set backspace=indent,eol,start               " use backspace to delete in insert mode

" MODIFICATIONS
set autoread                                 " read changes outside nvim
au FocusGained * :checktime                  " read changes outside nvim
set backupcopy=yes                           " able to edit docker volumne file
set autowrite                                " save before running commands
au FocusGained,BufEnter * :silent!           " update file when entering buffer
set history=50                               " history of the last commands ':'

" MOUSE AND CLIPBOARD USAGE
set mouse=a                                  " allow use of mouse
set clipboard+=unnamedplus                   " copy to clipboard

" SEARCHES
set hlsearch                                 " highlight searches
set incsearch                                " search as characters are entered
set ignorecase                               " case insensitive searching
set smartcase                                " override ignorecase when upper characters
nnoremap <silent> <leader>, :noh<cr>         " stop highlight after searching

" INDENTATION
set shiftwidth=2                             " indentation size
set softtabstop=2                            " number of spaces per tab
set expandtab                                " tabs are spaces

" ROW NUMBERS FORMAT
set number                                   " show line number
set numberwidth=4                            " width
set relativenumber                           " relative

" TEXTWIDTH AND WRAPING
set textwidth=85                             " textwidth
set formatoptions=cqt                        " text wraping
set colorcolumn=+1                           " color column after textwidth
let &colorcolumn="".join(range(91,999),",")  " color column after textwidth

" VISUAL SETTINGS
set title                                       " window title
set showmatch                                   " show matching brackets for a moment
set cursorline                                  " highlight current line
set fillchars+=vert:\│                          " split separator
hi VertSplit guibg=NONE guifg=#1d2021 gui=none  " split separator color

" MENU OPTIONS
set wildmenu                                 " nice visual autocomplete for command menu
set wildmode=list:longest,full               " full menu

" UPDATE WINDOW AND ERROR SOUND
set lazyredraw                               " redraw only when we need to
set visualbell                               " stop the annoying beeping


" }}}
" ADDITIONAL NVIM SETTING {{{

" Go to the last cursor location when a file is opened
au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
      \ execute("normal `\"") |
  \ endif

" Forcing vimdiff to wrap lines
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" Mapping jk to get out of insert, visual and terminal mode
inoremap jk <Esc>
inoremap <esc> <nop>
vnoremap jk <Esc>
vnoremap <esc> <nop>
tnoremap jk <C-\><C-n>

" " Mapping to close brackets
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>

" Disable Arrow keys in nomal, visual, operator-pending and insert mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Mapping g-[hjkl] to select split in normal mode
nmap <silent> gk :wincmd k<CR>
nmap <silent> gj :wincmd j<CR>
nmap <silent> gh :wincmd h<CR>
nmap <silent> gl :wincmd l<CR>

" }}}
" COLORSCHEME {{{

" Select palette and create colors
so ~/.config/nvim/init-select-pal.vim

" Nvim terminal colors
let g:terminal_color_1 = g:COLOR_02
let g:terminal_color_2 = g:COLOR_03
let g:terminal_color_3 = g:COLOR_04
let g:terminal_color_4 = g:COLOR_05
let g:terminal_color_5 = g:COLOR_06
let g:terminal_color_6 = g:COLOR_07
let g:terminal_color_7 = g:COLOR_08
let g:terminal_color_8 = g:COLOR_09
let g:terminal_color_9 = g:COLOR_10
let g:terminal_color_10 = g:COLOR_11
let g:terminal_color_11 = g:COLOR_12
let g:terminal_color_12 = g:COLOR_13
let g:terminal_color_13 = g:COLOR_14
let g:terminal_color_14 = g:COLOR_15
let g:terminal_color_15 = g:COLOR_16

" }}}
" FOLDING {{{

" Custom fold text
function! MyFoldText() " {{{
  let line = getline(v:foldstart)
  let nucolwidth = &fdc + &number * &numberwidth
   " if g:gitgutter_enabled
   "   let wider = 2
   " else
   "   let wider = 0
   " endif
  let wider = 2

  let windowwidth = winwidth(0) - nucolwidth - 12 - wider
  let foldedlinecount = v:foldend - v:foldstart

  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . ' ' . repeat(" ",fillcharcount) . '  ➜ ' . foldedlinecount . ' lines ' . '✤ '
endfunction " }}}

" Folding setting
set foldmethod=marker                        " marker to fold
set foldtext=MyFoldText()                    " custom fold text
set foldlevel=1                              " fold always
set foldcolumn=2                             " fold column
hi! link FoldColumn Statement                " fold column color

" }}}
" IDE: LIGHTLINE PLUGIN STATUS AND TAB LINES {{{

" Lightline custom functions

function! MyFiletype() " {{{
  " return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' : 'no ft') : ''
endfunction " }}}
function! MyFiletypeIcon(n) " {{{
  return winwidth(0) > 70 ? (strlen(&filetype) ?  WebDevIconsGetFileTypeSymbol() : '') : ''
endfunction " }}}
function! MyFileformat() " {{{
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
function! Lightlinegit()
    let l:branch = fugitive#head()
    return l:branch ==# '' ? '' : "\uE0A0" . " " . l:branch
  endfunction " }}}
function! Sy_stats_wrapper() " {{{
  let symbols = ['+', '-', '~']
  let [added, modified, removed] = sy#repo#get_stats()
  let stats = [added, removed, modified]  " reorder
  let hunkline = ''

  for i in range(3)
    if stats[i] > 0
      let hunkline .= printf('%s%s ', symbols[i], stats[i])
    endif
  endfor

  if !empty(hunkline)
    let hunkline = printf(' [%s]', hunkline[:-2])
  endif

  return hunkline
endfunction " }}}

" Lightline format {{{
let g:lightline = {}
let g:lightline.colorscheme = 'yourcolorscheme'
let g:lightline.component = {
      \ 'empty': '',
      \ 'filepath': '%F'}
let g:lightline.component_function = {
      \ 'gitbranch': 'Lightlinegit',
      \ 'gitstatus': 'Sy_stats_wrapper',
      \ 'filetype': 'MyFiletype',
      \ 'fileformat': 'MyFileformat',
      \ }
let g:lightline.tab_component_function = {
      \ 'filetypeicon': 'MyFiletypeIcon',
      \ }
let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ], ['gitbranch', 'gitstatus'],
      \           [ 'readonly', 'filename', 'modified' ] ],
      \ 'right': [ [ 'percent' , 'lineinfo' ],
      \            [ 'fileencoding'],
      \           [ 'filetype'] ] }
let g:lightline.inactive = {
      \ 'left': [ [ 'filepath' ] ],
      \ 'right': [ ['empty'] ] }
let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [ 'close' ] ] }
let g:lightline.tab = {
      \ 'active': [ 'tabnum', 'filename', 'filetypeicon', 'modified' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ }
let g:lightline.separator = { 'left': "\ue0b0", 'right': '' }
let g:lightline.subseparator = { 'left': '|', 'right': '' }
" }}}

" Lightline type: 1, 2 or 3 {{{
if g:colors_name == 'crunchbang' || g:colors_name == 'onehalfdark' ||
      \ g:colors_name == 'base16-flat' || g:colors_name == 'base16-phd'
  let s:lightline_type = 3
elseif g:colors_name == 'monokai' || g:colors_name == 'material-theme' ||
      \ g:colors_name == 'dracula' || g:colors_name == 'deus' ||
      \ g:colors_name == 'base16-default-dark' || g:colors_name == 'challenger_deep'
  let s:lightline_type = 2
else
  let s:lightline_type = 1
endif
" }}}

" Lightline default colors: soft, visual, insert, inactive {{{
let s:fg_soft     = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')), "NONE" ]
let s:bg_soft     = [ tolower(synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'gui')), "NONE"]
let s:bg_visual   = [ tolower(synIDattr(synIDtrans(hlID('Identifier')), 'fg', 'gui')), "NONE"]
let s:bg_insert   = [ tolower(synIDattr(synIDtrans(hlID('Define')), 'fg', 'gui')), "NONE"]
let s:fg_inactive = [ tolower(synIDattr(synIDtrans(hlID('LineNr')), 'fg', 'gui')), "NONE"]
" }}}

" Lightline default colors: focus, hard {{{
if s:lightline_type == 1     " bg: normal fg - linenr fg - cursorline bg
  let s:fg_focus = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')), "NONE" ]
  let s:bg_focus = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')), "NONE" ]
  let s:fg_hard  = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')), "NONE" ]
  let s:bg_hard  = [ tolower(synIDattr(synIDtrans(hlID('LineNr')), 'fg', 'gui')), "NONE"]
elseif s:lightline_type == 2 " bg: linenr fg - normal fg - cursorline bg
  let s:fg_focus = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')), "NONE" ]
  let s:bg_focus = [ tolower(synIDattr(synIDtrans(hlID('LineNr')), 'fg', 'gui')), "NONE"]
  let s:fg_hard  = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')), "NONE" ]
  let s:bg_hard  = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')), "NONE" ]
elseif s:lightline_type == 3 " bg: linenr fg - normal fg - cursorline bg
  let s:fg_focus = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')), "NONE" ]
  let s:bg_focus = [ tolower(synIDattr(synIDtrans(hlID('LineNr')), 'fg', 'gui')), "NONE"]
  let s:fg_hard  = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')), "NONE" ]
  let s:bg_hard  = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')), "NONE" ]
endif
" }}}

" Lightline custom colors per palette {{{
if g:colors_name      == 'gruvbox'
  let s:bg_focus      = [ '#a89984', 'NONE' ]
  let s:fg_hard       = [ '#a89984', 'NONE' ]
  let s:bg_hard       = [ '#504945', 'NONE' ]
  let s:fg_soft       = [ '#a89984', 'NONE' ]
elseif g:colors_name  == 'nord'
  let s:fg_focus      = [ '#eCEFF4', 'NONE' ]
  let s:bg_focus      = [ '#5E81AC', 'NONE' ]
  let s:bg_insert     = [ '#BF616A', 'NONE' ]
  let s:bg_visual     = [ '#d08770', 'NONE' ]
  let s:fg_inactive   = [ '#79808F', 'NONE' ]
elseif g:colors_name  == 'material-theme'
  let s:fg_hard       = [ '#cDD3DE', 'NONE' ]
  let s:bg_hard       = [ '#4C566A', 'NONE' ]
  let s:fg_soft       = [ '#cDD3DE', 'NONE' ]
elseif g:colors_name  == 'dracula'
  let s:fg_hard       = [ '#abb2bf', 'NONE' ]
  let s:bg_hard       = [ '#333333', 'NONE' ]
  let s:fg_soft       = [ '#abb2bf', 'NONE' ]
  let s:bg_insert     = [ '#bd93f9', 'NONE' ]
  let s:bg_visual     = [ '#ff79c6', 'NONE' ]
elseif g:colors_name  == 'space-vim-dark'
  let s:fg_focus      = [ '#292b2e', 'NONE' ]
  let s:bg_focus      = [ '#d4b261', 'NONE' ]
  let s:bg_insert     = [ '#b4d1b6', 'NONE' ]
  let s:bg_visual     = [ '#FF73B9', 'NONE' ]
  let s:fg_inactive   = [ '#2aa1ae', 'NONE' ]
elseif g:colors_name  == 'deus'
  let s:bg_hard       = [ '#3A3B3F', 'NONE' ]
elseif g:colors_name  == 'challenger_deep'
  let s:bg_hard       = [ '#2A2942', 'NONE' ]
  let s:bg_insert     = [ '#65b2ff', 'NONE' ]
elseif g:colors_name  == 'monokai'
  let s:bg_hard       = [ '#5C5C53', 'NONE' ]
elseif g:colors_name  == 'NeoSolarized'
  let s:bg_hard       = [ '#30555E', 'NONE' ]
elseif g:colors_name  == 'OceanicNext'
  let s:bg_hard       = [ '#575F68', "NONE" ]
elseif g:colors_name  == 'neodark'
  let s:bg_hard       = [ '#4D4D4D', "NONE" ]
elseif g:colors_name  == 'tender'
  let s:bg_focus      = [ '#b3deef', 'NONE' ]
  let s:bg_visual     = [ '#eeeeee', 'NONE' ]
  let s:fg_inactive   = [ '#767676', 'NONE' ]
elseif g:colors_name  == 'synthwave'
  let s:fg_focus      = [ '#bfb8cc', 'NONE' ]
  let s:bg_focus      = [ '#736075', 'NONE' ]
elseif g:colors_name  == 'alduin'
  let s:bg_focus      = [ '#87875f', 'NONE' ]
elseif g:colors_name  == 'deep-space'
  let s:fg_inactive   = [ '#47505F', 'NONE' ]
elseif g:colors_name  == 'base16-atlas'
  let s:bg_hard       = [ '#2B5968', 'NONE' ]
endif
" }}}

" Define colorscheme {{{
let s:p = {'normal': {}, 'tabline': {}, 'insert':{}, 'visual':{}, 'inactive':{}}
let s:p.normal.left = [
      \ [ s:fg_focus, s:bg_focus, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ],
      \]
let s:p.normal.middle = [
      \ [ s:fg_soft, s:bg_soft ] ]
let s:p.normal.right = [
      \ [ s:fg_focus, s:bg_focus, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ],
      \ [ s:fg_soft, s:bg_soft ] ]
let s:p.tabline.left = [ [ s:fg_hard, s:bg_hard ] ]
let s:p.tabline.tabsel = [ [ s:fg_focus, s:bg_focus ] ]
let s:p.tabline.middle = [ [ s:fg_soft, s:bg_soft ] ]
let s:p.insert.left = [
      \ [ s:fg_focus, s:bg_insert, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ]
      \ ]
let s:p.insert.right = [
      \ [ s:fg_focus, s:bg_insert, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ]
      \ ]
let s:p.visual.left = [
      \ [ s:fg_focus, s:bg_visual, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ]
      \ ]
let s:p.visual.right = [
      \ [ s:fg_focus, s:bg_visual, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ]
      \ ]
let s:p.inactive.left = [[ s:fg_inactive, s:bg_soft, 'italic' ], [ s:fg_inactive, s:bg_soft ]]
let s:p.inactive.right = [ [ s:fg_inactive, s:bg_soft], [ s:fg_inactive, s:bg_soft ] ]
let s:p.inactive.middle = [ [ s:fg_inactive, s:bg_soft ] ]
" }}}

" Lightline assign colorscheme
let g:lightline#colorscheme#yourcolorscheme#palette = lightline#colorscheme#flatten(s:p)

" }}}
" IDE: TMUXLINE {{{

" Tmuxline presets
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I:#W'],
      \'cwin' : ['#I:#W ✔'],
      \'x'    : '',
      \'y'    : '',
      \'z'    : ['\uF080' . ' '],
      \'options' : {'status-justify' : 'left'}}
let g:tmuxline_theme = {
      \'a'    : [ s:fg_focus[0], s:bg_focus[0], 'bold'],
      \'b'    : [ s:fg_soft[0], s:bg_soft[0] ],
      \'bg'   : [ s:fg_soft[0], s:bg_soft[0] ],
      \'c'    : [ s:fg_soft[0], s:bg_soft[0] ],
      \'win'  : [ s:fg_soft[0], s:bg_soft[0] ],
      \'cwin' : [ s:fg_hard[0], s:bg_hard[0] ],
      \'x'   : [ s:fg_soft[0], s:bg_soft[0] ],
      \'y'   : [ s:fg_hard[0], s:bg_hard[0] ],
      \'z'    : [ s:fg_focus[0], s:bg_focus[0], 'bold'] }

" Active tmuxline
if exists('$TMUX')
    autocmd VimEnter * call tmuxline#set_statusline()
endif

" }}}
" IDE: NERDTREE PLUGIN {{{

set splitright
map <leader>n :NERDTreeToggle<CR>
let NERDTreeMapOpenSplit='v'
let NERDTreeMapOpenVSplit=';'
let NERDTreeMapOpenInTab='T'
let NERDTreeMapOpenInTabSilent='t'
let NERDTreeWinSize = 32
let NERDTreeIgnore = ['\.aux$', '\.fdb_latexmk$', '\.fls', '\.log', '\.out',
      \ '\.synctex.gz']

" }}}
" IDE: DEOPLETE PLUGIN {{{

let g:deoplete#enable_at_startup = 1

" }}}
" IDE: NEOSNIPPETS PLUGIN {{{

let g:neosnippet#disable_runtime_snippets = {
		\   '_' : 1,
		\ }
let g:neosnippet#snippets_directory=['~/.local/share/nvim/plugged/vim-snippets/snippets','~/Documents/Repositories/dotfiles-ubuntu-18/neosnippets']

inoremap <silent><expr><C-J> "\<C-N>"
inoremap <silent><expr><C-K> "\<C-P>"
imap <C-L>     <Plug>(neosnippet_expand_or_jump)
smap <C-L>     <Plug>(neosnippet_expand_or_jump)
xmap <C-L>     <Plug>(neosnippet_expand_target)

" }}}
" IDE: TAGS {{{

let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

" }}}
" IDE: VIMCMDLINE {{{

let cmdline_app           = {}
let cmdline_app["python"] = "ipython"
let cmdline_in_buffer          = 0      " Start the interpreter in a Neovim buffer

" }}}
" IDE: LANGUAGE SERVER PROTOCOL {{{

set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'cpp': ['clangd'],
    \ 'python': ['pyls'],
    \ 'r': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
    \ 'rmd': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
    \ }
let g:LanguageClient_autoStart = 1

" " }}}
" VISUAL: DEVICONS {{{

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 16
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = 'ℝ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['stan'] = 'Ⓢ'

" }}}
" VISUAL: INDENTLINE PLUGIN {{{
"
" exclude tex files
let g:indentLine_fileTypeExclude = ['tex', 'markdown', 'pandoc']

" }}}
" EXPLORE: NERDTREE {{{

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" }}}
" PROGRAMS: R {{{

" R configuration
let R_source = '~/.local/share/nvim/plugged/Nvim-R/R/tmux_split.vim'
let R_args = ['--no-save', '--quiet']                       " R arguments
let R_tmux_title = "automatic"                              " tmux window names
let R_objbr_place = "script,left"                           " object split position
" let R_objbr_place = "script,right"                          " object split position
let R_objbr_w = 32                                          " object split with
let R_objbr_opendf = 0                                      " close data.frames
let R_assign = 2                                            " __ as <-
let R_rconsole_height = 5                                  " console height
let R_args_in_stline = 1                                    " arguments on status line
let R_openhtml = 1                                          " open in html
let R_pdfviewer = "evince"                                  " pdf viewer
let R_editor_w = 90                                         " editor split width
let R_editor_h = 60                                         " help split width
" let r_syntax_folding = 1

" Rmd configuration
let rmd_syn_hl_chunk = 1
let g:rmd_syn_langs = ["r", "python", "c"] " engines for chunks
let g:pandoc#syntax#codeblocks#embeds#langs = ["cpp", "r", "bash=sh", "python"]
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#syntax#conceal#use = 1 " pretty highlight
let g:pandoc#hypertext#use_default_mappings = 0
let g:pandoc#keyboard#use_default_mappings = 0 " remove all pandoc mappings

" }}}
" PROGRAMS: LATEX {{{
let g:airline#extensions#vimtex#enabled = 0 " unable extension because is failing
" Recoganize tex as latex
let g:tex_flavor = 'tex'
" let g:vimtex_toc_number_width = -1
let g:vimtex_toc_secnumdepth=0
" let g:vimtex_index_resize=1
let g:vimtex_index_split_width=40
let g:vimtex_index_split_pos = "vertical botright"
let g:tex_conceal="abdmg"
" let g:tex_conceal=""
" let g:tex_fast= "bcmprsSvV"
" let g:tex_fast= "b"
" let g:vimtex_complete_recursive_bib = 1
" Partial solution to fix_paths
let g:vimtex_quickfix_latexlog = {'fix_paths' : 0}
let vimtex_fold_enabled = 1
" work with okular
" let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_enabled = 0
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
" }}}
" PROGRAMS: VIMWIKI {{{

au FileType vimwiki set syntax=pandoc
" Vimkiwi setup
let g:vimwiki_list = [{'path':'$HOME/Documents/Nvim/Vimwiki',
                     \ 'syntax': 'markdown', 'ext': '.wiki'}]
                     " \ 'syntax': 'markdown', 'ext': '.wiki'}]
                     " \ {'path':'$HOME/Documents/Repositories/MyWebPage/_drafts',
                     " \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_table_mappings = 0
let $blogdir = '/home/chaconmo/Documents/Repositories/erickchacon/'
" let g:vimwiki_folding='list' # not very well implemented
" let g:vimwiki_folding='expr'
" let g:vimwiki_global_ext = 0 " do not override markdown outside vimwiki folder.
" let g:vimwiki_char_bold = '**'
" let g:vimwiki_char_italic = '_'
" inoremap <F13> <Esc>:VimwikiReturn 1 5<CR>
" nmap <Leader>w <Plug>VimwikiIndex
" nmap <Leader>wf <Plug>VimwikiFollowLink
" nmap <Leader>wn <Plug>VimwikiNextLink
" imap <Leader>wn <Plug>vimwiki_i_<CR>
" nmap <Leader>eq <plug>(vimtex-a$)
" inoremap <Leader> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#close_popup() . "\<CR>"
" endfunction
" map <buffer> <C-G> :s/^/\/\//<Esc><Esc>

" Spelling
" set spell spelllang=en_us
" set spell
hi! link VimwikiHeader1 WarningMsg
hi! link VimwikiHeader2 PreProc
hi! link VimwikiHeader3 Boolean
hi! link VimwikiHeader4 Type
hi! link VimwikiHeader5 Identifier
hi! link VimwikiHeader6 String
" hi! link pandocSetexHeader WarningMsg
" hi! link Title WarningMsg
" hi! link Title Define
" hi Title gui=bold

" hi! link VimwikiHeader1 GruvboxRedBold
" hi! link VimwikiHeader2 GruvboxAquaBold
" hi! link VimwikiHeader3 GruvboxPurpleBold
" hi! link VimwikiHeader4 GruvboxYellowBold
" hi! link VimwikiHeader5 GruvboxBlueBold
" hi! link VimwikiHeader6 GruvboxGreenBold
" }}}
" PROGRAMS: MARKDOWN {{{
au BufNewFile,BufRead *.Rmarkdown set filetype=rmd
" let g:markdown_composer_browser = "firefox"
let g:markdown_composer_autostart = 0

" markdown plasticboy
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
" }}}
" PROGRAMS: HTML {{{
" html yaml syntax highlighting
" autocmd BufNewFile,BufRead *.html syntax match Comment /\%^---\_.\{-}---$/
" }}}
" PROGRAMS: CPP {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1
" }}}
" PROGRAMS: PYTHON {{{
let python_highlight_all = 1
" }}}
" PROGRAMS: JULIA {{{
let g:default_julia_version = "current"
" }}}
