nnoremap <silent> <buffer> u :<c-u>call clap#navigation#linewise('up')<CR>
nnoremap <silent> <buffer> e :<c-u>call clap#navigation#linewise('down')<CR>
inoremap <silent> <buffer> <C-u> <C-R>=clap#navigation#linewise('up')<CR>
inoremap <silent> <buffer> <C-e> <C-R>=clap#navigation#linewise('down')<CR>
