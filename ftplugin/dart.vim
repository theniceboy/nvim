setlocal shiftwidth=2 softtabstop=2 expandtab smarttab

noremap <c-c> :CocList --input=flutter commands<CR>

noremap <LEADER>'l :CocCommand flutter.dev.openDevLog<CR>
noremap <LEADER>'r :noa w<CR>:CocCommand flutter.dev.hotRestart<CR>
noremap <LEADER>'c :CocCommand flutter.dev.clearDevLog<CR>
