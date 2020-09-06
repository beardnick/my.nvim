if exists('g:vscode')
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/vscode.vim'
    finish
endif

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/core.vim'

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
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project','go.mod','README',"README.md",".gitignore"]

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

"let g:sneak#s_next = 1


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
let g:table_mode_always_active = 0
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

 "use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}\ >\ 

let g:rooter_patterns = ['.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/', '.hgignore','.gitignore', '.cquery']

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


augroup conceal_filetype
    autocmd!
    autocmd FileType markdown,json setlocal concealcursor=c
augroup END


" terminal_help
let g:terminal_height = 20 
let g:terminal_pos = 'botright'

" asynctasks
let g:asynctasks_term_pos = 'bottom'
let g:asyncrun_open = 15
"let g:asynctasks_term_rows = 50    " 设置纵向切割时，高度为 10
"let g:asynctasks_term_cols = 80    " 设置横向切割时，宽度为 80
let g:asynctasks_rtp_config = "tasks.ini"

" tagbar
"let g:tagbar_map_showproto = ''


let g:go_template_autocreate = 0


let g:templates_directory = '~/my.nvim/templates'


"let g:UltiSnipsSnippetDir=[$HOME . '/.config/nvim/UltiSnips']


let g:go_template_use_pkg = 1
let g:go_gopls_enabled = 0
let g:go_rename_command = 'gopls'
let g:go_fmt_fail_silently = 1
let g:go_def_mapping_enabled = 0

"autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

let g:templates_no_autocmd = 1



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


                                

"set guifont=MenloBoldItalic:h11
"set guifont=menlo:h11
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


"let g:table_mode_disable_tableize_mappings = 1

"let g:table_mode_disable_mappings = 1

let g:table_mode_map_prefix = '_'

let g:terminal_key = ''

let g:neoterm_default_mod='rightbelow'


autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,                    -- false will disable the whole extension
        disable = { 'rust','md'},        -- list of language that will be disabled
    },
    incremental_selection = {
        enable = true,
        disable = { 'cpp', 'lua' },
        keymaps = {                       -- mappings for incremental selection (visual mappings)
          init_selection = 'gnn',         -- maps in normal mode to init the node/scope selection
          node_incremental = "grn",       -- increment to the upper named parent
          scope_incremental = "grc",      -- increment to the upper scope (as defined in locals.scm)
          node_decremental = "grm",       -- decrement to the previous node
        }
    },
    refactor = {
      highlight_defintions = {
        enable = true
      },
      smart_rename = {
        enable = true,
        smart_rename = "grr"              -- mapping to rename reference under cursor
      },
      navigation = {
        enable = true,
        goto_definition = "gnd",          -- mapping to go to definition of symbol under cursor
        list_definitions = "gnD"          -- mapping to list all definitions in current file
      }
    },
    ensure_installed = 'all' -- one of 'all', 'language', or a list of languages
}
EOF

"let g:ale_echo_cursor = 0
"let g:ale_virtualtext_cursor = 1

"hi CocWarningSign  ctermfg=Brown guifg=#ff922b
"hi CocErrorSign  ctermfg=Red guifg=#ff0000

"highlight link ALEVirtualTextError CocErrorSign

"highlight link ALEVirtualTextWarning CocWarningSign

"let g:table_mode_disable_mappings = 1
