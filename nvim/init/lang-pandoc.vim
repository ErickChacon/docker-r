" syntax
let g:pandoc#syntax#conceal#use = 1
let g:pandoc#syntax#conceal#urls = 0

" enable and disable modules
let g:pandoc#modules#disabled = [ "keyboard", "hypertext"]

" formatting (s: soft, h: hard, a: autoformat, A: smart a)
let g:pandoc#formatting#mode = "h"
let g:pandoc#formatting#textwidth = 80

" hypertext
let g:pandoc#hypertext#use_default_mappings = 0
let g:pandoc#hypertext#open_editable_alternates = 0

" keyboard mappings
let g:pandoc#keyboard#enabled_submodules = []
let g:pandoc#keyboard#use_default_mappings = 0
