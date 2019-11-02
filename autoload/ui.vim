
function! ui#WindLineLeft(column) abort
  if a:column > 50
			exe 5 . "wincmd >"
  else
			exe 5 . "wincmd <"
  endif
endfunction

function! ui#WindLineRight(column) abort
  if a:column > 50
			exe 5 . "wincmd <"
  else
			exe 5 . "wincmd >"
  endif
endfunction


function! ui#WindLineUp(row) abort
  if a:row > 50
      exe 5 "wincmd +"
  else
    exe 5 "wincmd -"
  endif
endfunction


function! ui#WindLineDown(row) abort
  if a:row > 50
      exe 5 "wincmd -"
  else
    exe 5 "wincmd +"
  endif
endfunction


function! ui#OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  " 设置浮动窗口打开的位置，大小等。
  " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  " 设置浮动窗口高亮
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

