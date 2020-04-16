set splitright
map <leader>n :NERDTreeToggle<CR>
let NERDTreeMapOpenSplit='v'
let NERDTreeMapOpenVSplit=';'
let NERDTreeMapOpenInTab='T'
let NERDTreeMapOpenInTabSilent='t'
let NERDTreeWinSize = 32
let NERDTreeIgnore = ['\.aux$', '\.fdb_latexmk$', '\.fls', '\.log', '\.out',
      \ '\.synctex.gz']

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

