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
    " vim-visual-multi代替multicursor
    "call dein#add('terryma/vim-multiple-cursors') " 多光标编辑插件
    call dein#add('mg979/vim-visual-multi') 
    call dein#add('luochen1990/rainbow')
    call dein#add('neoclide/coc.nvim',{'build':'./install.sh'})
    "call dein#add('Shougo/unite.vim')
    "call dein#add('Shougo/vimfiler.vim', {'depends':'Shougo/unite.vim'})
    " defx代替vimfiler coc-explore 代替 defx
    "call dein#add('Shougo/defx.nvim')
    "call dein#add('Shougo/denite.nvim')
    " 完全可以使用fzf来代替FlyGrep
    ""call dein#add('wsdjeg/FlyGrep.vim')

    " tagbar已经落伍了
    "call dein#add('majutsushi/tagbar')
    " leaderF 代替tagbar
    call dein#add('Yggdroot/LeaderF')
    call dein#add('mhinz/vim-startify')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('fatih/vim-go')
    " 两个代码模版的插件要一起装，只复制代码模版文件可能会造成找不到vimsnippets模块
    call dein#add('SirVer/ultisnips')
    call dein#add('honza/vim-snippets')
     "这个markdown有点烦人，总是自作主张地改变样式
    "call dein#add('plasticboy/vim-markdown')
    call dein#add('iamcco/markdown-preview.nvim')
    call dein#add('lvht/tagbar-markdown')
    call dein#add('SpaceVim/vim-markdown')
    call dein#add('mzlogin/vim-markdown-toc')
    call dein#add('dhruvasagar/vim-table-mode')
    call dein#add('gcmt/wildfire.vim')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-surround')
    call dein#add('mattesgroeger/vim-bookmarks')
    call dein#add('airblade/vim-gitgutter')
    "call dein#add('jiangmiao/auto-pairs')
    call dein#add('godlygeek/tabular')

    " 三个插件加起来有最好的文件搜索体验
    call dein#add('tweekmonster/fzf-filemru')
    call dein#add('/usr/local/opt/fzf')
    call dein#add('junegunn/fzf.vim')

    call dein#add('Yggdroot/indentLine')
    " 修改树
    call dein#add('sjl/gundo.vim')
    call dein#add('thaerkh/vim-workspace')
    "call dein#add('bronson/vim-trailing-whitespace')
    " 平滑滚动插件
    "call dein#add('yuttie/comfortable-motion.vim')
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
    "call dein#add('mivok/vimtodo')
    call dein#add('junegunn/goyo.vim')
    call dein#add('freitass/todo.txt-vim')
    call dein#add('svermeulen/vim-easyclip')
    "call dein#add('vim-vdebug/vdebug')
    "call dein#add('jodosha/vim-godebug')
    " 提供了一些好用的command用于调试vimscript
    call dein#add('tpope/vim-scriptease')
    " 在vim中访问各种数据库
    call dein#add('tpope/vim-dadbod')
    call dein#add('tpope/vim-dispatch')
    call dein#add('tveskag/nvim-blame-line')
    call dein#add('andymass/vim-matchup')

   call dein#end()
    call dein#save_state()
endif

"if dein#check_install()
    "let g:spacevim_plugin_manager = 'dein'
    "let g:spacevim_plugin_manager_processes = 10 
    "" 自动安装未安装的插件
    "call SpaceVim#commands#install_plugin()
"endif

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

let g:instant_markdown_autostart = 0
let g:fzf_buffers_jump = 1

let g:tagbar_sort = 0


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

" 为了markdown插件而设置的
"set conceallevel=2
" 只在 normal模式下隐藏符号
set concealcursor=n
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:UltiSnipsEditSplit="vertical"
let g:table_mode_always_active = 1
let g:vmt_auto_update_on_save = 1

set cursorline

"g:EasyClipUseYankDefaults*

let g:EasyClipUseCutDefaults = 0

"g:EasyClipUsePasteDefaults*

let g:EasyClipEnableBlackHoleRedirect = 0

"g:EasyClipUsePasteToggleDefaults

" fzf使用悬浮窗
" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse'
" 打开 fzf 的方式选择 floating window
let g:fzf_layout = { 'window': 'call ui#OpenFloatingWin()' }




" 自定义指令
command! -bang -nargs=? -complete=dir Cheats
  \ call fzf#vim#files("~/.cheat", fzf#vim#with_preview(), <bang>0)
command! ChangeTree exe "GundoToggle"
"command! Scratch call CreateScratch()
command! Todo exe "Rg todo"
command! PluginInstall call <SID>PluginInstall()
command! RunCode call commands#CodeRuner()
"command! -bang Registers call commands#Registers('<bang>' ==# '!')
command! HomePage call startify#insane_in_the_membrane(0)
command! SourceCurrentFile exe "source %"
command! CleanPackages call commands#UninstallPackages()
command! VMaps call fzf#vim#maps("v", <bang>0) 
command! IMaps call fzf#vim#maps("i", <bang>0) 
command! ReloadConfig  exe "source ~/my.nvim/init.vim"
command! EditConfig exe "vsplit ~/my.nvim/init.vim" 

" 自动命令
autocmd FileType python call autocomplete#UseKite()
"autocmd BufNew,BufEnter *.man setlocal filetype=man



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
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" 这里是要解决Java补全的时候会有多余字符出现在末尾的问题
function! EnterComplete() abort
    " 选择了java的LS补全enter什么都不做，让提示框隐藏
    " 选择了除java LS外的补全
    " 没有选择补全项直接enter
    let s:com_info = complete_info()
    "echom "com_info: " .  string(s:com_info)
    if s:com_info["selected"] < 0 
        return "\<C-g>u\<CR>"
    endif
        "echom "selected:" . string(s:com_info["items"][s:com_info["selected"]])
        let s:selected_item = s:com_info["items"][s:com_info["selected"]]
        if ! has_key(s:selected_item,"user_data")
            return "\<C-Y>"
        endif
        let s:user_data = json_decode(s:selected_item["user_data"])
        "echom "source:" s:user_data["source"]
        return s:user_data["source"] == "java" ? "\<C-o>a" : "\<C-Y>"
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


fun! s:PluginInstall() abort
    if dein#check_install()
        let g:spacevim_plugin_manager = 'dein'
        let g:spacevim_plugin_manager_processes = 10 
        " 自动安装未安装的插件
        call SpaceVim#commands#install_plugin()
    endif
endf


autocmd BufEnter * Rooter
"autocmd BufEnter * EnableBlameLine
" 在使用O换行时不自动添加注释行
augroup Format-Options  
    autocmd!  
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o  
  
    " This can be done as well instead of the previous line, for setting formatoptions as you choose:  
    autocmd BufEnter * setlocal formatoptions=crqn2l1j  
augroup END

fun! CreateScratch() abort
    let s:current_filetype = &filetype
    let s:current_directory = getcwd()
    "echom s:current_filetype
    "echom s:current_directory
    let s:scratch_file_name = substitute(s:current_directory, "/", "%", 'g') . "." . s:current_filetype
    "echom s:scratch_file_name
    call ui#OpenFloatingWin()
    setlocal buftype =
    let s:scratch_file_name = "~/.cache/scratch/" . shellescape(fnameescape(s:scratch_file_name))
    "echom s:scratch_file_name
    execute "edit " . s:scratch_file_name
    let &filetype = s:current_filetype
    setlocal autowriteall
endf

autocmd User StartifyBufferOpened nested :Rooter

function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

function! s:yank_list()
  redir => ys
  silent Yanks
  redir END
  return split(ys, '\n')[1:]
endfunction

function! s:yank_handler(reg)
  if empty(a:reg)
    echo "aborted register paste"
  else
    let token = split(a:reg, ' ')
    execute 'Paste' . token[0]
  endif
endfunction

command! FZFYank call fzf#run(fzf#wrap({
\ 'source': <sid>yank_list(),
\ 'sink': function('<sid>yank_handler'),
\ 'options': '-m --prompt="Yank> "'
\ }))


let g:startify_custom_header = s:filter_header([
    \ '      ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁    ░▓▓▒         ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁',
    \ '     ▕                        ▁  ░░▓▓▒▒▒     ▁▔                        ▔▏',
    \ '    ▕ ▗▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚  ░░░▓▓▓▓▓▒▒▒  ▕ ▗▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▖▒▒',
    \ '    ▕ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒ ▓▓▓▓▓▓▓▓▓▒▒ ▕ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒',
    \ '    ▕ ▝▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚ ▒▓▓▓▓▓▓▓▓▓▓▓▒▒▒ ▝▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▀▘▒',
    \ '     ▕     ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▏',
    \ '      ▔▔▔▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒  ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒',
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒',
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒',
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓   ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒',
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒',
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒',
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▒',
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓   ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▓▓▒▒▒',
    \ '        ░▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓   ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▒▒▒',
    \ '       ░░▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▒▒▒',
    \ '     ░░░▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒',
    \ '   ░░░▓▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒',
    \ ' ░░░▓▓▓▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒  ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒',
    \ '▒▒▒▓▓▓▓▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒',
    \ ' ▒▒▒▓▓▓▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████',
    \ '   ▒▒▒▓▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███',
    \ '     ▒▒▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▖▖▖▖▖▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███',
    \ '      ▒▒▒▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▚▚▚▚▚▘▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███',
    \ '       ▒▒▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒ ▚▚▚▚▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███',
    \ '        ▒▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███',
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▚▚▚▚▚▚▚▚▓▓▓▚▚▚▚▚▚▖▓▓▗▚▚▚▚▚▖██ ▗▚▚▚▚▚',
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▓▓▓▚▚▚▚▘▓▓▓▓▓▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚',
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▓▓▓▓▚▚▚▚▚▎▓▓▓▓▓▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚',
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▚▚▚▚▚▎▓▓▓▓▓▚▚▚▚▓▓▓▓▞▚▚▚▚▚      ▚▚▚▚▚',
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▓▓▓▓▓▚▚▚▚▚▘▓▓▓▓▓▚▚▚▚▚▓▓██▞▚▚▚▚▚     ▚▚▚▚▚',
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▓▓▓▓▓▚▚▚▚▚▘▓▓▓▓▚▚▚▚▚▓███  ▚▚▚▚      ▚▚▚▚▚',
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▒▒▒▒▒▒▒▓▓▓▚▚▚▚▞▞▓▓▓▓▓▚▚▚▚▓██   ▚▚▚▚▚     ▚▚▚▚▚',
    \ '         ▏ ▚▚▚▚▚▚▒▒▒▒    ▒▒▒▒▚▚▚▚▚▚▓▓▓▓▓▚▚▚▚▚██    ▚▚▚▚     ▚▚▚▚▚▚',
    \ '         ▔▁▀▒▒▒▒▒▒         ▒▒▚▚▚▚▚▚▚▚▓▓▓▚▚▚▚▚▚    ▚▚▚▚▚▚    ▚▚▚▚▚▚▚',
    \ '           ▔                  ▒▒▓▓▓▓▓▓▓▓███',
    \ '                               ▒▒▒▓▓▓▓███',
    \ '                                 ▒▒▒▓██▓',
    \ '                                   ▒█▓',
    \ ])

" 自动显示文档
"autocmd CursorHold  * if &filetype !=# "vim" | call autocomplete#ShowDocumentation()

let g:Lf_GtagsAutoGenerate = 1



"let g:Lf_WindowPosition = 'left'

noremap <F2> ::Leaderf bufTag!<cr>

let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function':0, 'Colorscheme':1}

let g:Lf_NormalMap = {
	\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
	\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
	\ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
	\ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
	\ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
	\ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
	\ }
