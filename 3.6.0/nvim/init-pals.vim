" Neovim settings
" Language:     Neovim
" Last Change:  12 May 2019
"

" Read plugins
so ~/.config/nvim/plugins.vim

" Allow true colors and read palette name
set termguicolors " true colors
let g:path_palname = $HOME.'/.palette-name.vim' " file to read palette name
let g:scheme_name = substitute(readfile(g:path_palname, '', 1)[0], ".vim$", "", "")

" Select colorscheme
execute 'colorscheme ' . g:scheme_name

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

" Export palette colors
let g:nvim_colors_file = '/tmp/local/.nvim_colors.vim'
" call system('touch ' . g:nvim_colors_file)
call system('mkdir -p "$(dirname ' . g:nvim_colors_file . ')"')
call writefile(g:my_colors, g:nvim_colors_file, 'b')

