fun! LspConfig()
	set completeopt=menuone,noinsert,noselect
	set shortmess+=c

	nnoremap <leader>va :lua vim.lsp.buf.definition()<CR>
	nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
	nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
	nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
	nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
	nnoremap <leader>vrn :lua vim.lsp.buf.renam()<CR>
	nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
	nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
	nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics()<CR>

	let g:completion_matching_strategy_list = ["exact", "substring", "fuzzy"]

	lua require'lspconfig'.clangd.setup{ on_attach = require'completion'.on_attach }
	lua require'lspconfig'.tsserver.setup{ on_attach = require'completion'.on_attach }
	lua require'lspconfig'.vuels.setup{ on_attach = require'completion'.on_attach }
	lua require'lspconfig'.vimls.setup{ on_attach = require'completion'.on_attach }
	lua require'lspconfig'.sqlls.setup{ on_attach = require'completion'.on_attach }
	lua require'lspconfig'.jsonls.setup{ on_attach = require'completion'.on_attach }
	lua require'lspconfig'.intelephense.setup{ on_attach = require'completion'.on_attach }
	lua require'lspconfig'.html.setup{ on_attach = require'completion'.on_attach }
	lua require'lspconfig'.cssls.setup{ on_attach = require'completion'.on_attach }
	lua require'lspconfig'.cmake.setup{ on_attach = require'completion'.on_attach }
	lua require'lspconfig'.bashls.setup{ on_attach = require'completion'.on_attach }

	inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
endfun

call LspConfig()
