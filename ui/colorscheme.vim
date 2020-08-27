execute 'colorscheme' g:mynvim_colorscheme

if g:mynvim_colorscheme_backgroud ==# 'auto'
    if str2nr(strftime("%H")) >= 18 || str2nr(strftime("%H")) <= 7 
        set background=dark
    else
        set background=light
    endif
else
    execute 'set background=' . g:mynvim_colorscheme_backgroud
endif


let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'method', 'modified', 'filetype'] ],
      \ 'right':[['line','percent']]
      \ },
      \ 'component_function':{'blame':'LightlineGitBlame'},
      \ }

let g:lightline['colorscheme'] = g:mynvim_colorscheme

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

highlight default link CocHighlightText  MatchParen
"highlight default link BufTabLineActive TabLineSel
"highlight default link BufTabLineCurrent PmenuSel
