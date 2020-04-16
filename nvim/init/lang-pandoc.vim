
" PROGRAMS: MARKDOWN {{{
au BufNewFile,BufRead *.Rmarkdown set filetype=rmd
" let g:markdown_composer_browser = "firefox"
" let g:markdown_composer_autostart = 0

let g:pandoc#syntax#conceal#use = 0 " pretty highlight
let g:pandoc#syntax#conceal#urls = 0
" let g:pandoc#hypertext#use_default_mappings = 0
" let g:pandoc#keyboard#use_default_mappings = 0 " remove all pandoc mappings
" let g:pandoc#keyboard#enabled_submodules = []
" " let g:pandoc#hypertext#open_editable_alternates = 0
" "
" " let g:pandoc#keyboard#enabled_submodules = ["lists", "references", "styles", "sections", "links", "checkboxes"]
" " let g:pandoc#keyboard#enabled_submodules = ["styles"]
"
let g:pandoc#formatting#mode = "h" " hard and Automatic (do not break titles)
let g:pandoc#formatting#textwidth = 85
set list
set listchars=nbsp:.

let g:pandoc#formatting#extra_equalprg = "" " avoid to create reference links
" non breaking space: Ctrl-v x a 0
