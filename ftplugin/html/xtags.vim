" Vim plugin to manage XML tags in a proper way
" Last Change: 2013 Dec 23
" Maintainer:  Alberto Granzotto <agranzot@gmail.com>
" License:     This file is placed in the public domain.


" if exists("g:loaded_xtags")
"     finish
" endif

let g:loaded_xtags = 1
let s:inline_tags = split('b i span em emph strong a')


function! s:is_block_tag(tag)
    return index(s:inline_tags, a:tag) == -1
endfunction


function! FillTag()
    exe "normal! ?<\<cr>lviw\"ty"
    exe "normal! />\<cr>a</\<esc>\"tpa>\<esc>?>\<cr>l"

    if s:is_block_tag(@t)
        exe "normal! i\<cr>\<esc>O\<tab>"
    endif
endfunction

inoremap <silent> > ><esc>:call FillTag()<cr>i
