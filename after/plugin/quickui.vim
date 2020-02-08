function! TermExit(code) abort
    echom "terminal exit code: ". a:code
endfunc

function! TerminalPanel(cmd) abort
    let height = float2nr(&lines - (&lines * 4 / 10))
    let width = float2nr(&columns - (&columns * 1 / 10))
    let opts = {'w':width, 'h':height, 'callback':'TermExit'}
    let opts.title = a:cmd
    call quickui#terminal#open(a:cmd, opts)
endfunction

command! Python call TerminalPanel('ptpython')
command! Tig call TerminalPanel('tig')
command! Redis call TerminalPanel('redis-cli')
command! Lua call TerminalPanel('lua')
