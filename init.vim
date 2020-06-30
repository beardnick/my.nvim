if exists('g:vscode')
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/vscode.vim'
    finish
endif

"nvim总是不兼容vi的
if &compatible
    set nocompatible
endif

let g:DEIN=expand('~/.cache/mynvim/repos/github.com/Shougo/dein.vim')
let g:PLUGINS=expand('~/.cache/mynvim/')
" dein的路径
let &runtimepath.="," . g:DEIN
let &runtimepath.=",~/.config/nvim"
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
    "call dein#add('neoclide/coc.nvim',{'build':'./install.sh'})
    call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
    "call dein#add('neoclide/coc.nvim', {'merged':0, 'build': 'yarn install --frozen-lockfile'})
    " tagbar用来显示tag
    "call dein#add('majutsushi/tagbar')
    " 自动tag生成与管理
    call dein#add('ludovicchabant/vim-gutentags')
    " leaderf用来搜索
    "call dein#add('Yggdroot/LeaderF')
    call dein#add('mhinz/vim-startify')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('fatih/vim-go')
    " 两个代码模版的插件要一起装，只复制代码模版文件可能会造成找不到vimsnippets模块
    call dein#add('SirVer/ultisnips')
    " 使用自己fork的snippets
    call dein#add('beardnick/vim-snippets')
    call dein#add('plasticboy/vim-markdown')
    call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
					\ 'build': 'sh -c "cd app & yarn install"' })
    "call dein#add('lvht/tagbar-markdown')
    call dein#add('dhruvasagar/vim-table-mode')
    call dein#add('gcmt/wildfire.vim')
    "call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-repeat')
    "call dein#add('mattesgroeger/vim-bookmarks')
    "call dein#add('airblade/vim-gitgutter')
    "call dein#add('jiangmiao/auto-pairs')
    call dein#add('Krasjet/auto.pairs')
    call dein#add('godlygeek/tabular')
    " 三个插件加起来有最好的文件搜索体验
    call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
    call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
    call dein#add('tweekmonster/fzf-filemru',{'depends': 'fzf.vim'})

    "使用task代替quickrun了
    "call dein#add('thinca/vim-quickrun')
    call dein#add('Yggdroot/indentLine')
    " 修改树
    "call dein#add('sjl/gundo.vim')
    "call dein#add('thaerkh/vim-workspace')
    "call dein#add('bronson/vim-trailing-whitespace')
    call dein#add('tyru/open-browser.vim')
    "call dein#add('airblade/vim-rooter', {'if':0})
    call dein#add('airblade/vim-rooter')
    " 切换自定义格式的工具
    call dein#add('AndrewRadev/switch.vim')
    "call dein#add('benmills/vimux')
    call dein#add('ap/vim-buftabline')

    " 自动切换输入法的工具
    " 这个容易出问题，还是不用了
    "call dein#add('xcodebuild/fcitx-vim-osx')
    "call dein#add('xcodebuild/fcitx-remote-for-osx')
    "call dein#add('mivok/vimtodo')
    call dein#add('junegunn/goyo.vim')
    call dein#add('freitass/todo.txt-vim')
    "call dein#add('svermeulen/vim-easyclip')
    "call dein#add('vim-vdebug/vdebug')
    "call dein#add('jodosha/vim-godebug')
    " 提供了一些好用的command用于调试vimscript
    call dein#add('tpope/vim-scriptease')
    " 在vim中访问各种数据库
    call dein#add('tpope/vim-dadbod')
    call dein#add('tpope/vim-dispatch')
    call dein#add('andymass/vim-matchup')
    "call dein#add('flazz/vim-colorschemes')
    "添加tmux框中文字的补全源
    call dein#add('wellle/tmux-complete.vim')
    "call dein#add('liuchengxu/vim-which-key')
    "call dein#add('voldikss/vim-translate-me')
    "记录上一次打开文件的位置
    call dein#add('farmergreg/vim-lastplace')
    "全局修改插件
    call dein#add('brooth/far.vim')
    " vimtex viewer 带了实时预览的功能
    call dein#add('lervag/vimtex')
    call dein#add('skywind3000/vim-quickui')
    call dein#add('skywind3000/asynctasks.vim')
    call dein#add('skywind3000/asyncrun.vim')
    call dein#add('skywind3000/vim-terminal-help')
    call dein#add('skywind3000/vim-keysound')
    "call dein#add('brglng/vim-sidebar-manager')
    call dein#add('aperezdc/vim-template')
    call dein#add('voldikss/vim-floaterm') 
    call dein#add('zenbro/mirror.vim') 
    call dein#add('antoinemadec/coc-fzf') 
    call dein#add('liuchengxu/vista.vim') 
    call dein#add('puremourning/vimspector') 
    call dein#add('dearrrfish/vim-applescript') 
    "call dein#add('camspiers/animate.vim') 
    "call dein#add('camspiers/lens.vim') 
    "call dein#add('dstein64/vim-win')
    call dein#add('embear/vim-localvimrc')
    call dein#add('skywind3000/vim-dict')
    call dein#add('kristijanhusak/vim-dadbod-ui')
    "call dein#add('skywind3000/ECDICT')
    call dein#add('akiyosi/gonvim-fuzzy')
    call dein#add('glacambre/firenvim', { 'hook_post_update': { _ -> firenvim#install(0) } })
    call dein#add('joshdick/onedark.vim')
    call dein#add('challenger-deep-theme/vim',{'name':'challenger-deep-theme'} )
    call dein#add('sickill/vim-monokai')
    call dein#add('kurkale6ka/vim-swap')
    call dein#add('tpope/vim-dotenv')
    call dein#add('itchyny/lightline.vim')
    call dein#add('rakr/vim-one')
    call dein#add('tomasiser/vim-code-dark')
    "call dein#add('wsdjeg/vim-todo')
    call dein#add('tjdevries/coc-zsh')
    call dein#add('markonm/traces.vim')
    call dein#add('t9md/vim-choosewin')
    call dein#add('szw/vim-maximizer')
    call dein#add('wellle/targets.vim')
    call dein#add('rizzatti/dash.vim')
    call dein#add('drmikehenry/vim-fixkey')
    call dein#add('zhamlin/tiler.vim')
    call dein#add('posva/vim-vue')
    "call dein#add('vim-pandoc/vim-pandoc') 
    "call dein#add('vim-pandoc/vim-pandoc-syntax') 
   call dein#end()
    call dein#save_state()
endif

let g:auto_install_missing_plugins = 1
if dein#check_install() && g:auto_install_missing_plugins
    call dein#recache_runtimepath()
    let g:spacevim_plugin_manager = 'dein'
    let g:spacevim_plugin_manager_processes = 10 
    " 自动安装未安装的插件
    call SpaceVim#commands#install_plugin()
endif

colorscheme onedark
"if str2nr(strftime("%H")) >= 18 || str2nr(strftime("%H")) <= 7 
"    set background=dark
"else
"    set background=light
"endif

" 属性配置
" 启用彩虹括号颜色
let g:rainbow_active = 1
" 启用git符号栏 
let g:gitgutter_enabled = 1
" 设置代码模版触发器
let g:UltiSnipsExpandTrigger       = '<c-j>'
let g:UltiSnipsJumpForwardTrigger  = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
" visual 的时候使用<C-J>来使用visual placeholder


let g:NERDDefaultAlign = 'left'
" 使通过tab对齐的文件显示对齐线,注意末尾有一个空格
set list lcs=tab:\|\ 
" 下面的只能使通过空格对齐的文件显示对齐线
let g:indentLine_enabled = 1

let g:fzf_buffers_jump = 1

"let g:tagbar_sort = 0

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project','.vim']

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
"set sidescrolloff=999
"set scrolloff=999
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
set timeoutlen=500

" 终端开启真彩色
if has("termguicolors")
    " fix bug for vim
    set t_8f=^[[38;2;%lu;%lu;%lum
    set t_8b=^[[48;2;%lu;%lu;%lum

    " enable true color
    set termguicolors
endif

" 为了markdown插件而设置的
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:UltiSnipsEditSplit="vertical"
let g:table_mode_always_active = 1
let g:vmt_auto_update_on_save = 1

let g:Lf_ShortcutB = '<LEADER>bs'                               
let g:Lf_ShortcutF = ''

set cursorline


" fzf使用悬浮窗
" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse'
" 打开 fzf 的方式选择 floating window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

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
command! Todo exe "Rg #TODO"
command! Note exe "Rg #NOTE"
command! PluginInstall call <SID>PluginInstall()
command! Run call commands#CodeRuner()
command! Refactor call CocActionAsync('refactor')
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

autocmd BufNew,BufEnter *.pdc setfiletype markdown

autocmd CursorHold * silent call CocActionAsync('highlight')

highlight default link CocHighlightText  MatchParen

highlight default link BufTabLineActive TabLineSel
highlight default link BufTabLineCurrent PmenuSel

" if hidden is not set, TextEdit might fail.
set hidden

set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

inoremap <silent><expr> <C-n>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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


let g:rooter_patterns = ['.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/', '.hgignore','.gitignore', '.cquery']

" 在使用O换行时不自动添加注释行
augroup Format-Options  
    autocmd!  
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o  
  
    " This can be done as well instead of the previous line, for setting formatoptions as you choose:  
    autocmd BufEnter * setlocal formatoptions=crqn2l1j  
augroup END

"let g:bookmark_save_per_working_dir = 1

let g:startify_padding_left = 10 

let g:startify_custom_header = startify#pad([
            \'                    .                    '
            \,'    ##############..... ##############   '
            \,'    ##############......##############   '
            \,'      ##########..........##########     '
            \,'      ##########........##########       '
            \,'      ##########.......##########        '
            \,'      ##########.....##########..        '
            \,'      ##########....##########.....      '
            \,'    ..##########..##########.........    '
            \,'  ....##########.#########.............  '
            \,'    ..################JJJ............    '
            \,'      ################.............      '
            \,'      ##############.JJJ.JJJJJJJJJJ      '
            \,'      ############...JJ...JJ..JJ  JJ     '
            \,'      ##########....JJ...JJ..JJ  JJ      '
            \,'      ########......JJJ..JJJ JJJ JJJ     '
            \,'      ######    .........                '
            \,'                  .....                  '
            \,'                    .                    '
            \     ])

" 自动显示文档
"autocmd CursorHold  * if &filetype !=# "vim" | call autocomplete#ShowDocumentation()

"let g:Lf_GtagsAutoGenerate = 1

"let g:Lf_ShowRelativePath = 0
"let g:Lf_HideHelp = 1
"let g:Lf_PreviewResult = {'Function':0, 'Colorscheme':1}

"let g:Lf_NormalMap = {
"    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
"    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
"    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
"    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
"    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
"    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
"    \ }


if executable('rg') 
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '      .shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

"set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
 "let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']

let g:quickui_border_style = 2
let g:quickui_color_scheme = 'gruvbox'

let g:mkdp_auto_start = 0
let g:tex_flavor = 'latex'

let g:vim_json_syntax_conceal = 0
"let g:indentLine_concealcursor = 'c' 

 
let g:vimtex_view_method= 'skim'
let g:vim_markdown_math = 1
let g:vim_markdown_toc_autofit = 1
let g:livepreview_engine = 'xelatex'
"let g:floaterm_position = 'topleft'
"let g:floaterm_width = 0.99 
"let g:floaterm_type = 'normal'
"if g:floaterm_type ==# 'normal'
"    let g:floaterm_height = 0.4
"else
"    let g:floaterm_height = 0.6
"endif



"autocmd BufWrite * if exists(":MirrorPush") | exe ':MirrorPush' | endif

augroup open_terminal
  autocmd!
    autocmd TermOpen * setlocal sidescroll=1 sidescrolloff=0 nonumber
    autocmd TermClose <buffer> bdelete!
augroup END

augroup find_root
    autocmd!
    autocmd BufEnter * Rooter
    autocmd User StartifyBufferOpened nested :Rooter
augroup END

function! LoadLocalConfig() abort
    let config = FindRootDirectory() . "/.vim"
    for f in split(glob(config . '/*.vim'), '\n')
        exe 'source' f
    endfor
endfunction

augroup load_local_config
    autocmd!
    "autocmd BufEnter * Rooter
    autocmd BufEnter * call LoadLocalConfig()
    "autocmd User StartifyBufferOpened nested :Rooter
augroup END


augroup conceal_filetype
    autocmd!
    autocmd FileType markdown,json setlocal concealcursor=c
augroup END


" terminal_help
let g:terminal_height = 15 
let g:terminal_pos = 'botright'

" asynctasks
let g:asynctasks_term_pos = 'bottom'
let g:asyncrun_open = 15
"let g:asynctasks_term_rows = 10    " 设置纵向切割时，高度为 10
"let g:asynctasks_term_cols = 80    " 设置横向切割时，宽度为 80
let g:asynctasks_rtp_config = "tasks.ini"

" tagbar
"let g:tagbar_map_showproto = ''

" 启动 Vim 时自动启动
let g:keysound_enable = 0

" 设置默认音效主题，可以选择：default, typewriter, mario, bubble, sword
let g:keysound_theme = 'typewriter'

" 设置音量：0-1000
let g:keysound_volume = 1000

let g:go_template_autocreate = 0


let g:templates_directory = '~/my.nvim/templates'


"let g:UltiSnipsSnippetDir=[$HOME . '/.config/nvim/UltiSnips']


let g:go_template_use_pkg = 1
let g:go_gopls_enabled = 0
let g:go_rename_command = 'gopls'
let g:go_fmt_fail_silently = 1
let g:go_def_mapping_enabled = 0

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

let g:templates_no_autocmd = 1

"
let g:coc_global_extensions =['coc-actions'
                            \,'coc-browser'
                            \,'coc-calc'
                            \,'coc-clock'
                            \,'coc-css'
                            \,'coc-dictionary'
                            \,'coc-docker'
                            \,'coc-emmet'
                            \,'coc-explorer'
                            \,'coc-git'
                            \,'coc-gitignore'
                            \,'coc-go'
                            \,'coc-highlight'
                            \,'coc-html'
                            \,'coc-java'
                            \,'coc-json'
                            \,'coc-kite'
                            \,'coc-lines'
                            \,'coc-lists'
                            \,'coc-lua'
                            \,'coc-marketplace'
                            \,'coc-omni'
                            \,'coc-omnisharp'
                            \,'coc-post'
                            \,'coc-prettier'
                            \,'coc-python'
                            \,'coc-rls'
                            \,'coc-sh'
                            \,'coc-solargraph'
                            \,'coc-sql'
                            \,'coc-syntax'
                            \,'coc-tag'
                            \,'coc-terminal'
                            \,'coc-todolist'
                            \,'coc-translator'
                            \,'coc-tsserver'
                            \,'coc-ultisnips'
                            \,'coc-utils'
                            \,'coc-vetur'
                            \,'coc-vimlsp'
                            \,'coc-vimtex'
                            \,'coc-xml'
                            \,'coc-yaml'
                            \,'coc-yank'
                            \]


let g:indentLine_fileTypeExclude = ['defx','json', 'denite','startify','tagbar','vista_kind','vista','markdown']


autocmd WinEnter,InsertLeave * set cursorline

autocmd WinLeave,InsertEnter * set nocursorline


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


function! s:fzf_sink(what)
	let p1 = stridx(a:what, '<')
	if p1 >= 0
		let name = strpart(a:what, 0, p1)
		let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
		if name != ''
			exec "AsyncTask ". fnameescape(name)
		endif
	endif
endfunction

function! s:fzf_task()
	let rows = asynctasks#source(&columns * 48 / 100)
	let source = []
	for row in rows
		let name = row[0]
		let source += [name . '  ' . row[1] . '  : ' . row[2]]
	endfor
	let opts = { 'source': source, 'sink': function('s:fzf_sink'),
				\ 'options': '+m --nth 1 --inline-info --tac' }
	if exists('g:fzf_layout')
		for key in keys(g:fzf_layout)
			let opts[key] = deepcopy(g:fzf_layout[key])
		endfor
	endif
	call fzf#run(opts)
endfunction

command! -nargs=0 AsyncTaskFzf call s:fzf_task()

let g:vimspector_enable_mappings = 'HUMAN'
let g:switch_mapping = "-"

let g:table_mode_map_prefix = ''

let g:floaterm_width = 0.5
let g:floaterm_height = 0.6

let g:floaterm_position = 'topright'
"let g:floaterm_position = 'center'
let g:floaterm_keymap_prev   = '<Leader>tp'
let g:floaterm_keymap_next   = '<Leader>tn'
let g:floaterm_keymap_toggle = '<Leader>tt'
                                
function s:floatermSettings()   
    highlight FloatermNF  ctermbg=darkblue
endfunction                     
                                
autocmd FileType floaterm call s:floatermSettings()
                                
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'method', 'modified', 'filetype'] ],
      \ 'right':[['line','percent']]
      \ },
      \ 'component_function':{'blame':'LightlineGitBlame'},
      \ }


function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

"set guifont=MenloBoldItalic:h11
"let g:choosewin_overlay_enable = 1

let g:vista_default_executive = 'coc'

let g:dash_map = {
            \ 'vue':'javascript'
            \ }


let g:tiler#layout='bottom'


let g:tiler#popup#windows = {
\    'terminal': { 'position': 'bottom', 'size': 10, 'filetype': 'terminal', 'order': 3 },
\    'nerdtree': { 'position': 'left', 'size': 10, 'filetype': 'nerdtree', 'order': 2 },
\    'tagbar': { 'position': 'right', 'size': 10, 'filetype': 'tagbar', 'order': 1 },
\ }
