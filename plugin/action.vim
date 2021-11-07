" todo fix this actions
            "\ "lsp":[
            "\ ["code action","<Plug>(coc-codeaction-selected)w"],
            "\],

            "\"text":[
            "\ ["flip arguments","call text#FlipArgs()"],
            "\],

let g:action_map = { 
            \ "go":[
            \ ["Fill Struct","GoFillStruct"],
            \]
            \}



inoremap <silent> <M-CR> <ESC>:<C-U>call action#OpenActions()<CR>
