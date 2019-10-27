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
