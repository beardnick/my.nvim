"AndrewRadev/switch.vim nvim总是不兼容vi的
if &compatible
    set nocompatible
endif
" dein的路径
set runtimepath+=/Users/mac/study/git/dein.vim
let g:dein_load_state = dein#load_state("/Users/mac/study/git/plugins")
if g:dein_load_state
    " 加载dein插件管理器
    call dein#begin("/Users/mac/study/git/plugins")
    call dein#add("/Users/mac/study/git/dein.vim")

    call dein#add('morhetz/gruvbox') " 主题
    call dein#add('wsdjeg/dein-ui.vim') " 插件管理器
    call dein#add('justinmk/vim-sneak') " 快速跳转插件
    call dein#add('terryma/vim-multiple-cursors') " 多光标编辑插件
    call dein#add('luochen1990/rainbow')
    call dein#add('neoclide/coc.nvim',{'build':'./install.sh'})
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/vimfiler.vim', {'depends':'Shougo/unite.vim'})
    call dein#add('Shougo/denite.nvim')
    call dein#add('wsdjeg/FlyGrep.vim')

    call dein#add('majutsushi/tagbar')
    call dein#add('mhinz/vim-startify')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('fatih/vim-go')
    call dein#add('SirVer/ultisnips')
    call dein#add('plasticboy/vim-markdown')
    call dein#add('gcmt/wildfire.vim')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-surround')
    call dein#add('mattesgroeger/vim-bookmarks')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('godlygeek/tabular')

    " 三个插件加起来有最好的文件搜索体验
    call dein#add('tweekmonster/fzf-filemru', {'depends':['junegunn/fzf.vim', '/usr/local/opt/fzf']})
    call dein#add('junegunn/fzf.vim')
    call dein#add('/usr/local/opt/fzf')

    call dein#add('Yggdroot/indentLine')
    " 修改树
    call dein#add('sjl/gundo.vim')
    call dein#add('thaerkh/vim-workspace')
    "call dein#add('bronson/vim-trailing-whitespace')
    call dein#add('yuttie/comfortable-motion.vim')
    "call dein#add('ryanoasis/vim-devicons')
    call dein#add('tyru/open-browser.vim')
    call dein#add('suan/vim-instant-markdown')
    call dein#add('airblade/vim-rooter')
    " 切换自定义格式的工具
    call dein#add('AndrewRadev/switch.vim')
    call dein#add('benmills/vimux')

    " 自动切换输入法的工具
    call dein#add('xcodebuild/fcitx-vim-osx')
    call dein#add('xcodebuild/fcitx-remote-for-osx')

   call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    let g:spacevim_plugin_manager = 'dein'
    let g:spacevim_plugin_manager_processes = 10 
    " 自动安装未安装的插件
    call SpaceVim#commands#install_plugin()
endif

colorscheme gruvbox

" 属性配置
" 启用彩虹括号颜色
let g:rainbow_active = 1
" 启用git符号栏 
let g:gitgutter_enabled = 1
" 设置代码模版触发器
let g:UltiSnipsExpandTrigger       = '<C-j>'
let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" 使通过tab对齐的文件显示对齐线,注意末尾有一个空格
set list lcs=tab:\|\ 
" 下面的只能使通过空格对齐的文件显示对齐线
let g:indentLine_enabled = 1
" 设置leader为空格
let mapleader = " "
" 状态栏为文件全路径和文件类型
set statusline=%F\ >\ %y
set number
set nowrap
" 使光标始终在屏幕中间
set sidescrolloff=999
set scrolloff=999
" 使用语法折叠
set foldmethod=syntax
set foldlevelstart=99
" 使用/匹配的时候实时显示匹配到的内容
set incsearch
set ignorecase
" 设置对齐
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
" 终端开启真彩色
if has("termguicolors")
    " fix bug for vim
    set t_8f=^[[38;2;%lu;%lu;%lum
    set t_8b=^[[48;2;%lu;%lu;%lum

    " enable true color
    set termguicolors
endif


" fzf使用悬浮窗
" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse'
" 打开 fzf 的方式选择 floating window
let g:fzf_layout = { 'window': 'call ui#OpenFloatingWin()' }

" vimfiler设置
call vimfiler#custom#profile('default', 'context', {
      \ 'explorer' : 1,
      \ 'winminwidth' : 30,
      \ 'toggle' : 1,
      \ 'auto_expand': 1,
      \ 'direction' : "rightbelow",
      \ 'parent': 0,
      \ 'status' : 1,
      \ 'safe' : 0,
      \ 'split' : 1,
      \ 'no_quit' : 1,
      \ 'force_hide' : 0,
      \ })
let g:tagbar_left = 1


" 自定义指令
command! RunCode call commands#CodeRuner()
command! -bang Registers call commands#Registers('<bang>' ==# '!')
command! HomePage call startify#insane_in_the_membrane(0)
command! SourceCurrentFile exe "source %"
command! CleanPackages call commands#UninstallPackages()
command! VMaps call fzf#vim#maps("v", <bang>0) 
command! IMaps call fzf#vim#maps("i", <bang>0) 

" 自动命令
autocmd FileType python call autocomplete#UseKite()



" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

 "Use tab for trigger completion with characters ahead and navigate.
 "Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-N>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let s:col = col('.') - 1
  " 判断光标下和前面的一个字符是否为空白字符
  return !s:col || getline('.')[s:col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
"inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-Y>" : "\<C-g>u\<CR>"
"inoremap <expr> <CR> EnterComplete() ? "\<C-Y>" : "\<C-g>u\<CR>"
"<C-o>a直接让提示框消失，什么也不做
"inoremap <expr> <CR> complete_info()["selected"] != "-1" ?( EnterComplete() ? "\<C-Y>" : "\<C-o>a") :"\<C-g>u\<CR>"
inoremap <expr> <CR> EnterComplete()

" 这里是要解决Java补全的时候会有多余字符出现在末尾的问题
function! EnterComplete() abort
    " 选择了java的LS补全enter什么都不做，让提示框隐藏
    " 选择了除java LS外的补全
    " 没有选择补全项直接enter
    let s:com_info = complete_info()
    "echom "com_info: " .  string(s:com_info)
    if s:com_info["selected"] != "-1"
        "echom "selected:" . string(s:com_info["items"][s:com_info["selected"]])
        let s:selected_item = s:com_info["items"][s:com_info["selected"]]
        if ! has_key(s:selected_item,"user_data")
            return "\<C-Y>"
        endif
        let s:user_data = json_decode(s:selected_item["user_data"])
        "echom "source:" s:user_data["source"]
        return s:user_data["source"] == "java" ? "\<C-o>a" : "\<C-Y>"
    else
        return "\<C-g>u\<CR>"
    endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

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

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}\ >\ 

" complete的原理
inoremap <C-L> <C-R>=ListMonths()<CR>

func! ListMonths()
  call complete(col('.') - 3, ['January', 'February', 'March',
    \ 'April', 'May', 'June', 'July', 'August', 'September',
    \ 'October', 'November', 'December'])
  return ''
endfunc


" 测试补全
" <C-X><C-U>
"fun! CompleteMonths(findstart, base)
"  if a:findstart
"    " locate the start of the word
"    let line = getline('.')
"    let start = col('.') - 1
"    while start > 0 && line[start - 1] =~ '\a'
"      let start -= 1
"    endwhile
"    return start
"  else
"    let res = [{'word': 'if', 'menu': '[LS]', 'user_data': '{"cid":1572196672,"source":"java","index":998}', 'info': '', 'kind': 'k', 'abbr': 'if'}, {'word': 'if ', 'menu': '26% [TN]', 'user_data': '{"cid":1572196672,"source":"tabnine","index":0}', 'info': '', 'kind': 'S', 'abbr': 'if (pic)~'}, {'word': 'io.netty.buffer', 'menu': '[LS]', 'user_da ta': '{"cid":1572196672,"source":"java","index":911}', 'info': '', 'kind': 'M', 'abbr': 'io.netty.buffer'}, {'word': 'io.netty.handler.flow', 'menu': '[LS]', 'user_data': '{"cid":1572196672,"source":"java "","index":951}', 'info': '', 'kind': 'M', 'abbr': 'io.netty.handler.flow'}, {'word': 'io.netty.handler.flush', 'menu': '[LS]', 'user_data': '{"cid":1572196672,"source":"java","index":971}', 'info': '', 'k ind': 'M', 'abbr': 'io.netty.handler.flush'}, {'word': 'io.swagger.models.refs', 'menu': '[LS]', 'user_data': '{"cid":1572196672,"source":"java","index":916}', 'info': '', 'kind': 'M', 'abbr': 'io.swagger .models.refs'}, {'word': 'io.netty.handler.traffic', 'menu': '[LS]', 'user_data': '{"cid":1572196672,"source":"java","index":923}', 'info': '', 'kind': 'M', 'abbr': 'io.netty.handler.traffic'}, {'word': ' io.netty.handler.ipfilter', 'menu': '[LS]', 'user_data': '{"cid":1572196672,"source":"java","index":993}', 'info': '', 'kind': 'M', 'abbr': 'io.netty.handler.ipfilter'}, {'word': 'io.netty.handler.codec.p rotobuf', 'menu': '[LS]', 'user_data': '{"cid":1572196672,"source":"java","index":913}', 'info': '', 'kind': 'M', 'abbr': 'io.netty.handler.codec.protobuf'}, {'word': 'IfFunc', 'menu': '[LS]', 'user_data' : '{"cid":1572196672,"source":"java","index":747}', 'info': '', 'kind': 'C', 'abbr': 'IfFunc - org.apache.poi.ss.formula.functions'}, {'word': 'IfAction', 'menu': '[LS]', 'user_data': '{"cid":1572196672," source":"java","index":303}', 'info': '', 'kind': 'C', 'abbr': 'IfAction - ch.qos.logback.core.joran.conditional'}, {'word': 'IfSqlNode', 'menu': '[LS]', 'user_data': '{"cid":1572196672,"source":"java","i ndex":581}', 'info': '', 'kind': 'C', 'abbr': 'IfSqlNode - org.apache.ibatis.scripting.xmltags'}, {'word': 'IfClosure', 'menu': '[LS]', 'user_data': '{"cid":1572196672,"source":"java","index":603}', 'info ': '', 'kind': 'C', 'abbr': 'IfClosure - org.apache.commons.collections.functors'}, {'word': 'IfClosure', 'menu': '[LS]', 'user_data': '{"cid":1572196672,"source":"java","index":753}', 'info': '', 'kind': 'C', 'abbr': 'IfClosure - org.apache.commons.collections4.functors'}, {'word': 'IfTransformer', 'menu': '[LS]', 'user_data': '{"cid":1572196672,"source":"java","index":766}', 'info': '', 'kind': 'C', 'ab br': 'IfTransformer - org.apache.commons.collections4.functors'}, {'word': 'IfElseExpression', 'menu': '[LS]', 'user_data': '{"cid":1572196672,"source":"java","index":743}', 'info': '', 'kind': 'C', 'abbr ': 'IfElseExpression - org.apache.poi.sl.draw.geom'} ]    
"    call complete(col('.') + 1, res)
"  endif
"  return ""
"endfun
"
"set completefunc=CompleteMonths
