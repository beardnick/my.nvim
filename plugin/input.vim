function! s:myLocalDb()
    let db = ZFVimIM_dbInit({
                \   'name' : 'YourDb',
                \ })
    call ZFVimIM_cloudRegister({
                \   'mode' : 'local',
                \   'dbId' : db['dbId'],
                \   'repoPath' : g:mynvim_root_path,
                \   'dbFile' : '/pinyin_huge.txt',
                \   'dbCountFile' : '/pinyin_huge_count.txt',
                \ })
endfunction
autocmd User ZFVimIM_event_OnDbInit call s:myLocalDb()
