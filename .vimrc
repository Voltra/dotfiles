" Plugins
call plug#begin('~/.vim/plugged')
	" Themes
	Plug 'mhartington/oceanic-next'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ryanoasis/vim-devicons'
	Plug 'ap/vim-css-color'

	" Utils
	Plug 'junegunn/fzf', {'do': { -> fzf#install() }}		" Fuzzy finding
	Plug 'junegunn/fzf.vim'
	Plug 'vim-airline/vim-airline'							" Status bar
	Plug 'tpope/vim-fugitive'								" Git
	Plug 'preservim/nerdcommenter'
	Plug 'christoomey/vim-tmux-navigator' 					" Buffer/tab navigator
	Plug 'jremmen/vim-ripgrep' 								" Grep in vim
	Plug 'vim-utils/vim-man' 								" Man pages in vim
	Plug 'mbbill/undotree' 									" Tree for undos
	Plug 'junegunn/goyo.vim' 								" Nice, centered read mode

	" Language setup
	Plug 'dense-analysis/ale'								" Error checking
	Plug 'neoclide/coc.nvim', {'branch': 'release'}			" Autocomplete
	Plug 'sheerun/vim-polyglot'								" Syntax highlighting
	Plug 'jwalton512/vim-blade'
	Plug 'vim-jp/vim-cpp'
	Plug 'pboettch/vim-cmake-syntax'
	Plug 'JulesWang/css.vim'
	Plug 'ekalinin/Dockerfile.vim'
	Plug 'othree/html5.vim'
	Plug 'elzr/vim-json'
	Plug 'othree/yajs.vim'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'StanAngeloff/php.vim'
	Plug 'rust-lang/rust.vim'
	Plug 'cakebaker/scss-syntax.vim'
	Plug 'lumiliet/vim-twig'
	Plug 'HerringtonDarkholme/yats.vim'
	Plug 'posva/vim-vue'
call plug#end()

" Settings
set encoding=utf-8
set nu rnu nowrap
filetype plugin indent on
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 smartindent
syntax on
set re=0 incsearch noerrorbells
set undodir=~/.vim/undodir undofile
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Plugins settings
let mapleader = " "
let g:netrw_banner = 0
let g:netrw_liststyle = 3 " tree
let g:netrw_browse_split = 4 
let g:netrw_winsize = 25
let g:coc_disable_startup_warning = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_whitespace = 0
let g:airline_section_warning = ' '
let g:vue_pre_processors = 'detect_on_enter'
let g:yats_host_keyword = 1
let g:php_version_id = 72024
let g:php_var_selector_is_identifier = 1
let g:coc_global_extensions = [
	\'coc-vetur',
	\'coc-phpls',
	\'coc-json',
	\'coc-html',
	\'coc-css',
	\'coc-cmake',
	\'coc-clangd',
	\'coc-tsserver',
	\'coc-pairs'
\]
let g:goyo_height = '100%'
let g:goyo_linenr = 1

if(executable('rg'))
	let g:rg_derive_root = 'true'
endif

" Functions
function! OnBoot()
	if(argc() == 0)
		Explore .
	end

	:call UseCoc()
endfunction

fun! UseYcm()
	nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
	nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
	nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
	nnoremap <buffer> <silent> <S-F6> :YcmCompleter RefactorRename<space>
endfun

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! s:show_documentation()
	if index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

fun! UseCoc()
	inoremap <buffer> <silent><expr> <TAB>
				\ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ coc#refresh()

	inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
	inoremap <buffer> <silent><expr> <C-space> coc#refresh()

	" GoTo navigation
	nmap <buffer> <leader>gd <Plug>(coc-definition)
	nmap <buffer> <leader>gy <Plug>(coc-type-definition)
	nmap <buffer> <leader>gi <Plug>(coc-implementation)
	nmap <buffer> <leader>gr <Plug>(coc-references)
	nmap <buffer> <leader>rr <Plug>(coc-rename)
	nmap <buffer> <S-F6> <Plug>(coc-rename)
	nnoremap <buffer> <leader>cr :CocRestart

	set hidden cmdheight=2 updatetime=500 shortmess+=c
	if has("patch-8.1.1564")
		  " Recently vim can merge signcolumn and number column into one
		set signcolumn=number
	else
		set signcolumn=yes
	endif

	if exists('*complete_info')
		inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	else
		inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	endif

	nnoremap <silent> <C-k> :call <SID>show_documentation()<CR>
	autocmd CursorHold * silent call CocActionAsync('highlight')

	augroup mygroup
		autocmd!
		" Update signature help on jump placeholder.
		autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
endfun



" Autocmd
autocmd VimEnter * :call OnBoot()
autocmd FileType scss set iskeyword+=-
"""autocmd FileType typescript,javascript,php,rust,vue :call UseYcm()
"""autocmd FileType cpp,cxx,h,hpp,c :call UseCoc()

" Theming
syntax enable
set t_Co=256
if(has("termguicolors"))
	set termguicolors
endif
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

" Bindings
for i in range(97, 122)
	let c = nr2char(i)
	exec "map \e" . c . " <M-" . c . ">"
	exec "map! \e" . c . " <M-" . c . ">"
endfor " Map alt keys to <M>
nnoremap <C-p> :GFiles<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <C-_> <Plug>NERDCommenterToggle<CR>
nnoremap <C-t> :tabe<space>
nmap <M-h> :tabp<CR>
nmap <M-l> :tabn<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
map <A-v> :wincmd v <bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<space>
nnoremap <C-M-p> :Rg<space>
nnoremap <C-g> :Goyo<CR>

" Unbind
nnoremap <space> <Nop>
nnoremap <M-k> <Nop>
nnoremap K <Nop>
nnoremap q <Nop>
nnoremap q{0-9a-zA-Z"} <Nop>
