" 使通过tab对齐的文件显示对齐线,注意末尾有一个空格
set list lcs=tab:\|\ 
" 下面的只能使通过空格对齐的文件显示对齐线
let g:indentLine_enabled = 1

let g:indentLine_fileTypeExclude = ['defx','json', 'denite','startify','tagbar','vista_kind','vista','markdown']
