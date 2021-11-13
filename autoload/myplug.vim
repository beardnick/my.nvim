" @param p plug name
" @return whether p plug is installed
function! myplug#Loaded(p)
    if ! exists('g:plugs')
        echom 'vim-plug not installed no g:plugs'
        return
    end
    return has_key(g:plugs,a:p)
endfunction