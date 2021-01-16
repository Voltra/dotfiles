call plug#begin('~/.vim/plugged')
	" Languages
	:Plug 'neovim/nvim-lspconfig'
	:Plug 'nvim-lua/completion-nvim'

	" Search & replace
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'

	" Theming & UX
	Plug 'mhartington/oceanic-next'
	Plug 'mbbill/undotree' 									" Tree for undos
	Plug 'junegunn/goyo.vim' 								" Nice, centered read mode
	Plug 'preservim/nerdcommenter'
	Plug 'christoomey/vim-tmux-navigator' 					" Buffer/tab navigator


call plug#end()



