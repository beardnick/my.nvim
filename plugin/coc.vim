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

nnoremap <silent>K  :<C-U> call CocAction('doHover')<CR>
vnoremap <silent>K  :<C-U> call CocAction('doHover')<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gu <Plug>(coc-references)

nmap <silent> ]c <Plug>(coc-git-nextchunk)
nmap <silent> [c <Plug>(coc-git-prevchunk)
nmap <silent> ]e <Plug>(coc-diagnostic-next-error)
nmap <silent> [e <Plug>(coc-diagnostic-previous-error)

nmap <silent> <LEADER>lc <Plug>(coc-fix-current)
xmap <silent> <LEADER>lc <Plug>(coc-fix-current)


nmap <Leader>ca <Plug>(coc-calc-result-append)
" replace result on current expression
nmap <Leader>cr <Plug>(coc-calc-result-replace)
nmap <Leader>cq <Plug>(coc-fix-current)
"nmap <leader>ca  <Plug>(coc-codeaction-selected)
"xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  :<C-U>CocCommand actions.open<CR>
xmap <leader>ca  :<C-U>CocCommand actions.open<CR>
nmap <leader>co  :<C-U>call CocAction('runCommand', 'editor.action.organizeImport')<CR>


nmap <silent> <M-CR> :<C-U>CocCommand actions.open<CR>
xmap <silent> <M-CR> :<C-U>CocCommand actions.open<CR>

nmap <silent> gl  <Plug>(coc-openlink)

nnoremap <Leader>sf :<C-U>CocList floaterm<CR>
nnoremap <silent> <Leader>se  :<C-u>CocCommand fzf-preview.CocDiagnostics<CR>
nnoremap <silent> <Leader>sc  :<C-u>CocFzfList commands<CR>

nmap <M-k> <Plug>(coc-translator-p)
vmap <M-k> <Plug>(coc-translator-pv)


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
