let g:floaterm_width = 0.7
let g:floaterm_height = 0.4

let g:floaterm_position = 'top'
"let g:floaterm_position = 'center'
let g:floaterm_keymap_prev   = '<Leader>fp'
let g:floaterm_keymap_next   = '<Leader>fn'
let g:floaterm_keymap_toggle = '<Leader>ff'
                                
function s:floatermSettings()   
    highlight FloatermNF  ctermbg=darkblue
endfunction                     
                                
autocmd FileType floaterm call s:floatermSettings()
