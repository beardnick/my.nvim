let g:mapleader="\<Space>"

nnoremap <silent><LEADER>/ :<C-U>FzfPreviewLines <C-R><C-W><CR>
nnoremap <silent><C-F> :<C-U>Rg <C-R><C-W><CR>
nnoremap <silent><C-H> :<C-U>Helptags<CR>
nnoremap <silent><LEADER><LEADER> :<C-U>Commands<CR><C-P>
nnoremap <silent><C-G> :<C-U>Note<CR>

" 语法
" 先禁用vim-go的文档显示
let g:go_doc_keywordprg_enabled = 0


" Remap keys for gotos
" 先禁用vim-go的跳转定义插件
let g:go_def_mapping_enabled = 0


"nnoremap <silent> gd :<C-U>CocCommand fzf-preview.LocationList<CR>
"nnoremap <silent> gr :<C-U>CocCommand fzf-preview.CocReferences<CR>



" 界面
nnoremap <silent><C-L> :<C-U>nohlsearch<CR>

"noremap <F2> :<C-U>LeaderfBufTag<cr>
"nnoremap <silent><LEADER>t :<C-U>CocCommand translator.echo<CR>
"nmap <silent> <Leader>t <Plug>TranslateW
"vmap <silent> <Leader>t <Plug>TranslateWV

" 跳转
nnoremap <Leader>w <C-W>
inoremap jk <ESC>
inoremap jj <ESC>
inoremap kk <ESC>

" 编辑
vmap <LEADER>s <Plug>VSurround
nmap <LEADER>s <Plug>Ysurround
nnoremap <silent><C-J> :<C-U>Snippets<CR>
"nnoremap <silent><C-S> :<C-U>Scratch<CR>
inoremap <silent><C-\> <C-O>:<C-U>TableModeRealign<CR>
vnoremap < <gv
vnoremap > >gv


 "快速注释
nnoremap <silent><LEADER>; :<C-U>call NERDComment("n", "Toggle")<CR>
vnoremap <silent><LEADER>; :call NERDComment("n", "Toggle")<CR>gv
nnoremap <silent><C-_> :<C-U>call NERDComment("n", "Toggle")<CR>
vnoremap <silent><C-_> :call NERDComment("n", "Toggle")<CR>gv

" 复制粘贴
"nnoremap <Leader>yy viw"+y
"nnoremap <Leader>ya viw"ay
"nnoremap <Leader>yb viw"by
"nnoremap <Leader>yc viw"cy

vnoremap <C-c> "+y
vnoremap <C-v> "+p
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




"nnoremap <silent><Leader>gi :<C-U>ChunkInfo<CR>
"nnoremap <silent><Leader>gu :<C-U>ChunkUndo<CR>
"nnoremap <silent><Leader>gb :<C-U>Gblame<CR>

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



"nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
"vnoremap <silent> <leader> :<C-U>WhichKeyVisual '<Space>'<CR>

"buffer

nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>

nmap <LEADER>b1 :BufferGoto 1<CR>
nmap <LEADER>b2 :BufferGoto 2<CR>
nmap <LEADER>b3 :BufferGoto 3<CR>
nmap <LEADER>b4 :BufferGoto 4<CR>
nmap <LEADER>b5 :BufferGoto 5<CR>
nmap <LEADER>b6 :BufferGoto 6<CR>
nmap <LEADER>b7 :BufferGoto 7<CR>
nmap <LEADER>b8 :BufferGoto 8<CR>
nmap <LEADER>b9 :BufferGoto 9<CR>
nmap <LEADER>bh :<C-U>call startify#insane_in_the_membrane(0)<CR>
nmap <LEADER>bn :<C-U>bnext<CR>
nmap <LEADER>bp :<C-U>bprevious<CR>
nmap <LEADER>bd :<C-U>bdelete<CR>
nmap <LEADER>bl :<C-U>blast<CR>
nmap <LEADER>bf :<C-U>bfirst<CR>
"nmap <LEADER>bt :<C-U>LeaderfBufTag<CR>
nmap <LEADER>bt :<C-U>BTags<CR>
nmap <LEADER>bs :<C-U>Buffers<CR>
nmap <LEADER>bv :<C-U>call commands#BufferSplitVertical()<CR>

" language
vmap <LEADER>lf  :<C-U>Format<CR>
nmap <LEADER>lf  :<C-U>Format<CR>
nmap <silent><LEADER>lr :<C-U>AsyncTask file-run<CR>
nmap <silent><LEADER>lp :<C-U>AsyncTask project-run<CR>
nmap <silent><LEADER>lg :<C-U>TemplateHere<CR>
nmap <silent><LEADER>lt :<C-U>AsyncTaskFzf<CR>

vmap <silent><LEADER>ls :TREPLSendSelection<CR>

" file
nnoremap <silent><LEADER>fs :<C-U>FilesMru --tiebreak=index<CR>

" 使用fzfmru来模拟如vscode go to file 那样的文件模糊查找行为
nnoremap <silent><C-P> :<C-U>FilesMru --tiebreak=index<CR>
"inoremap <silent><C-P> <ESC>:<C-U>call CocActionAsync('showSignatureHelp')<CR>

" help
nnoremap <silent><LEADER>hv :<C-U>Helptags<CR>
nnoremap <silent><LEADER>hm :<C-U>Maps<CR>
nnoremap <silent><LEADER>hc :<C-U>Cheats<CR>
nmap <silent><LEADER>hd <Plug>DashSearch
" floaterm tool
"nnoremap <LEADER>tt :<C-U>FloatermToggle<CR>
"nnoremap <LEADER>tn :<C-U>FloatermNext<CR>
"nnoremap <LEADER>tp :<C-U>FloatermPrev<CR>

function! ToggleBackground() abort
    if &background == 'dark'
        let &background='light'
    else
        let &background='dark'
    endif
endfunction

" ui
nnoremap <LEADER>uc :<C-U>Clock<CR>
nnoremap <LEADER>uw :<C-U>set wrap!<CR>
nnoremap <LEADER>ut :<C-U>Vista!!<CR>
nnoremap <LEADER>un :<C-U>set number!<CR>
nnoremap <LEADER>up :<C-U>Goyo<CR>
nnoremap <LEADER>uh :<C-U>set concealcursor=c<CR>
"nnoremap <LEADER>us :<C-U>call TerminalToggle()<CR>
"tnoremap <LEADER>us <C-\><C-N>:<C-U>call TerminalToggle()<CR>
nnoremap <LEADER>us :<C-U>Ttoggle<CR>
tnoremap <LEADER>us <C-\><C-N>:<C-U>Ttoggle<CR>

nnoremap <LEADER>tc :<C-U>vertical Tnew<CR>
tnoremap <LEADER>tc <C-\><C-N>:<C-U>vertical Tnew<CR>
nnoremap <LEADER>tn :<C-U>Tnext<CR>
tnoremap <LEADER>tn <C-\><C-N>:<C-U>Tnext<CR>
nnoremap <LEADER>tp :<C-U>Tprevious<CR>
tnoremap <LEADER>tp <C-\><C-N>:<C-U>Tprevious<CR>

nnoremap <LEADER>ug :<C-U>ChunkInfo<CR>
nnoremap <LEADER>ub :<C-U>call ToggleBackground()<CR>

"window
nnoremap <LEADER>w+ :<C-U>5wincmd +<CR>
nnoremap <LEADER>w- :<C-U>5wincmd -<CR>
nnoremap <LEADER>w< :<C-U>5wincmd <<CR>
nnoremap <LEADER>w> :<C-U>5wincmd ><CR>
nmap <LEADER>wc <Plug>(choosewin)
nnoremap <silent><Leader>wm :MaximizerToggle<CR>
vnoremap <silent><Leader>wm :MaximizerToggle<CR>gv
inoremap <silent><Leader>wm <C-o>:MaximizerToggle<CR>


nnoremap <M-.> :<C-U>5wincmd ><CR>
nnoremap <M-,> :<C-U>5wincmd <<CR>
nnoremap <M-=> :<C-U>5wincmd +<CR>
nnoremap <M--> :<C-U>5wincmd -<CR>


" search
"nnoremap <Leader>sw :<C-U>Rg <C-R><C-W><CR> "=><C-F>
"nnoremap <Leader>sr  :<C-U>Rg<CR>
nnoremap <Leader>sr  :<C-U>Rg<CR>
nnoremap <Leader>sg  :<C-U>FzfPreviewProjectGrep ""<CR>
nnoremap <Leader>sl  :<C-U>FzfPreviewLines<CR>
nnoremap <Leader>st :<C-U>Tags<CR>
"nnoremap <Leader>sf :<C-U>FilesMru --tiebreak=index<CR> "=><C-P>
nnoremap <Leader>sb :<C-U>FzfPreviewBuffers<CR>
tnoremap <Leader>sb <C-\><C-n>:<C-U>FzfPreviewBuffers<CR>
" coc-fzf

nnoremap <silent> <Leader>sh  :<C-u>History:<CR>
"nnoremap <silent> <Leader>sp  :<C-u>CocFzfListExtensions<CR>
"nnoremap <silent> <Leader>sl  :<C-u>CocFzfListLocation<CR> "=>gd


"coc-bookmark
"nmap mn <Plug>(coc-bookmark-next)
"nmap mp <Plug>(coc-bookmark-prev)
"nmap mm <Plug>(coc-bookmark-toggle)
"nmap mi <Plug>(coc-bookmark-annotate)
"nnoremap ma :<C-U>CocList bookmark<CR>

"debug
nmap <Leader>db <Plug>VimspectorContinue
nmap <Leader>dx <Plug>VimspectorStop
nmap <Leader>dr <Plug>VimspectorRestart
nmap <Leader>dp <Plug>VimspectorPause
nmap <Leader>dl <Plug>VimspectorToggleBreakpoint
nmap <Leader>df <Plug>VimspectorAddFunctionBreakpoint
nmap <Leader>dn <Plug>VimspectorStepOver
nmap <Leader>di <Plug>VimspectorStepInto
nmap <Leader>do <Plug>VimspectorStepOut

nmap <M-l> <Plug>VimspectorToggleBreakpoint
nmap <M-n> <Plug>VimspectorStepOver
nmap <M-x> <Plug>VimspectorStop
nmap <M-r> <Plug>VimspectorRestart
nmap <M-i> <Plug>VimspectorStepInto
nmap <M-o> <Plug>VimspectorStepOut


"nmap <silent> w <Plug>(coc-ci-w)
"nmap <silent> b <Plug>(coc-ci-b)

"nmap <Leader>e :<C-U>Expand<CR>
vmap <Leader>e :Expand<CR>

" dbui
"nmap l <Plug>(DBUI_SelectLine)
"nmap <CR> <Plug>(DBUI_SelectLineVsplit)

" remote development

nnoremap <Leader>rp :MirrorPush<CR>
nnoremap <Leader>rl :MirrorPull<CR>
vnoremap <C-E> :normal @q<CR>
nnoremap <C-E> :normal @q<CR>
nnoremap <C-Q> :call ToggleRecording()<CR>

function ToggleRecording() abort
    if reg_recording()
        execute "normal q"
    else
        execute "normal qq"
    endif
endfunction

nmap s <Plug>(easymotion-prefix)

nnoremap H ^
nnoremap L $

map Y y$

cnoremap <C-a> <Home>
cnoremap <C-e> <End>

nmap <C-a> <Plug>(dial-increment)
nmap <C-x> <Plug>(dial-decrement)
vmap <C-a> <Plug>(dial-increment)
vmap <C-x> <Plug>(dial-decrement)
vmap g<C-a> <Plug>(dial-increment-additional)
vmap g<C-x> <Plug>(dial-decrement-additional)

lua << EOF
local dial = require("dial")

dial.config.searchlist.normal = {
    "number#decimal",
    "number#hex",
    "number#binary",
    "date#[%Y/%m/%d]",
    "markup#markdown#header",
    "char#alph#small#word",
    "char#alph#capital#word",
    "char#alph#small#str",
    "char#alph#capital#str",
}
EOF
