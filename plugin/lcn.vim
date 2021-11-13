if !myplug#Loaded('LanguageClient-neovim')
    finish
endif

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

let g:LanguageClient_autoStart = 1
let g:LanguageClient_autoStop = 1
let g:LanguageClient_hasSnippetSupport = 1
let g:LanguageClient_loadSettings = 1
"let g:LanguageClient_settingsPath = $HOME.'/.config/nvim/settings.json'
"let g:LanguageClient_serverCommands = {}
"let g:LanguageClient_serverCommands.go = ['~/.local/bin/gopls', '-logfile', '/tmp/gopls.log', '-rpc.trace']
"let g:LanguageClient_loggingLevel = 'DEBUG'
"let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
"let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')


" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <C-m> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <C->> <Plug>(lcn-rename)
nmap <silent> <M-CR> <Plug>(lcn-code-action)

