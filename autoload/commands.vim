function! commands#UninstallPackages() abort
	call map(dein#check_clean(), "delete(v:val, 'rf')")
	call dein#recache_runtimepath()
endfunction


function! commands#GetRegisters() abort
  redir => l:regs
  silent registers
  redir END

  return split(l:regs, '\n')[1:]
endfunction

function! commands#Registers(...) abort
  let l:opts = {
        \ 'source': commands#GetRegisters(),
        \ 'sink': {x -> feedkeys(matchstr(x, '\v^\S+\ze.*') . (a:1 ? 'P' : 'p'), 'x')},
        \ 'options': '--prompt="Reg> "'
        \ }
  call fzf#run(fzf#wrap(l:opts))
endfunction



function! commands#CodeRuner() abort
    let s:file_type = &filetype
    let s:file = expand("%:p")
    "echom "filetype:" s:file_type
    "echom "file:" s:file
    let s:runner = {
    \ 'python':'python',
    \ 'java':'java',
    \ 'go':'go run'
    \}
    exe "VimuxRunCommand \'" . s:runner[s:file_type] . " " . s:file " \' "
endfunction
