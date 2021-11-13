function! action#OpenActions() abort
    let keys = [&filetype,'lsp','text']
    let content =  []
    for k in keys
        if has_key(g:action_map, k)
            let content = content+  g:action_map[k]
        endif
    endfor
    let opts = {'index':g:quickui#context#cursor}
    call quickui#context#open(content, opts)
endfunction
