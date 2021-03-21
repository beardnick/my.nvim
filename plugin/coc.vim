if ! exists("g:did_coc_loaded")
    finish
endif

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')


command! Refactor call CocActionAsync('refactor')


" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

 "use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


autocmd CursorHold * silent call CocActionAsync('highlight')


inoremap <silent><expr> <C-n>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


nnoremap <silent><LEADER>ft :<C-U>CocCommand explorer<CR>
