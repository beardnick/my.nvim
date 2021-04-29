if type(g:mynvim_colorscheme) == type({})
    execute 'colorscheme' g:mynvim_colorscheme['color']
else
    execute 'colorscheme' g:mynvim_colorscheme
endif

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

if type(g:mynvim_colorscheme) == type({})
    let g:lightline['colorscheme'] = g:mynvim_colorscheme['status']
else
    let g:lightline['colorscheme'] = g:mynvim_colorscheme
endif

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

highlight default link CocHighlightText  MatchParen
"highlight default link BufTabLineActive TabLineSel
"highlight default link BufTabLineCurrent PmenuSel

" 属性配置
" 启用彩虹括号颜色
let g:rainbow_active = 1
" 启用git符号栏 
let g:gitgutter_enabled = 1


" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" For Vim<8, replace EndOfBuffer by NonText
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

set colorcolumn=80,120
