function! FlipArgs() abort
    let line = getline('.')
    let pos = getpos('.')
    let operators = ['(',')','[',']','<','>','{','}']
    let target = ''
    for i in range(pos[2] - 1,strlen(line))
        for o in operators
            if line[i] ==# o
                let target = o
                break
            endif
        endfor
        if target !=# ''
            break
        endif
    endfor
    if target ==# ''
        return
    endif
    echom "vi" . target
    execute "normal! vi" . target
    execute "'<,'>call swap#text('v')"
endfunction


