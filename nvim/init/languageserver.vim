
" set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'cpp': ['clangd'],
    \ 'python': ['pyls'],
    \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
    \ 'rmd': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
    \ }

let g:LanguageClient_autoStart = 0
