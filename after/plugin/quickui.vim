function! TermExit(code) abort
    echom "terminal exit code: ". a:code
endfunc

function! TerminalPanel(cmd) abort
    let s:height = float2nr(&lines - (&lines * 4 / 10))
    let s:width = float2nr(&columns - (&columns * 1 / 10))
    let s:opts = {'w':s:width, 'h':s:height, 'callback':'TermExit'}
    let s:opts.title = a:cmd
    call quickui#terminal#open(a:cmd, s:opts)
endfunction

command! Python call TerminalPanel('ptpython')
command! Tig call TerminalPanel('tig')
command! Redis call TerminalPanel('redis-cli')
command! Lua call TerminalPanel('lua')
command! Navi call TerminalPanel('navi')
command! Vifm call TerminalPanel('vifm ' . getcwd())

"function! s:JumpFloaterm() abort
"    if ! exists('g:floaterm.gather')
"        call floaterm#start('toggle')
"        return 0
"    endif
"    let s:buffers = g:floaterm.gather()
"    let s:buffer_dict = {}
"    let s:content = []
"    let s:cnt = 1
"    if len(s:buffers) < 1
"        call floaterm#start('toggle')
"        return 0
"    endif
"    for s:b in s:buffers
"        echo bufname(s:b)
"        "let s:buffer_dict[s:b] = bufname(s:b)
"        call add(s:content, [ '[&'. s:cnt .  ']    ' . s:b . '    ' . bufname(s:b), 'call g:floaterm.jump('. s:b . ')'])
"        let s:cnt = s:cnt + 1
"    endfor
"    let s:height = float2nr(&lines - (&lines * 4 / 10))
"    let s:width = float2nr(&columns - (&columns * 1 / 10))
"    let s:opts = {'w':s:width, 'h':s:height, 'title':'jump to terminal'}
"    echo s:content
"    call quickui#listbox#open(s:content, s:opts)
"endfunction


"function! s:FloatTermType() abort
"    if g:floaterm_type ==# 'normal'
"        let g:floaterm_type = 'floating'
"        let g:floaterm_height = 0.6
"        return 0
"    endif
"    if g:floaterm_type ==# 'floating'
"        let g:floaterm_type = 'normal'
"        let g:floaterm_height = 0.4
"        return 0
"    endif
"endfunction

command! JumpFloaterm call <SID>JumpFloaterm()
command! FloatTermType call <SID>FloatTermType()

