command! Clock call <SID>ToggleClock()

let g:coc_clock_enabled=0
function! s:ToggleClock() abort
    if g:coc_clock_enabled
        exe "CocCommand clock.disable"
        let g:coc_clock_enabled=0
    else
        exe "CocCommand clock.enable"
        let g:coc_clock_enabled=1
    endif
endfunction
