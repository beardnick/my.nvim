if ! exists('g:vscode')

nnoremap <silent><LEADER>/ :<C-U>Lines <C-R><C-W><CR>
nnoremap <silent><C-F> :<C-U>Rg <C-R><C-W><CR>
nnoremap <silent><C-H> :<C-U>Helptags<CR>
nnoremap <silent><LEADER><LEADER> :<C-U>Commands<CR><C-P>

nnoremap <silent><LEADER>rl:<C-U>Registers<CR>

" 语法
" 先禁用vim-go的文档显示
let g:go_doc_keywordprg_enabled = 0

nnoremap <silent>K  :<C-U> call CocAction('doHover')<CR>

" Remap keys for gotos
" 先禁用vim-go的跳转定义插件
let g:go_def_mapping_enabled = 0

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> ]c <Plug>(coc-git-nextchunk)
nmap <silent> [c <Plug>(coc-git-prevchunk)
nmap <silent> ]e <Plug>(coc-diagnostic-next-error)
nmap <silent> [e <Plug>(coc-diagnostic-previous-error)


" 快速修复
"nmap <silent> <M-CR> <Plug>(coc-fix-current)

"nmap <silent> gne <Plug>(coc-diagnostic-next-error)
"nmap <silent> gpe <Plug>(coc-diagnostic-previous-error)
nmap <silent> gl  <Plug>(coc-openlink)
nmap <silent> \ <Plug>(coc-codeaction)
"nmap <silent> <M-l> <Plug>(coc-codelens-action)
"nmap <silent> <M-r> <Plug>(coc-refactor)
"nmap <silent> <M-r> :<C-U>call commands#CodeRuner()<CR>
nmap <silent> <M-r> :<C-U>QuickRun<CR>

nmap <silent> <M-l> :<C-U>bnext<CR>
nmap <silent> <M-h> :<C-U>bprevious<CR>
nmap <silent> <M-x> :<C-U>bdelete<CR>


" 界面
nnoremap <silent><C-L> :<C-U>nohlsearch<CR>

noremap <M-Left> :3wincmd <<CR>
noremap <M-Right>  :3wincmd ><CR>
noremap <M-Up>  :3wincmd +<CR>
noremap <M-Down>  :3wincmd -<CR>


"noremap <F2> :<C-U>LeaderfBufTag<cr>
"nnoremap <silent><LEADER>t :<C-U>CocCommand translator.echo<CR>
"nmap <silent> <Leader>t <Plug>TranslateW
"vmap <silent> <Leader>t <Plug>TranslateWV

" 跳转
noremap <SPACE>w <C-W>
inoremap jk <ESC>
inoremap jj <ESC>
inoremap kk <ESC>
 "编辑配置文件
"nnoremap <LEADER>ev :vsplit ~/my.nvim/init.vim<CR>
 "加载配置文件
"nnoremap <LEADER>sv :source ~/my.nvim/init.vim<CR>
"nmap gs <Plug>Sneak_S

" 编辑
vmap <LEADER>s <Plug>VSurround
nmap <LEADER>s <Plug>Ysurround
nnoremap <silent><C-J> :<C-U>Snippets<CR>
nnoremap <silent><C-S> :<C-U>Scratch<CR>
inoremap <silent><C-\> <C-O>:<C-U>TableModeRealign<CR>
vnoremap < <gv
vnoremap > >gv


 "快速注释
nnoremap <silent><LEADER>; :<C-U>call NERDComment("n", "Toggle")<CR>
vnoremap <silent><LEADER>; :call NERDComment("n", "Toggle")<CR>gv
nnoremap <silent><C-_> :<C-U>call NERDComment("n", "Toggle")<CR>
vnoremap <silent><C-_> :call NERDComment("n", "Toggle")<CR>gv

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
nnoremap <silent>]] :<C-U>call NextUncommentedBlock(1)<CR>
nnoremap <silent>[[ :<C-U>call NextUncommentedBlock(-1)<CR>
nnoremap <C-Y> :<C-U>FZFYank<CR>
nnoremap <silent><Leader>gb :<C-U>ToggleBlameLine<CR>

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

" 这个插件还有一点小bug
" press <esc> to cancel.

"nmap f <Plug>(coc-smartf-forward)
"nmap F <Plug>(coc-smartf-backward)
"nmap ; <Plug>(coc-smartf-repeat)
"nmap , <Plug>(coc-smartf-repeat-opposite)

"augroup Smartf
"  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
"  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
"augroup end



nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<C-U>WhichKeyVisual '<Space>'<CR>

"buffer

nmap <LEADER>b1 <Plug>BufTabLine.Go(1)
nmap <LEADER>b2 <Plug>BufTabLine.Go(2)
nmap <LEADER>b3 <Plug>BufTabLine.Go(3)
nmap <LEADER>b4 <Plug>BufTabLine.Go(4)
nmap <LEADER>b5 <Plug>BufTabLine.Go(5)
nmap <LEADER>b6 <Plug>BufTabLine.Go(6)
nmap <LEADER>b7 <Plug>BufTabLine.Go(7)
nmap <LEADER>b8 <Plug>BufTabLine.Go(8)
nmap <LEADER>b9 <Plug>BufTabLine.Go(9)
nmap <LEADER>b0 <Plug>BufTabLine.Go(10)
nmap <LEADER>bh :<C-U>call startify#insane_in_the_membrane(0)<CR>
nmap <LEADER>bn :<C-U>bnext<CR>
nmap <LEADER>bp :<C-U>bprevious<CR>
nmap <LEADER>bd :<C-U>bdelete<CR>
nmap <LEADER>bl :<C-U>blast<CR>
nmap <LEADER>bf :<C-U>bfirst<CR>
"nmap <LEADER>bt :<C-U>LeaderfBufTag<CR>
nmap <LEADER>bt :<C-U>BTags<CR>

" language
xmap <LEADER>lf  <Plug>(coc-format-selected)
nmap <LEADER>lf  <Plug>(coc-format-selected)
nmap <silent> <LEADER>lc <Plug>(coc-fix-current)
xmap <silent> <LEADER>lc <Plug>(coc-fix-current)
nmap <silent><LEADER>lr :<C-U>QuickRun<CR>

" file
nnoremap <silent><LEADER>fs :<C-U>FilesMru --tiebreak=index<CR>
nnoremap <silent><LEADER>ft :<C-U>CocCommand explorer<CR>

" 使用fzfmru来模拟如vscode go to file 那样的文件模糊查找行为
nnoremap <silent><C-P> :<C-U>FilesMru --tiebreak=index<CR>

" help
nnoremap <silent><LEADER>hv :<C-U>Helptags<CR>
nnoremap <silent><LEADER>hm :<C-U>Maps<CR>
nnoremap <silent><LEADER>hc :<C-U>Cheats<CR>

" tag
nnoremap <LEADER>ts :<C-U>Tags<CR>
nnoremap <LEADER>tb :<C-U>Tagbar<CR>

" ui
nnoremap <LEADER>uc :<C-U>Clock<CR>
nnoremap <LEADER>uw :<C-U>set wrap!<CR>
nnoremap <LEADER>ut :<C-U>Tagbar<CR>
nnoremap <LEADER>un :<C-U>set number!<CR>
nnoremap <LEADER>up :<C-U>Goyo<CR>
nnoremap <LEADER>uh :<C-U>set concealcursor=c<CR>
nnoremap <LEADER>us :<C-U>FloatermToggle<CR>
tnoremap <LEADER>us <C-\><C-N>:<C-U>FloatermToggle<CR>
nnoremap <LEADER>ug :<C-U>ChunkInfo<CR>

" coc
nmap <Leader>ca <Plug>(coc-calc-result-append)
" replace result on current expression
nmap <Leader>cr <Plug>(coc-calc-result-replace)
nmap <Leader>cq <Plug>(coc-fix-current)
"nmap <leader>ca  <Plug>(coc-codeaction-selected)
"xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  :<C-U>CocCommand actions.open<CR>
xmap <leader>ca  :<C-U>CocCommand actions.open<CR>
nmap <leader>co  :<C-U>call CocAction('runCommand', 'editor.action.organizeImport')<CR>


" search
nnoremap <Leader>sw :<C-U>Rg <C-R><C-W><CR>
nnoremap <Leader>sr  :<C-U>Rg<CR>
nnoremap <Leader>st :<C-U>Tags<CR>
nnoremap <Leader>sf :<C-U>FilesMru --tiebreak=index<CR>

endif


