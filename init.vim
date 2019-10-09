" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @theniceboy

" Checkout-list
" vim-esearch
" fmoralesc/worldslice
" SidOfc/mkdx


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
"set clipboard=unnamed
let &t_ut=''
set autochdir


" ===
" === Editor behavior
" ===
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
" set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
exec "nohlsearch"
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=80

" Cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behavior
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Save & quit
noremap Q :q<CR>
noremap S :w<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Open Startify
noremap <LEADER>st :Startify<CR>

" Undo operations
noremap l u

" Insert Key
noremap k i
noremap K I

" Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR>

" Joining lines
noremap H J

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
noremap <LEADER>tt :%s/  /\t/g

" Folding
noremap <silent> <LEADER>o za


" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"		 ^
"		 u
" < n	 i >
"		 e
"		 v
noremap <silent> u k
noremap <silent> n h
noremap <silent> e j
noremap <silent> i l

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 5k
noremap <silent> E 5j

" N key: go to the start of the line
noremap <silent> N 0
" I key: go to the end of the line
noremap <silent> I $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" set h (same as n, cursor left) to 'end of word'
noremap h e

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>n <C-w>h
noremap <LEADER>i <C-w>l

" Disabling the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>


" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/snippits.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===

" Move the next character to the end of the line with ctrl+9
inoremap <C-u> <ESC>lx$p

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" Press ` to change case (instead of ~)
noremap ` ~

noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
noremap tx :r !figlet

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!chromium % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc


" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

" Testing my own plugin
Plug 'theniceboy/vim-calc'

Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'OmniSharp/omnisharp-vim'


" Pretty Dress
Plug 'theniceboy/eleline.vim'
Plug 'bling/vim-bufferline'
"Plug 'liuchengxu/space-vim-theme'
"Plug 'morhetz/gruvbox'
"Plug 'ayu-theme/ayu-vim'
"Plug 'rakr/vim-one'
"Plug 'mhartington/oceanic-next'
"Plug 'kristijanhusak/vim-hybrid-material'
Plug 'ajmwagar/vim-deus'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
"Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf'
Plug 'francoiscabrol/ranger.vim'

" Taglist
Plug 'liuchengxu/vista.vim'

" Error checking
"Plug 'w0rp/ale'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" Other visual enhancement
"Plug 'tmhedberg/SimpylFold'
Plug 'mhinz/vim-startify'

" Git
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive' " gv dependency
Plug 'junegunn/gv.vim' " gv (normal) to show git log

" Tex
Plug 'lervag/vimtex'

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript' ", { 'for' :['javascript', 'vim-plug'] }
Plug 'jelera/vim-javascript-syntax'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Python
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'dkarter/bullets.vim', { 'for' :['markdown', 'vim-plug'] }

" For general writing
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Find & Replace
Plug 'wsdjeg/FlyGrep.vim' " Ctrl+f (normal) to find file content
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
Plug 'osyo-manga/vim-anzu'

" Other useful utilities
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
Plug 'tmhedberg/SimpylFold'
"Plug 'vim-scripts/restore_view.vim'
Plug 'AndrewRadev/switch.vim' " gs to switch
Plug 'ryanoasis/vim-devicons'
Plug 'chrisbra/Colorizer' " Show colors with :ColorHighlight
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-eunuch' " do stuff like :SudoWrite
Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc
Plug 'itchyny/calendar.vim'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'
Plug 'rbgrouleff/bclose.vim' " For ranger.vim

call plug#end()

let g:colorizer_syntax = 1


" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim


" ===
" === Dress up my vim
" ===
set termguicolors	" enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
let ayucolor="mirage"
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:one_allow_italics = 1

set list
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<


"color ayu
"color dracula
"color one
color deus

hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70

set listchars=tab:\|\ ,

nnoremap \d :call ChangeDress()<CR>
func! ChangeDress()
	if g:ayucolor == "mirage"
		let g:ayucolor = "light"
		color ayu
	else
		let g:ayucolor = "mirage"
		color ayu
	endif
endfunc

" ===================== Start of Plugin Settings =====================

let g:airline_powerline_fonts = 0


" ===
" === NERDTree
" ===
noremap tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = "N"
let NERDTreeMapUpdirKeepOpen = "n"
let NERDTreeMapOpenSplit = ""
let NERDTreeMapOpenVSplit = "I"
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapOpenInTabSilent = "O"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = ""
let NERDTreeMapChangeRoot = "l"
let NERDTreeMapMenu = ","
let NERDTreeMapToggleHidden = "zh"


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"	: "✹",
			\ "Staged"		: "✚",
			\ "Untracked" : "✭",
			\ "Renamed"	 : "➜",
			\ "Unmerged"	: "═",
			\ "Deleted"	 : "✖",
			\ "Dirty"		 : "✗",
			\ "Clean"		 : "✔︎",
			\ "Unknown"	 : "?"
			\ }


" ===
" === coc
" ===
" fix the most annoying bug that coc has
"autocmd WinEnter * call timer_start(1000, { tid -> execute('unmap if')})
"silent! autocmd BufEnter * silent! call silent! timer_start(600, { tid -> execute('unmap if')})
"silent! autocmd WinEnter * silent! call silent! timer_start(600, { tid -> execute('unmap if')})
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
"au TextChangedI * GitGutter
" Installing plugins
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-emmet', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-go', 'coc-omnisharp']
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
" Useful commands
nnoremap <silent> <space>y	:<C-u>CocList -A --normal yank<cr>
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <leader>rn <Plug>(coc-rename)


" ===
" === some error checking
" ===
" I ain't need no ale!


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>


" ===
" === FZF
" ===
noremap <C-p> :FZF<CR>


" ===
" === vim-signature
" ===
let g:SignatureMap = {
			\ 'Leader'						 :	"m",
			\ 'PlaceNextMark'			:	"m,",
			\ 'ToggleMarkAtLine'	 :	"m.",
			\ 'PurgeMarksAtLine'	 :	"dm",
			\ 'DeleteMark'				 :	"",
			\ 'PurgeMarks'				 :	"",
			\ 'PurgeMarkers'			 :	"",
			\ 'GotoNextLineAlpha'	:	"m<LEADER>",
			\ 'GotoPrevLineAlpha'	:	"",
			\ 'GotoNextSpotAlpha'	:	"m<LEADER>",
			\ 'GotoPrevSpotAlpha'	:	"",
			\ 'GotoNextLineByPos'	:	"",
			\ 'GotoPrevLineByPos'	:	"",
			\ 'GotoNextSpotByPos'	:	"",
			\ 'GotoPrevSpotByPos'	:	"",
			\ 'GotoNextMarker'		 :	"",
			\ 'GotoPrevMarker'		 :	"",
			\ 'GotoNextMarkerAny'	:	"",
			\ 'GotoPrevMarkerAny'	:	"",
			\ 'ListLocalMarks'		 :	"m/",
			\ 'ListLocalMarkers'	 :	"m?"
			\ }


" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1


" ==
" == vim-multiple-cursor
" ==
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key			= '<c-k>'
let g:multi_cursor_select_all_word_key = '<a-k>'
let g:multi_cursor_start_key					 = 'g<c-k>'
let g:multi_cursor_select_all_key			= 'g<a-k>'
let g:multi_cursor_next_key						= '<c-k>'
let g:multi_cursor_prev_key						= '<c-p>'
let g:multi_cursor_skip_key						= '<C-x>'
let g:multi_cursor_quit_key						= '<Esc>'


" ==
" == thesaurus_query
" ==
noremap <LEADER>th :ThesaurusQueryLookupCurrentWord<CR>


" Startify
let g:startify_lists = [
			\ { 'type': 'files',		 'header': ['	 MRU']						},
			\ { 'type': 'bookmarks', 'header': ['	 Bookmarks']			},
			\ { 'type': 'commands',	'header': ['	 Commands']			 },
			\ ]


" ===
" === Far.vim
" ===
nnoremap <silent> <LEADER>f :F	%<left><left>

" ===
" === vim-calc
" ===
noremap <LEADER>a :call Calc()<CR>
" Testing
"if !empty(glob('~/Github/vim-calc/vim-calc.vim'))
"source ~/Github/vim-calc/vim-calc.vim
"endif


" ===
" === emmet
" ===
let g:user_emmet_leader_key='<c-]'


" ===
" === Bullets.vim
" ===
let g:bullets_set_mappings = 0


" ===
" === Vista.vim
" ===
noremap <silent> T :Vista!!<CR>
noremap <silent> <C-t> :Vista finder<CR>
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"let g:vista_default_executive = 'ctags'
" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']


" ===
" === Ranger.vim
" ===
nnoremap R :Ranger<CR>


" ===
" === fzf-gitignore
" ===
noremap <LEADER>gi <Plug>(fzf-gitignore)


" ===
" === Ultisnips
" ===
let g:tex_flavor = "latex"
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"


" vim-latex-live-preview
"let g:livepreview_previewer = "zathura"


" ===
" === vimtex
" ===
"let g:vimtex_view_method = ''
let g:vimtex_view_general_viewer = 'llpp'
let maplocalleader=' '


" ===
" === FlyGrep
" ===
nnoremap <c-f> :FlyGrep<CR>


" ===
" === GV
" ===
nnoremap gv :GV<CR>


" ===
" === vim-calendar
" ===
noremap \c :Calendar -position=here<CR>
noremap \\ :Calendar -view=clock -position=here<CR>
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
augroup calendar-mappings
	autocmd!
	" diamond cursor
	autocmd FileType calendar nmap <buffer> u <Plug>(calendar_up)
	autocmd FileType calendar nmap <buffer> n <Plug>(calendar_left)
	autocmd FileType calendar nmap <buffer> e <Plug>(calendar_down)
	autocmd FileType calendar nmap <buffer> i <Plug>(calendar_right)
	autocmd FileType calendar nmap <buffer> <c-u> <Plug>(calendar_move_up)
	autocmd FileType calendar nmap <buffer> <c-n> <Plug>(calendar_move_left)
	autocmd FileType calendar nmap <buffer> <c-e> <Plug>(calendar_move_down)
	autocmd FileType calendar nmap <buffer> <c-i> <Plug>(calendar_move_right)
	autocmd FileType calendar nmap <buffer> k <Plug>(calendar_start_insert)
	autocmd FileType calendar nmap <buffer> K <Plug>(calendar_start_insert_head)
	" unmap <C-n>, <C-p> for other plugins
	autocmd FileType calendar nunmap <buffer> <C-n>
	autocmd FileType calendar nunmap <buffer> <C-p>
augroup END


" ===
" === Anzu
" ===
"noremap = <Plug>(anzu-n-with-echo)
"noremap - <Plug>(anzu-N-with-echo)
"noremap * <Plug>(anzu-star-with-echo)
"noremap # <Plug>(anzu-sharp-with-echo)
set statusline=%{anzu#search_status()}
nnoremap = n
nnoremap - N

" ===
" === vim-go
" ===
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
"let g:go_def_mapping_enabled = 1
noremap <LEADER>q <C-w>j:q<CR>
let g:go_highlight_array_whitespace_error    = 1
let g:go_highlight_build_constraints         = 1
let g:go_highlight_extra_types               = 1
let g:go_highlight_fields                    = 1
let g:go_highlight_function_calls            = 1
let g:go_highlight_function_parameters       = 1
let g:go_highlight_functions                 = 1
let g:go_highlight_generate_tags             = 1
let g:go_highlight_methods                   = 1
let g:go_highlight_operators                 = 1
let g:go_highlight_space_tab_error           = 1
let g:go_highlight_structs                   = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_types                     = 1
let g:go_highlight_variable_assignments      = 0
let g:go_highlight_variable_declarations     = 0


nnoremap <tab> :Autoformat<CR>
"let g:OmniSharp_highlight_types = 2
"let g:OmniSharp_highlight_groups = {
			"\ 'csUserIdentifier': [
			"\   'constant name', 'enum member name', 'field name', 'identifier',
			"\   'local name', 'parameter name', 'property name', 'static symbol'],
			"\ 'csUserInterface': ['interface name'],
			"\ 'csUserMethod': ['extension method name', 'method name'],
			"\ 'csUserType': ['class name', 'enum name', 'namespace name', 'struct name']
			"\}

"" Use the stdio OmniSharp-roslyn server

"" Set the type lookup function to use the preview window instead of echoing it
""let g:OmniSharp_typeLookupInPreview = 1

"" Timeout in seconds to wait for a response from the server
"let g:OmniSharp_timeout = 5

"" Don't autoselect first omnicomplete option, show options even if there is only
"" one (so the preview documentation is accessible). Remove 'preview' if you
"" don't want to see any documentation whatsoever.
"set completeopt=longest,menuone,preview

"" Fetch full documentation during omnicomplete requests.
"" By default, only Type/Method signatures are fetched. Full documentation can
"" still be fetched when you need it with the :OmniSharpDocumentation command.
""let g:omnicomplete_fetch_full_documentation = 1

"" Set desired preview window height for viewing documentation.
"" You might also want to look at the echodoc plugin.
"set previewheight=5

"" Tell ALE to use OmniSharp for linting C# files, and no other linters.
"let g:ale_linters = { 'cs': ['OmniSharp'] }

"" Update semantic highlighting on BufEnter and InsertLeave
"let g:OmniSharp_server_path = '/home/david/.cache/omnisharp-vim/omnisharp-roslyn/run'
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 1

set updatetime=500

sign define OmniSharpCodeActions text=💡

augroup OSCountCodeActions
  autocmd!
  autocmd FileType cs set signcolumn=yes
  autocmd CursorHold *.cs call OSCountCodeActions()
augroup END

function! OSCountCodeActions() abort
  if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
  if !OmniSharp#IsServerRunning() | return | endif
  let opts = {
  \ 'CallbackCount': function('s:CBReturnCount'),
  \ 'CallbackCleanup': {-> execute('sign unplace 99')}
  \}
  call OmniSharp#CountCodeActions(opts)
endfunction

function! s:CBReturnCount(count) abort
  if a:count
    let l = getpos('.')[1]
    let f = expand('%:p')
    execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
  endif
endfunction


" ===================== End of Plugin Settings =====================

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif

