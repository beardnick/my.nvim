if exists('g:vscode')
    finish
endif

function! s:FloatTermType() abort
    if g:floaterm_type ==# 'normal'
        let g:floaterm_type = 'floating'
        let g:floaterm_height = 0.6
        return 0
    endif
    if g:floaterm_type ==# 'floating'
        let g:floaterm_type = 'normal'
        let g:floaterm_height = 0.4
        return 0
    endif
endfunction


function! FloatTool(cmd) abort
    let bufnr = floaterm#terminal#open(-1, a:cmd, {})
    call floaterm#buflist#add(bufnr)
endfunction

command! Tig call FloatTool('tig')
command! Python call FloatTool('ptpython')
command! Redis call FloatTool('iredis')
command! Lua call FloatTool('lua')
command! Navi call FloatTool('navi')
command! Vifm call FloatTool('vifm ' . getcwd())
command! Ruby call FloatTool('irb')
command! -nargs=1 FloatTool call FloatTool(<f-args>)
