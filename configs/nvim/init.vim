call plug#begin('~/.vim/plugged')
	" Languages
	:Plug 'neovim/nvim-lspconfig'
	:Plug 'nvim-lua/completion-nvim'

	" Search & replace
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" Misc Functionalities
	Plug '9mm/vim-closer'
	Plug 'mbbill/undotree'
	Plug 'tpope/vim-fugitive'								" Git
	Plug 'preservim/nerdcommenter'
	Plug 'voldikss/vim-floaterm'                            " Floating terminal


	" Theming & UX
	Plug 'mhartington/oceanic-next'
	Plug 'junegunn/goyo.vim' 								" Nice, centered read mode
	Plug 'ryanoasis/vim-devicons'
	Plug 'ap/vim-css-color'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
call plug#end()

for i in range(97, 122)
	let c = nr2char(i)
	exec "map \e" . c . " <M-" . c . ">"
	exec "map! \e" . c . " <M-" . c . ">"
endfor " Map alt keys to <M>

if(executable('rg'))
	let g:rg_derive_root = 'true'
endif

if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif

