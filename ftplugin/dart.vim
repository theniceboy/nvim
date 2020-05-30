setlocal shiftwidth=2 softtabstop=2 expandtab smarttab

fu! CreateConstructor()
	execute "normal Vf}uyf}P"
	execute "normal Vf}uJ"
	execute "normal 0dw"
	execute "normal V"
	:'<,'>s/\v;/,/g
	execute "normal \<esc\>"
	execute "normal uIxvNS}vInS)"
	execute "normal \<esc\>"
	execute "normal F{f"
	execute "normal Nwywf{fNPF{eVf{uyf}p"
	execute "normal Vf}uJ"
	execute "normal V"
	:'<,'>s/\v(\w+)%(%(\w|\<|\>)+) (\w+);/this.\2 = \2;\r/g
	execute "normal \<esc\>"
	execute "normal F)A{"
	execute "normal \<esc\>"
	execute "normal F}xf}P"
endfunction

noremap <leader>cf :call CreateConstructor()<CR>

nnoremap \f :call SaveDartWithFix()<CR>
function SaveDartWithFix()
	let g:dartfmt_options = " -l 100 --fix"
	:DartFmt
	let g:dartfmt_options = " -l 100 "
endfunction
