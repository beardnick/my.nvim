function! commands#UninstallPackages() abort
	call map(dein#check_clean(), "delete(v:val, 'rf')")
	call dein#recache_runtimepath()
endfunction


"function! commands#GetRegisters() abort
  "redir => l:regs
  "silent registers
  "redir END

  "return split(l:regs, '\n')[1:]
"endfunction

"function! commands#Registers(...) abort
  "let l:opts = {
        "\ 'source': commands#GetRegisters(),
        "\ 'sink': {x -> feedkeys(matchstr(x, '\v^\S+\ze.*') . (a:1 ? 'P' : 'p'), 'x')},
        "\ 'options': '--prompt="Reg> "'
        "\ }
  "call fzf#run(fzf#wrap(l:opts))
"endfunction


function! commands#BufferSplitVertical() abort
    let l:this_buf = bufnr()
    execute 'wincmd k'
    let l:upper_buf = bufnr()
    if l:this_buf !=# l:upper_buf
        execute 'wincmd v'
        if buffer_exists(l:this_buf)
            execute 'buffer ' . l:this_buf
            execute 'wincmd j | q'
        endif
    endif
endfunction
