
function Organize()
    :e ~/Documents/Organizer/index.md
endfunction

function Gofile()

    " obtain path to go
    let path_child = expand('<cfile>')
    if path_child =~ '^[0-9A-Za-z]'
        let folder = expand('%:p:h')
        let path_child = join([folder, path_child], '/')
    endif

    " create folder if necessary
    let folder_child = fnamemodify(path_child, ':p:h')
    echo folder_child
    if !isdirectory(folder_child)
        if input("Create directory: ".folder_child."\n [y]es/[N]o? ") !~? '^y'
            return 0
        endif
        call mkdir(folder_child, "p")
    endif

    " edit file
    :execute 'edit' path_child

endfunction

nmap <silent> <leader>www :call Organize() <CR>
nmap <silent> gff :call Gofile() <CR>
" Ctrl-O Ctrl-I: navigate between jumps
