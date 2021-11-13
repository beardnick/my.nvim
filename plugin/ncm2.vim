if !myplug#Loaded('ncm2')
    finish
endif

set shortmess+=c

inoremap <c-c> <ESC>


if myplug#Loaded('ncm2-ultisnips')
    inoremap <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("", 'n'): "\<CR>")
else
    inoremap <expr> <CR> (pumvisible() ? "\<C-y>" : "\<CR>")
end

" c-j c-k for moving in snippet
" let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })

let g:ncm2#matcher='substrfuzzy'


