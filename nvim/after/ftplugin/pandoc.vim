" no folding for indices of notes
if expand('%:p:t:r') =~ join(['index', 'README'], '\|')
    setlocal nofoldenable
endif
