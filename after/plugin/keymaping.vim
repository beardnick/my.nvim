  let cmd = 'ag'
  let opt = 
      \ [
      \ '-i', '--nocolor', '--filename', '--noheading', '--column', '--hidden', '--ignore',
      \ '.hg', '--ignore', '.svn', '--ignore', '.git', '--ignore', '.bzr',
      \ ]
  let ropt = []
  let ignore = ['-i']
  let smart = ['-S']
  let expr = []

" 搜索
"nnoremap <C-F> :<C-U> call SpaceVim#plugins#flygrep#open({ 'input' : expand('<cword>'), 'cmd' : cmd, 'opt' : opt, 'ropt' : ropt, 'ignore_case' : ignore, 'smart_case' : smart, 'expr_opt' : expr })<CR>

nnoremap <expr> <LEADER>/ ":<C-U>Lines " . expand("<cword>") . "<CR>"
nnoremap <expr> <C-F> ":<C-U>Rg " . expand("<cword>") . "<CR>"
"nnoremap  <C-F> :<C-U>Rg<CR>
nnoremap <C-H> :<C-U>Helptags<CR>
nnoremap <LEADER><LEADER> :<C-U>Commands<CR><C-P>
nnoremap <LEADER>rl:<C-U>Registers<CR>
" 使用fzfmru来模拟如vscode go to file 那样的文件模糊查找行为
nnoremap <C-P> :<C-U>FilesMru --tiebreak=index<CR>

" 语法
nnoremap K  :<C-U>call autocomplete#ShowDocumentation()<CR>
" Remap keys for gotos
" 先禁用vim-go的跳转定义插件
let g:go_def_mapping_enabled = 0
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 界面
nnoremap <C-L> :<C-U>nohlsearch<CR>
noremap <expr> <M-b> ":<C-U>call ui#WindLineLeft(" .screencol() . ")\n"
noremap <expr> <M-f> ":<C-U>call ui#WindLineRight(" .screencol() . ")\n"
noremap <expr> <M-UP> ":<C-U>call ui#WindLineUp(" .screenrow() . ")\n"
noremap <expr> <M-Down> ":<C-U>call ui#WindLineDown(" .screenrow() . ")\n"
nnoremap <LEADER>t :<C-U>call ui#TagbarInit()<CR>
" 简单的文件浏览器使用
nnoremap <LEADER>ft :<C-U>call ui#VimfilerInit()<CR>

" 跳转
noremap <SPACE>w <C-W>
inoremap jk <ESC>
inoremap jj <ESC>
inoremap kk <ESC>
 "编辑配置文件
"nnoremap <LEADER>ev :vsplit ~/my.nvim/init.vim<CR>
 "加载配置文件
"nnoremap <LEADER>sv :source ~/my.nvim/init.vim<CR>
nmap gs <Plug>Sneak_S

" 编辑
vmap <LEADER>s <Plug>VSurround
nmap <LEADER>s <Plug>Ysurround
nnoremap <C-J> :<C-U>Snippets<CR>

 "快速注释
nnoremap <LEADER>; :<C-U>call NERDComment("n", "Toggle")<CR>
vnoremap <LEADER>; :call NERDComment("n", "Toggle")<CR>gv
" 复制粘贴
nnoremap <Leader>yy viw"+y
nnoremap <Leader>ya viw"ay
nnoremap <Leader>yb viw"by
nnoremap <Leader>yc viw"cy

vnoremap <Leader>yy "+y
vnoremap <Leader>ya "ay
vnoremap <Leader>yb "by
vnoremap <Leader>yc "cy

nnoremap <Leader>pp viw"+p
nnoremap <Leader>pa viw"ap
nnoremap <Leader>pb viw"bp
nnoremap <Leader>pc viw"cp

vnoremap <Leader>pp "+p
vnoremap <Leader>pa "ap
vnoremap <Leader>pb "bp
vnoremap <Leader>pc "cp

vnoremap <Leader>rr "+p
vnoremap <Leader>ra "ap
vnoremap <Leader>rb "bp
vnoremap <Leader>rc "cp

nnoremap <Leader>rr viw"+p
nnoremap <Leader>ra viw"ap
nnoremap <Leader>rb viw"bp
nnoremap <Leader>rc viw"cp
nnoremap ]] :<C-U>call NextUncommentedBlock(1)<CR>
nnoremap [[ :<C-U>call NextUncommentedBlock(-1)<CR>

"FZF Command History
"function! s:mycommand_sink(cmd)
    "let cmd = substitute(a:cmd, '\d..', '', 'g') 
    "execute cmd
"endfunction

"function! s:commands(bang)
  "redir => history
  "silent history
  "redir END
  "let list = split(history, '\n')
    "call fzf#run({
                "\ 'source':  reverse(extend(list[0:0], map(list[2:], 's:format_cmd(v:val)'))),
                "\ 'sink':    function('s:mycommand_sink'),
                "\ 'options': '--ansi -x --prompt "Commands> " ',
                "\ 'window': 'aboveleft 20new'}, a:bang)
"endfunction

"command! -bang Cmds call s:commands(<bang>0)


function! NextUncommentedBlock(direction) abort
    let s:next_match = line('.')
    let s:last_match = s:next_match - a:direction
    while s:last_match == s:next_match - a:direction
        "echom "line:" s:next_match
        let s:last_match = s:next_match
        " 注意使用单引号和双引号效果是不同的
        if a:direction == 1 
            let s:next_match = search('^\s*[^ #]', 'e')
        else
            let s:next_match = search('^\s*[^ #]', 'be')
        endif
    endwhile
    call cursor(s:next_match, col('.'))
endfunction
