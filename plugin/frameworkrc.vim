" frameworkrc.vim - Manage your framework specific vim settings
" Maintainer: Edvin Malinovskis <github@edvin.io>
" Version: 0.1

" Location for different framework configs
if !exists('g:FrameworkrcConfigDir')"{{{
	let g:FrameworkrcConfigDir = expand("$HOME/.vim/configs/")
endif"}}}

" Create the config dir if it doesn't already exist
if !isdirectory(g:FrameworkrcConfigDir)"{{{
    silent call mkdir(g:FrameworkrcConfigDir, 'p')
endif"}}}

" Name for the files that tells the plugin what file to load
if !exists('g:FrameworkrcFile')"{{{
    let g:FrameworkrcFile = '.frameworkrc'
endif"}}}

" Look for an inherited FrameworkrcFile and load the appropriate config
function! FrameworkrcLoadFramework()"{{{
    let rcfile = findfile(g:FrameworkrcFile, ';')
    if filereadable(rcfile)
        let file = readfile(rcfile)
        if (len(file) < 1)
            echo g:FrameworkrcFile.' file is empty!'
        else
            let filename = file[0].'.vim'
            let full_path = g:FrameworkrcConfigDir.filename
            if filereadable(full_path)
                execute "source " . full_path
            endif
        endif
    endif
endfunction"}}}

" Attempt to load apropriate .frameworkrc file
augroup frameworkrc_load"{{{
    autocmd!
    autocmd FileType * call FrameworkrcLoadFramework()
augroup END"}}}
