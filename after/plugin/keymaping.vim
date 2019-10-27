" 搜索
nnoremap <C-F> :<C-U>call SpaceVim#plugins#flygrep#open({'input' : expand("<cword>")})<CR>
nnoremap <C-H> :<C-U>Helptags<CR>
nnoremap <LEADER><LEADER> :<C-U>Commands<CR>
nnoremap <C-P> :<C-U>Registers<CR>
" 使用fzfmru来模拟如vscode go to file 那样的文件模糊查找行为
nnoremap <C-E> :<C-U>FilesMru --tiebreak=index<CR>

" 语法
nnoremap K  :<C-U>call autocomplete#ShowDocumentation()<CR>
" Remap keys for gotos
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
" 编辑配置文件
nnoremap <LEADER>ev :vsplit ~/nvim.my/init.vim<CR>
" 加载配置文件
nnoremap <LEADER>sv :source ~/nvim.my/init.vim<CR>
nmap gs <Plug>Sneak_S

" 编辑
vmap <LEADER>s <Plug>VSurround
nmap <LEADER>s <Plug>Ysurround
 "快速注释
nnoremap <LEADER>; :<C-U>call NERDComment("n", "Toggle")<CR>
vnoremap <LEADER>; :call NERDComment("n", "Toggle")<CR>gv
nnoremap <LEADER>/ :<C-U>call SpaceVim#plugins#flygrep#open({'input' : expand("<cword>"), 'files': bufname("%")})<CR>
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
