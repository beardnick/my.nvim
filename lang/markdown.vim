let g:vim_markdown_math = 1
let g:vim_markdown_toc_autofit = 1

augroup conceal_filetype
    autocmd!
    autocmd FileType markdown,json setlocal concealcursor=c
augroup END


let g:vim_markdown_fenced_languages = [
  \ 'c++=cpp',
  \ 'viml=vim',
  \ 'bash=sh',
  \ 'ini=dosini',
  \ 'js=javascript',
  \ 'json=javascript',
  \ 'jsx=javascriptreact',
  \ 'tsx=typescriptreact',
  \ 'docker=Dockerfile',
  \ 'makefile=make',
  \ 'py=python'
  \ ]


"let g:table_mode_disable_tableize_mappings = 1

"let g:table_mode_disable_mappings = 1

let g:table_mode_map_prefix = '_'

let g:table_mode_always_active = 0
