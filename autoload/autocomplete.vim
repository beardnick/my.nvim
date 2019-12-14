function! autocomplete#UseKite() abort
    exe 'CocDisable'
    nmap <silent> <buffer> K <Plug>(kite-docs)
endfunction


function! autocomplete#ShowDocumentation()
   if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


function! autocomplete#Definition()
    if ! CocAction('jumpDefinition')
        execute 'normal! \<C-]>'
    endif
endfunction

