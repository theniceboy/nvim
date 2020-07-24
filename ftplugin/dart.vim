setlocal shiftwidth=2 softtabstop=2 expandtab smarttab

nnoremap \f :call SaveDartWithFix()<CR>
function SaveDartWithFix()
	let g:dartfmt_options = " -l 100 --fix"
	:DartFmt
	let g:dartfmt_options = " -l 100 "
endfunction

noremap <c-c> :CocList --input=flutter commands<CR>
