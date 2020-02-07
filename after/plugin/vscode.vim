if exists('g:vscode')

function s:VVSCodeCall(cmd) abort
    let startLine = line("v")
    let endLine = line(".")
    call VSCodeNotifyRange(a:cmd, startLine, endLine, 1)
endfunction

nnoremap <LEADER><LEADER> :<C-u>call VSCodeCall("workbench.action.showCommands")<CR>

nnoremap <LEADER>; :<C-U>call VSCodeCall("editor.action.commentLine")<CR>
vnoremap <LEADER>; :<C-U>call <SID>VVSCodeCall("editor.action.commentLine")<CR>

nnoremap <C-P> :<C-U>call VSCodeCall("workbench.action.quickOpen")<CR>
"nnoremap <C-L> :<C-U>call VSCodeCall("workbench.action.quickOpen")<CR>


" file
nnoremap <silent><LEADER>fs :<C-U>call VSCodeCall("workbench.action.quickOpen")<CR>
nnoremap <silent><LEADER>ft :<C-U>call VSCodeCall("workbench.files.action.focusFilesExplorer")<CR>



" tag
nnoremap <LEADER>tb :<C-U>call VSCodeCall("outline.focus")<CR>


" search
"nnoremap <Leader>sw :<C-U>Rg <C-R><C-W><CR>
nnoremap <Leader>sr :<C-U>call VSCodeCall("workbench.action.findInFiles")<CR>
nnoremap <Leader>sf :<C-U>call VSCodeCall("workbench.action.quickOpen")<CR>

nnoremap K :<C-U>call VSCodeCall("editor.action.showHover")<CR>

endif

