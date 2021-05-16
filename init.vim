if exists('g:vscode')
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/vscode.vim'
    finish
endif

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/core.vim'

" 设置代码模版触发器
let g:UltiSnipsExpandTrigger       = '<c-j>'
let g:UltiSnipsJumpForwardTrigger  = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
" visual 的时候使用<C-J>来使用visual placeholder

"let g:sneak#s_next = 1


" leaderf使用悬浮窗来显示
let g:Lf_WindowPosition = 'popup' 

set backspace=indent,eol,start

" 设置leader为空格
let mapleader = " "
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

let g:UltiSnipsEditSplit="vertical"
let g:vmt_auto_update_on_save = 1

let g:Lf_ShortcutB = '<LEADER>bs'                               
let g:Lf_ShortcutF = ''

set cursorline

let g:buftabline_numbers = 2
let g:buftabline_separators = 1 

let g:quickrun#default_config = {
\ '_': {
    \ "runner":"terminal",
  \ }
\ }

command! Todo exe "Rg #TODO"
command! Note exe "Rg #NOTE"

command! HomePage call startify#insane_in_the_membrane(0)
command! SourceCurrentFile exe "source %"
command! ChunkInfo exe "CocCommand git.chunkInfo" 
command! ChuckStage exe "CocCommand git.chunkStage" 
command! ChunkUndo exe "CocCommand git.chunkUndo" 


" 自动命令
"autocmd FileType python call autocomplete#UseKite()
"autocmd BufNew,BufEnter *.man setlocal filetype=man
"autocmd BufEnter,BufNew,BufRead *.{markdown,json} set concealcursor=c


" if hidden is not set, TextEdit might fail.
set hidden

set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

let g:rooter_patterns = ['.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/', '.hgignore','.cquery']

" 在使用O换行时不自动添加注释行
augroup Format-Options  
    autocmd!  
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o  
  
    " This can be done as well instead of the previous line, for setting formatoptions as you choose:  
    autocmd BufEnter * setlocal formatoptions=crqn2l1j  
augroup END

"let g:bookmark_save_per_working_dir = 1

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


let g:quickui_border_style = 2
let g:quickui_color_scheme = 'gruvbox'

let g:mkdp_auto_start = 0
let g:tex_flavor = 'latex'

let g:vim_json_syntax_conceal = 0
"let g:indentLine_concealcursor = 'c' 

 
let g:vimtex_view_method= 'skim'
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

" 自动source .vim中的配置文件
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


" terminal_help
let g:terminal_height = 20 
let g:terminal_pos = 'botright'

let g:go_template_autocreate = 0


"let g:UltiSnipsSnippetDir=[$HOME . '/.config/nvim/UltiSnips']

let g:go_template_use_pkg = 1
let g:go_gopls_enabled = 0
let g:go_rename_command = 'gopls'
let g:go_fmt_fail_silently = 1
let g:go_def_mapping_enabled = 0

"autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

let g:templates_no_autocmd = 1

autocmd WinEnter,InsertLeave * set cursorline

autocmd WinLeave,InsertEnter * set nocursorline





let g:vimspector_enable_mappings = 'HUMAN'

let g:switch_mapping = "-"


"set guifont=MenloBoldItalic:h11
"set guifont=menlo:h11
"let g:choosewin_overlay_enable = 1


let g:dash_map = {
            \ 'vue':'javascript'
            \ }


let g:tiler#layout='bottom'


let g:tiler#popup#windows = {
\    'terminal': { 'position': 'bottom', 'size': 10, 'filetype': 'terminal', 'order': 3 },
\    'nerdtree': { 'position': 'left', 'size': 10, 'filetype': 'nerdtree', 'order': 2 },
\    'tagbar': { 'position': 'right', 'size': 10, 'filetype': 'tagbar', 'order': 1 },
\ }



let g:terminal_key = ''

let g:neoterm_default_mod='botright'




"let g:ale_echo_cursor = 0
"let g:ale_virtualtext_cursor = 1

"hi CocWarningSign  ctermfg=Brown guifg=#ff922b
"hi CocErrorSign  ctermfg=Red guifg=#ff0000

"highlight link ALEVirtualTextError CocErrorSign

"highlight link ALEVirtualTextWarning CocWarningSign

"let g:table_mode_disable_mappings = 1

set mouse=nvi

let g:asynctasks_config_name = '.vim/tasks.ini'

let g:bookmark_save_per_working_dir = 1
