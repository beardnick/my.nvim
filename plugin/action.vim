" todo fix this actions
            "\ "lsp":[
            "\ ["code action","<Plug>(coc-codeaction-selected)w"],
            "\],

            "\"text":[
            "\ ["flip arguments","call FlipArgs()"],
            "\],

let g:action_map = { 
            \ "go":[
            \ ["Fill Struct","GoFillStruct"],
            \]
            \}


function! OpenActions() abort
    let keys = [&filetype,'lsp','text']
    let content =  []
    for k in keys
        if has_key(g:action_map, k)
            let content =  g:action_map[k]
        endif
    endfor
    let opts = {'index':g:quickui#context#cursor}
    call quickui#context#open(content, opts)
endfunction

inoremap <silent> <M-CR> <ESC>:<C-U>call OpenActions()<CR>
