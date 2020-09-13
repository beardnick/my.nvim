"nvim总是不兼容vi的
if &compatible
    set nocompatible
endif

let &runtimepath.=",~/.config/nvim"

let g:plugin_dir=expand('~/.cache/mynvim/')
let g:mynvim_root_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let g:mynvim_config_default=g:mynvim_root_path . '/default.vim'
let g:mynvim_config_before=expand('~/.mynvim_config_before.vim')
let g:mynvim_config_after=expand('~/.mynvim_config_after.vim')

set wildignore+=*.o,*.obj,*/.ccls-cache/*,*/vendor/*
set wildignore+=*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk

call plug#begin(g:plugin_dir)

    Plug 'morhetz/gruvbox' " 主题
    Plug 'mg979/vim-visual-multi' 
    Plug 'luochen1990/rainbow'
    " 注意编译问题，很多时候编译出错了很多插件都会有问题
    " 大部分时候可以通过call coc#util#install()解决问题
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " 自动tag生成与管理
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'skywind3000/gutentags_plus'
    " leaderf用来搜索
    "call dein#add('Yggdroot/LeaderF')
    Plug 'mhinz/vim-startify'
    Plug 'scrooloose/nerdcommenter'
    Plug 'fatih/vim-go'
    " 两个代码模版的插件要一起装，只复制代码模版文件可能会造成找不到vimsnippets模块
    Plug 'SirVer/ultisnips'
    " 使用自己fork的snippets
    Plug 'honza/vim-snippets'
    Plug 'plasticboy/vim-markdown'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'gcmt/wildfire.vim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'Krasjet/auto.pairs'
    Plug 'godlygeek/tabular'
    " 三个插件加起来有最好的文件搜索体验
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tweekmonster/fzf-filemru'
    Plug 'Yggdroot/indentLine'
    Plug 'tyru/open-browser.vim'
    Plug 'airblade/vim-rooter'
    " 切换自定义格式的工具
    Plug 'AndrewRadev/switch.vim'
    Plug 'ap/vim-buftabline'

    Plug 'junegunn/goyo.vim'
    Plug 'freitass/todo.txt-vim'
    " 提供了一些好用的command用于调试vimscript
    Plug 'tpope/vim-scriptease'
    " 在vim中访问各种数据库
    Plug 'tpope/vim-dadbod'
    Plug 'tpope/vim-dispatch'
    Plug 'andymass/vim-matchup'
    "添加tmux框中文字的补全源
    Plug 'wellle/tmux-complete.vim'
    "记录上一次打开文件的位置
    "它会使jumplist出问题
    "Plug 'farmergreg/vim-lastplace'
    "全局修改插件
    Plug 'brooth/far.vim'
    " vimtex viewer 带了实时预览的功能
    Plug 'lervag/vimtex'
    Plug 'skywind3000/vim-quickui'
    Plug 'skywind3000/asynctasks.vim'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'skywind3000/vim-terminal-help'
    Plug 'skywind3000/vim-keysound'
    Plug 'aperezdc/vim-template'
    Plug 'voldikss/vim-floaterm' 
    Plug 'zenbro/mirror.vim' 
    Plug 'antoinemadec/coc-fzf' 
    Plug 'liuchengxu/vista.vim' 
    Plug 'puremourning/vimspector' 
    Plug 'dearrrfish/vim-applescript' 
    Plug 'skywind3000/vim-dict'
    Plug 'kristijanhusak/vim-dadbod-ui'
    Plug 'akiyosi/gonvim-fuzzy'
    Plug 'joshdick/onedark.vim'
    Plug 'challenger-deep-theme/vim',{'name':'challenger-deep-theme'} 
    Plug 'sickill/vim-monokai' " monokai theme
    Plug 'kurkale6ka/vim-swap' " visualmode <Leader>x交换位置
    Plug 'tpope/vim-dotenv'
    Plug 'itchyny/lightline.vim'
    Plug 'rakr/vim-one'
    Plug 'tomasiser/vim-code-dark' " vscode主题
    Plug 'markonm/traces.vim' " 在命令模式中高亮正则表达式
    Plug 't9md/vim-choosewin'
    Plug 'szw/vim-maximizer'
    Plug 'wellle/targets.vim' " 千奇百怪的textobject支持
    Plug 'rizzatti/dash.vim'
    Plug 'drmikehenry/vim-fixkey'
    Plug 'posva/vim-vue'
    Plug 'easymotion/vim-easymotion' " 快速跳转
    Plug 'nvim-treesitter/nvim-treesitter' 
    Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'kassio/neoterm'

call plug#end()


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
                            \,'coc-python'
                            \,'coc-rls'
                            \,'coc-solargraph'
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
                            \,'coc-highlight'
                            \,'coc-lua'
                            \]

silent! execute 'source ' . g:mynvim_config_default
silent! execute 'source ' . g:mynvim_config_before

call utils#source_path(g:mynvim_root_path,"ui")
call utils#source_path(g:mynvim_root_path,"plugin")
call utils#source_path(g:mynvim_root_path,"lang")

silent! execute 'source ' . g:mynvim_config_after
call utils#source_file(g:mynvim_root_path, 'keybinding.vim')

