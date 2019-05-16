" Neovim settings
" Language:     Neovim
" Last Change:  12 May 2019
"
" PLUGINS {{{

so ~/.config/nvim/plugins.vim

" }}}
" GENERAL SETTING {{{

" MAPPING AND KEYBOARD
let mapleader = "\\"                         " map leader as backslash (default)
let maplocalleader = "\\"                    " map localleader as backslash
set backspace=indent,eol,start               " use backspace to delete in insert mode

" MODIFICATIONS
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

" Mapping to close brackets
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

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

" Allow true colors and read palette name
set termguicolors                                  " true colors
set background=dark                                " dark background
let g:path_palname = $HOME.'/.palette-name.vim'    " file to read palette name
if filereadable(g:path_palname)
  let g:scheme_name = substitute(readfile(g:path_palname, '', 1)[0], ".vim$", "", "")
else
  let g:scheme_name = "gruvbox"
endif


" Set selected colorscheme
if g:scheme_name == "nord"
  colorscheme nord
  let g:nord_italic = 1
  let g:nord_italic_comments = 1
  let g:nord_comment_brightness = 20
  let g:nord_statusline_uniform = 0
  hi Conceal guibg=NONE guifg=#8be9fd gui=none
  hi Folded gui=none guibg=#3b4252 guifg=#7b88a1
  hi Title gui=bold guifg=#d8dee9
elseif g:scheme_name == "gruvbox"
  set background=dark
  let g:gruvbox_italic = 1
  let g:gruvbox_italicize_strings = 1
  let g:gruvbox_italicize_comments = 1
  let g:gruvbox_contrast_dark = "soft"
  let g:gruvbox_contrast_light = "soft"
  colorscheme gruvbox
  hi link Function GruvboxAqua
elseif g:scheme_name == "material-theme"
  colorscheme material-theme
  hi Conceal guibg=NONE guifg=#F77669 gui=none
elseif g:scheme_name == "deus"
  let g:deus_bold=0
  let g:deus_italic=1
  colorscheme deus
  hi texBeginEnd gui=bold,italic guifg=#ffffff
elseif g:scheme_name == "one"
  let g:one_allow_italics = 1
  colorscheme one
  call one#highlight('Folded', '5c6370', '2c323c', 'italic')
  " call one#highlight('Conceal', '5c6370', '2c323c')
  hi Conceal guibg=NONE guifg=#e5c07b gui=none
elseif g:scheme_name == "dracula"
  colorscheme dracula
  hi Conceal guibg=NONE guifg=#8be9fd gui=none
  hi Folded guibg=#333333 guifg=#6272a4 gui=none
elseif g:scheme_name == "neodark"
  let g:neodark#use_256color = 1
  let g:neodark#italics = 1
  colorscheme neodark
  hi SpellBad guibg=none guifg=none gui=underline
  hi Folded guibg=#263a45 guifg=#658595
elseif g:scheme_name == "space-vim-dark"
  colorscheme space-vim-dark
  hi Conceal guibg=none guifg=#2aa1ae
  hi SpellBad guibg=none guifg=none gui=underline
  hi Function gui=none
  hi Folded gui=none
  hi Comment gui=italic guifg=#2A6B74
else
  execute 'colorscheme ' . g:scheme_name
" elseif g:random_number == 9
  " colorscheme challenger_deep
  " hi Conceal guibg=none guifg=#ff5458
  " hi Folded gui=none guibg=#100e23 guifg=#767676
  " hi SpellBad guibg=none guifg=none gui=underline
endif

" Create palette colors
let g:nvim_background = synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')
let g:nvim_foreground = synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')
let g:COLOR_01 = synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui')
let g:COLOR_02 = synIDattr(synIDtrans(hlID('String')), 'fg', 'gui')
let g:COLOR_03 = synIDattr(synIDtrans(hlID('Identifier')), 'fg', 'gui') " Precision
let g:COLOR_04 = synIDattr(synIDtrans(hlID('Identifier')), 'fg', 'gui')
let g:COLOR_05 = synIDattr(synIDtrans(hlID('Comment')), 'fg', 'gui')
let g:COLOR_06 = synIDattr(synIDtrans(hlID('Identifier')), 'fg', 'gui')
let g:COLOR_07 = synIDattr(synIDtrans(hlID('Function')), 'fg', 'gui')
let g:COLOR_08 = synIDattr(synIDtrans(hlID('Special')), 'fg', 'gui')
let g:COLOR_09 = synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui')
let g:COLOR_10 = synIDattr(synIDtrans(hlID('Statement')), 'fg', 'gui')
let g:COLOR_11 = synIDattr(synIDtrans(hlID('Define')), 'fg', 'gui') " chaconmo
let g:COLOR_12 = synIDattr(synIDtrans(hlID('CursorLineNr')), 'fg', 'gui')
let g:COLOR_13 = synIDattr(synIDtrans(hlID('Number')), 'fg', 'gui')
let g:COLOR_14 = synIDattr(synIDtrans(hlID('String')), 'fg', 'gui')
let g:COLOR_15 = synIDattr(synIDtrans(hlID('Function')), 'fg', 'gui')
let g:COLOR_16 = synIDattr(synIDtrans(hlID('TypeDef')), 'fg', 'gui')
let g:my_colors = [g:nvim_background, g:nvim_foreground, g:COLOR_01, g:COLOR_02, g:COLOR_03,
      \ g:COLOR_04, g:COLOR_05, g:COLOR_06, g:COLOR_07, g:COLOR_08, g:COLOR_09, g:COLOR_10,
      \ g:COLOR_11, g:COLOR_12, g:COLOR_13, g:COLOR_14, g:COLOR_15, g:COLOR_16]

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
   if g:gitgutter_enabled
     let wider = 2
   else
     let wider = 0
   endif

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
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
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

" Lightline format
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

" Lightline colors
let s:fg_focus = [ '#ffffff' , "NONE" ]
let s:bg_focus = ["#665C54", "NONE"]
let s:fg_hard = [ '#dfdbd2', "NONE"]
let s:bg_hard = [ '#332927' , "NONE" ]
let s:fg_soft = [ '#dfdbd2', "NONE"]
let s:bg_soft = [ '#3c3836', "NONE"]
let s:bg_visual = [ '#d08770' , "NONE" ]
let s:bg_insert = [ '#BF616A' , "NONE" ]
let s:fg_inactive = [ '#a89984' , "NONE" ]
let s:none = [ 'NONE' , 'NONE' ]

if g:colors_name == 'gruvbox'
  let s:fg_focus = [ '#282828' , "NONE" ]
  let s:bg_focus = ["#a89984", "NONE"]
  let s:fg_hard = [ '#a89984', "NONE"]
  let s:bg_hard = [ '#504945' , "NONE" ]
  let s:fg_soft = [ '#a89984', "NONE"]
  let s:bg_soft = [ '#3c3836', "NONE"]
  let s:bg_visual = [ '#f79375' , "NONE" ]
  let s:bg_insert = [ '#dfdbd2' , "NONE" ]
  let s:fg_inactive = [ '#a89984' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif

if g:colors_name == 'nord'
  let s:fg_focus = [ '#eCEFF4' , "NONE" ]
  let s:bg_focus = ["#5E81AC", "NONE"]
  let s:fg_hard = [ '#d8DEE9', "NONE"]
  let s:bg_hard = [ '#4C566A' , "NONE" ]
  let s:fg_soft = [ '#d8DEE9', "NONE"]
  let s:bg_soft = [ '#3B4252', "NONE"]
  let s:bg_insert = [ '#BF616A' , "NONE" ]
  let s:bg_visual = [ '#d08770' , "NONE" ]
  let s:fg_inactive = [ '#5E81AC' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif

if g:colors_name == 'material-theme'
  let s:fg_focus = [ '#ffffff' , "NONE" ]
  let s:bg_focus = ["#5C7E8C", "NONE"]
  let s:fg_hard = [ '#cDD3DE', "NONE"]
  let s:bg_hard = [ '#4C566A' , "NONE" ]
  let s:fg_soft = [ '#cDD3DE', "NONE"]
  let s:bg_soft = [ '#37474F', "NONE"]
  let s:bg_insert = [ '#BF616A' , "NONE" ]
  let s:bg_visual = [ '#d08770' , "NONE" ]
  let s:fg_inactive = [ '#7986CB' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif

if g:colors_name == 'deus'
  let s:fg_focus = [ '#ebdbb2' , "NONE" ]
  let s:bg_focus = ["#665c54", "NONE"]
  let s:fg_hard = [ '#ebdbb2', "NONE"]
  let s:bg_hard = [ '#3A3B3F' , "NONE" ]
  let s:fg_soft = [ '#ebdbb2', "NONE"]
  let s:bg_soft = [ '#292f37', "NONE"]
  let s:bg_insert = [ '#BF616A' , "NONE" ]
  let s:bg_visual = [ '#d08770' , "NONE" ]
  let s:fg_inactive = [ '#928374' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif

if g:colors_name == 'one'
  let s:fg_focus = [ '#abb2bf' , "NONE" ]
  let s:bg_focus = ["#4b5263", "NONE"]
  let s:fg_hard = [ '#abb2bf', "NONE"]
  let s:bg_hard = [ '#3b4048' , "NONE" ]
  let s:fg_soft = [ '#abb2bf', "NONE"]
  let s:bg_soft = [ '#2c323c', "NONE"]
  let s:bg_insert = [ '#5E81AC' , "NONE" ]
  let s:bg_visual = [ '#528bff' , "NONE" ]
  let s:fg_inactive = [ '#5c6370' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif

if g:colors_name == 'dracula'
  let s:fg_focus = [ '#f8f8f2' , "NONE" ]
  let s:bg_focus = ["#6272a4 ", "NONE"]
  let s:fg_hard = [ '#f8f8f2', "NONE"]
  let s:bg_hard = [ '#3b4048' , "NONE" ]
  let s:fg_soft = [ '#abb2bf', "NONE"]
  let s:bg_soft = [ '#333333', "NONE"]
  let s:bg_insert = [ '#bd93f9' , "NONE" ]
  let s:bg_visual = [ '#ff79c6' , "NONE" ]
  let s:fg_inactive = [ '#5c6370' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif

if g:colors_name == 'neodark'
  let s:fg_focus    = [ '#1F2F38' , "NONE" ]
  let s:bg_focus    = [ "#AABBC4" , "NONE" ]
  let s:fg_hard     = [ '#AABBC4' , "NONE" ]
  let s:bg_hard     = [ '#475C69' , "NONE" ]
  let s:fg_soft     = [ '#AABBC4' , "NONE" ]
  let s:bg_soft     = [ '#263A45' , "NONE" ]
  let s:bg_insert   = [ '#B888E2' , "NONE" ]
  let s:bg_visual   = [ '#E69CA0' , "NONE" ]
  let s:fg_inactive = [ '#658595' , "NONE" ]
  let s:none        = [ 'NONE'    , 'NONE' ]
endif

if g:colors_name == 'space-vim-dark'
  let s:fg_focus    = [ '#292b2e' , "NONE" ]
  let s:bg_focus    = [ '#d4b261' , "NONE" ]
  let s:fg_hard     = [ '#b2b2b2' , "NONE" ]
  let s:bg_hard     = [ '#3B414E' , "NONE" ]
  let s:fg_soft     = [ '#999999' , "NONE" ]
  let s:bg_soft     = [ '#34323e' , "NONE" ]
  let s:bg_insert   = [ '#b4d1b6' , "NONE" ]
  let s:bg_visual   = [ '#FF73B9' , "NONE" ]
  let s:fg_inactive = [ '#2aa1ae' , "NONE" ]
  let s:none        = [ 'NONE'    , 'NONE' ]
endif

if g:colors_name == 'challenger_deep'
  let s:fg_focus    = [ '#f3f3f3' , "NONE" ]
  let s:bg_focus    = [ '#767676' , "NONE" ]
  let s:fg_hard     = [ '#b2b2b2' , "NONE" ]
  let s:bg_hard     = [ '#2C2A3A' , "NONE" ]
  let s:fg_soft     = [ '#999999' , "NONE" ]
  let s:bg_soft     = [ '#100e23' , "NONE" ]
  let s:bg_insert   = [ '#c991e1' , "NONE" ]
  let s:bg_visual   = [ '#62d196' , "NONE" ]
  let s:fg_inactive = [ '#767676' , "NONE" ]
  let s:none        = [ 'NONE'    , 'NONE' ]
endif

" Define colorscheme
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
let NERDTreeMapOpenInTab='T'
let NERDTreeMapOpenInTabSilent='t'

" }}}
" IDE: DEOPLETE PLUGIN {{{

let g:deoplete#enable_at_startup = 1

" }}}
" IDE: ULTISNIPPETS PLUGIN {{{

let g:UltiSnipsSnippetsDir=$HOME.'/Documents/Repositories/dotfiles-ubuntu-18/UltiSnips' "
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/Documents/Repositories/dotfiles-ubuntu-18/UltiSnips']
let g:UltiSnipsExpandTrigger="nop"
let g:UltiSnipsEditSplit="context"
function! s:expand_snippet_or_key(key) abort
  let g:ulti_expand_or_jump_res = 0
  let snippet = UltiSnips#ExpandSnippetOrJump()
  return (g:ulti_expand_or_jump_res > 0) ? snippet : a:key
endfunction
inoremap <silent> <expr> <CR> pumvisible() ?
      \ "<C-y><C-R>=UltiSnips#ExpandSnippet()<CR>" : "\<CR>"
inoremap <silent> <expr> <TAB> pumvisible() ?
      \ "\<C-n>" : "<C-R>=<SID>expand_snippet_or_key(\"\t\")<CR>"
au FileType vimwiki :UltiSnipsAddFiletypes markdown

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
let R_tmux_title = "automatic"                              " tmux window names
let R_objbr_place = "script,right"                          " object split
let R_assign = 0                                            " remove chunck mapping
let R_rconsole_height = 10                                  " console height
let R_args_in_stline = 1                                    " arguments on status line
let R_openhtml = 1                                          " open in html
let R_pdfviewer = "evince"                                  " pdf viewer
" let r_syntax_folding = 1

" Rmd configuration
let g:rmd_syn_langs = ["r", "python", "c"] " engines for chunks
let g:pandoc#syntax#codeblocks#embeds#langs = ["cpp", "r", "bash=sh", "python"]
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#syntax#conceal#use = 1 " pretty highlight
let g:pandoc#hypertext#use_default_mappings = 0

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
" Latex shortcuts
" nnoremap <localleader>lt :VimtexTocOpen<CR>
nnoremap <localleader>lt :VimtexTocToggle<CR>
nnoremap <localleader>lv :VimtexView<CR>
nnoremap <localleader>ll :VimtexCompile<CR>
nnoremap <localleader>lo :VimtexCompileSS<CR>
nnoremap <localleader>le :VimtexErrors<CR>
nnoremap <localleader>lc :VimtexClean<CR>
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
