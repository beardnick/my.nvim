"AndrewRadev/switch.vim nvim总是不兼容vi的
if &compatible
    set nocompatible
endif

let g:DEIN=expand('~/.cache/mynvim/repos/github.com/Shougo/dein.vim')
let g:PLUGINS=expand('~/.cache/mynvim/')
" dein的路径
let &runtimepath.="," . g:DEIN
let g:dein_load_state = dein#load_state(g:PLUGINS)
if g:dein_load_state
    " 加载dein插件管理器
    call dein#begin(g:PLUGINS)
    call dein#add(g:DEIN)

    call dein#add('morhetz/gruvbox') " 主题
    call dein#add('wsdjeg/dein-ui.vim') " 插件管理器
    call dein#add('justinmk/vim-sneak') " 快速跳转插件
    " vim-visual-multi代替multicursor
    "call dein#add('terryma/vim-multiple-cursors') " 多光标编辑插件
    call dein#add('mg979/vim-visual-multi') 
    call dein#add('luochen1990/rainbow')
    " 注意编译问题，很多时候编译出错了很多插件都会有问题
    " 大部分时候可以通过call coc#util#install()解决问题
    call dein#add('neoclide/coc.nvim',{'build':'./install.sh'})
    "call dein#add('Shougo/unite.vim')
    "call dein#add('Shougo/vimfiler.vim', {'depends':'Shougo/unite.vim'})
    " defx代替vimfiler coc-explore 代替 defx
    "call dein#add('Shougo/defx.nvim')
    "call dein#add('Shougo/denite.nvim')
    " 完全可以使用fzf来代替FlyGrep
    ""call dein#add('wsdjeg/FlyGrep.vim')

    " tagbar用来显示tag
    call dein#add('majutsushi/tagbar')
    " 自动tag生成与管理
    call dein#add('ludovicchabant/vim-gutentags')
    " leaderf用来搜索
    call dein#add('Yggdroot/LeaderF')
    call dein#add('mhinz/vim-startify')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('fatih/vim-go')
    " 两个代码模版的插件要一起装，只复制代码模版文件可能会造成找不到vimsnippets模块
    call dein#add('SirVer/ultisnips')
    call dein#add('honza/vim-snippets')
    "call dein#add('plasticboy/vim-markdown')
    call dein#add('iamcco/markdown-preview.nvim')
    "call dein#add('lvht/tagbar-markdown')
    call dein#add('SpaceVim/vim-markdown')
    call dein#add('mzlogin/vim-markdown-toc')
    call dein#add('dhruvasagar/vim-table-mode')
    call dein#add('gcmt/wildfire.vim')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-surround')
    call dein#add('mattesgroeger/vim-bookmarks')
    "call dein#add('airblade/vim-gitgutter')
    "call dein#add('jiangmiao/auto-pairs')
    call dein#add('godlygeek/tabular')

    if !empty(glob("/usr/local/opt/fzf")) 
    " if filereadable("/usr/local/opt/fzf")
        call dein#add('/usr/local/opt/fzf', {'frozen':1})
    else
        call dein#add('~/.fzf', {'frozen':1})
    endif
    " 三个插件加起来有最好的文件搜索体验
    call dein#add('tweekmonster/fzf-filemru')
    call dein#add('junegunn/fzf.vim')

    call dein#add('thinca/vim-quickrun')
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
    "call dein#add('airblade/vim-rooter', {'if':0})
    call dein#add('airblade/vim-rooter')
    " 切换自定义格式的工具
    call dein#add('AndrewRadev/switch.vim')
    call dein#add('benmills/vimux')
    call dein#add('ap/vim-buftabline')

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
    call dein#add('andymass/vim-matchup')
    call dein#add('flazz/vim-colorschemes')
    "添加tmux框中文字的补全源
    call dein#add('wellle/tmux-complete.vim')
    call dein#add('liuchengxu/vim-which-key')
    "call dein#add('voldikss/vim-translate-me')
    "记录上一次打开文件的位置
    call dein#add('farmergreg/vim-lastplace')
    call dein#add('brooth/far.vim')

   call dein#end()
    call dein#save_state()
endif

let g:auto_install_missing_plugins = 0
if dein#check_install() && g:auto_install_missing_plugins
    call dein#recache_runtimepath()
    let g:spacevim_plugin_manager = 'dein'
    let g:spacevim_plugin_manager_processes = 10 
    " 自动安装未安装的插件
    call SpaceVim#commands#install_plugin()
endif

colorscheme gruvbox
"colorscheme monokai

" 属性配置
" 启用彩虹括号颜色
let g:rainbow_active = 1
" 启用git符号栏 
let g:gitgutter_enabled = 1
" 设置代码模版触发器
let g:UltiSnipsExpandTrigger       = '<C-j>'
let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:NERDDefaultAlign = 'left'
" 使通过tab对齐的文件显示对齐线,注意末尾有一个空格
set list lcs=tab:\|\ 
" 下面的只能使通过空格对齐的文件显示对齐线
let g:indentLine_enabled = 1

let g:instant_markdown_autostart = 0
let g:fzf_buffers_jump = 1

let g:tagbar_sort = 0

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:quickrun_no_default_key_mappings = 1
let g:sneak#s_next = 1



" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" leaderf使用悬浮窗来显示
let g:Lf_WindowPosition = 'popup' 


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
set timeoutlen=200

" 终端开启真彩色
if has("termguicolors")
    " fix bug for vim
    set t_8f=^[[38;2;%lu;%lu;%lum
    set t_8b=^[[48;2;%lu;%lu;%lum

    " enable true color
    set termguicolors
endif

" 为了markdown插件而设置的
set conceallevel=3 concealcursor=niv
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:UltiSnipsEditSplit="vertical"
let g:table_mode_always_active = 1
let g:vmt_auto_update_on_save = 1

let g:Lf_ShortcutB = '<LEADER>bs'                               
let g:Lf_ShortcutF = ''

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
let g:fzf_layout = { 'window': 'call ui#FloatingFZF()' }

let g:buftabline_numbers = 2
let g:buftabline_separators = 1 

let g:quickrun#default_config = {
\ '_': {
    \ "runner":"terminal",
  \ }
\ }


" 自定义指令
command! -bang -nargs=? -complete=dir Cheats
  \ call fzf#vim#files("~/.cheat", fzf#vim#with_preview(), <bang>0)
command! ChangeTree exe "GundoToggle"
"command! Scratch call CreateScratch()
command! Todo exe "Rg todo"
command! PluginInstall call <SID>PluginInstall()
command! Run call commands#CodeRuner()
command! Refactor call CocActionAsync('refactor')
"command! -bang Registers call commands#Registers('<bang>' ==# '!')
command! HomePage call startify#insane_in_the_membrane(0)
command! SourceCurrentFile exe "source %"
command! CleanPackages call commands#UninstallPackages()
command! VMaps call fzf#vim#maps("v", <bang>0) 
command! IMaps call fzf#vim#maps("i", <bang>0) 
command! ReloadConfig  exe "source ~/my.nvim/init.vim"
command! EditConfig exe "vsplit ~/my.nvim/init.vim" 
command! ChunkInfo exe "CocCommand git.chunkInfo" 
command! ChuckStage exe "CocCommand git.chunkStage" 
command! ChunkUndo exe "CocCommand git.chunkUndo" 
command! Clock call <SID>ToggleClock()

let g:coc_clock_enabled=0
function! s:ToggleClock() abort
    if g:coc_clock_enabled
        exe "CocCommand clock.disable"
        let g:coc_clock_enabled=0
    else
        exe "CocCommand clock.enable"
        let g:coc_clock_enabled=1
    endif
endfunction


" 自动命令
"autocmd FileType python call autocomplete#UseKite()
"autocmd BufNew,BufEnter *.man setlocal filetype=man
"autocmd BufEnter,BufNew,BufRead *.{markdown,json} set concealcursor=c

autocmd CursorHold * silent call CocActionAsync('highlight')

highlight default link CocHighlightText  MatchParen

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

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


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


fun! s:PluginInstall() abort
    if dein#check_install()
        let g:spacevim_plugin_manager = 'dein'
        let g:spacevim_plugin_manager_processes = 10 
        " 自动安装未安装的插件
        call SpaceVim#commands#install_plugin()
    endif
endf


autocmd BufEnter * Rooter

let g:rooter_patterns = ['.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/', '.hgignore','.gitignore', '.cquery']

" 在使用O换行时不自动添加注释行
augroup Format-Options  
    autocmd!  
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o  
  
    " This can be done as well instead of the previous line, for setting formatoptions as you choose:  
    autocmd BufEnter * setlocal formatoptions=crqn2l1j  
augroup END

let g:bookmark_save_per_working_dir = 1
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
    \ '      ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁    ░▓▓▒         ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁'     ,
    \ '     ▕                        ▁  ░░▓▓▒▒▒     ▁▔                        ▔▏'   ,
    \ '    ▕ ▗▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚  ░░░▓▓▓▓▓▒▒▒  ▕ ▗▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▖▒▒'   ,
    \ '    ▕ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒ ▓▓▓▓▓▓▓▓▓▒▒ ▕ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒'   ,
    \ '    ▕ ▝▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚ ▒▓▓▓▓▓▓▓▓▓▓▓▒▒▒ ▝▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▀▘▒'    ,
    \ '     ▕     ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▏' ,
    \ '      ▔▔▔▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒  ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒'       ,
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒'         ,
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒'           ,
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓   ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒'            ,
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒'            ,
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒'                ,
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▒'                ,
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓   ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▓▓▒▒▒'              ,
    \ '        ░▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓   ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▒▒▒'            ,
    \ '       ░░▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▒▒▒'          ,
    \ '     ░░░▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒'       ,
    \ '   ░░░▓▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒'      ,
    \ ' ░░░▓▓▓▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒  ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒'    ,
    \ '▒▒▒▓▓▓▓▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒'    ,
    \ ' ▒▒▒▓▓▓▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████'     ,
    \ '   ▒▒▒▓▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███'       ,
    \ '     ▒▒▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▖▖▖▖▖▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███'         ,
    \ '      ▒▒▒▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▚▚▚▚▚▘▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███'           ,
    \ '       ▒▒▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒ ▚▚▚▚▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███'             ,
    \ '        ▒▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███'              ,
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▚▚▚▚▚▚▚▚▓▓▓▚▚▚▚▚▚▖▓▓▗▚▚▚▚▚▖██ ▗▚▚▚▚▚'        ,
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▓▓▓▚▚▚▚▘▓▓▓▓▓▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚'       ,
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▓▓▓▓▚▚▚▚▚▎▓▓▓▓▓▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚'       ,
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▚▚▚▚▚▎▓▓▓▓▓▚▚▚▚▓▓▓▓▞▚▚▚▚▚      ▚▚▚▚▚'        ,
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▓▓▓▓▓▚▚▚▚▚▘▓▓▓▓▓▚▚▚▚▚▓▓██▞▚▚▚▚▚     ▚▚▚▚▚'         ,
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▓▓▓▓▓▚▚▚▚▚▘▓▓▓▓▚▚▚▚▚▓███  ▚▚▚▚      ▚▚▚▚▚'         ,
    \ '         ▏ ▚▚▚▚▚▚▚▚▚▒▒▒▒▒▒▒▓▓▓▚▚▚▚▞▞▓▓▓▓▓▚▚▚▚▓██   ▚▚▚▚▚     ▚▚▚▚▚'          ,
    \ '         ▏ ▚▚▚▚▚▚▒▒▒▒    ▒▒▒▒▚▚▚▚▚▚▓▓▓▓▓▚▚▚▚▚██    ▚▚▚▚     ▚▚▚▚▚▚'          ,
    \ '         ▔▁▀▒▒▒▒▒▒         ▒▒▚▚▚▚▚▚▚▚▓▓▓▚▚▚▚▚▚    ▚▚▚▚▚▚    ▚▚▚▚▚▚▚'         ,
    \ '           ▔                  ▒▒▓▓▓▓▓▓▓▓███'                                 ,
    \ '                               ▒▒▒▓▓▓▓███'                                   ,
    \ '                                 ▒▒▒▓██▓'                                    ,
    \ '                                   ▒█▓'                                      ,
    \ ])

" 自动显示文档
"autocmd CursorHold  * if &filetype !=# "vim" | call autocomplete#ShowDocumentation()

let g:Lf_GtagsAutoGenerate = 1

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


if executable('rg') 
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '      .shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

"set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
 "let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
