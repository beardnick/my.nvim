if exists('g:vscode')
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/vscode.vim'
else
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/nvim.vim'
endif
