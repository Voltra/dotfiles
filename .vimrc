" Plugins
call plug#begin('~/.vim/plugged')
	" Themes
	Plug 'mhartington/oceanic-next'
	Plug 'vim-airline/vim-airline-themes'

	" Utils
	Plug 'junegunn/fzf', {'do': { -> fzf#install() }}		" Fuzzy finding
	Plug 'junegunn/fzf.vim'
	Plug 'vim-airline/vim-airline'							" Status bar
	Plug 'tpope/vim-fugitive'								" Git
	Plug 'tpope/vim-surround'
	Plug 'preservim/nerdcommenter'


	" Language setup
	Plug 'dense-analysis/ale'								" Error checking
	Plug 'valloric/youcompleteme'							" Autocomplete
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

"" Coc plugins
" CocInstall coc-vetur coc-rls coc-phpls coc-json coc-html coc-explorer coc-css coc-cmake coc-clangd coc-tsserver

" Settings
set encoding=utf-8
set nu rnu
filetype plugin indent on
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
syntax on
set re=0

" Plugins settings
let g:netrw_banner = 0
let g:coc_disable_startup_warning = 1
let g:airline#extensions#tabline#enabled = 1
let g:vue_pre_processors = 'detect_on_enter'
let g:yats_host_keyword = 1
let g:php_version_id = 72024
let g:php_var_selector_is_identifier = 1

" Functions
function! OnBoot()
	if(argc() == 0)
		Explore .
	end
endfunction

fun! UseYcm()
	nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
	nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
	nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction


fun! UseCoc()
	inoremap <buffer> <silent><expr> <TAB>
				\ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ coc#refresh()

	inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
	inoremap <buffer> <silent><exp> <C-space> coc#refresh()

	" GoTo navigation
	nmap <buffer> <leader>gd <Plug>(coc-definition)
	nmap <buffer> <leader>gy <Plug>(coc-type-definition)
	nmap <buffer> <leader>gi <Plug>(coc-implementation)
	nmap <buffer> <leader>gr <Plug>(coc-references)
	nnoremap <buffer> <leader>cr :CocRestart
endfun



" Autocmd
autocmd VimEnter * :call OnBoot()
autocmd FileType scss set iskeyword+=-
autocmd FileType typescript,javascript,php,rust,vue :call UseYcm()
autocmd FileType cpp,cxx,h,hpp,c :call UseCoc()

" Theming
syntax enable
set t_Co=256
if(has("termguicolors"))
	set termguicolors
endif
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

" Bindings
nnoremap <C-p> :GFiles<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

