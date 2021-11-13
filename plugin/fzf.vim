if !myplug#Loaded('fzf.vim')
    finish
endif

let g:fzf_buffers_jump = 1

let g:fzf_history_dir = '~/.local/share/fzf-history'

" fzf使用悬浮窗
" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse'
" 打开 fzf 的方式选择 floating window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" 自定义指令
command! -bang -nargs=? -complete=dir Cheats
  \ call fzf#vim#files("~/.cheat", fzf#vim#with_preview(), <bang>0)

command! VMaps call fzf#vim#maps("v", <bang>0) 
command! IMaps call fzf#vim#maps("i", <bang>0) 


if executable('rg') 
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '      .shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif


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


nnoremap <silent><C-P> :<C-U>Files<CR>
nnoremap <silent><LEADER>hv :<C-U>Helptags<CR>
nnoremap <silent><LEADER>hm :<C-U>Maps<CR>
nnoremap <silent><LEADER>hc :<C-U>Cheats<CR>
nnoremap <Leader>sr  :<C-U>Rg<CR>
nnoremap <Leader>st :<C-U>Tags<CR>

nnoremap <silent> <Leader>sh  :<C-u>History:<CR>

nnoremap <Leader>sl  :<C-U>Lines<CR>
nnoremap <Leader>sb :<C-U>Buffers<CR>
