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

	command! Format execute 'lua vim.lsb.buf.formatting()'
lua << EOF
	local nvim_lsp = require('lspconfig')
	local on_attach = function(_, bufnr)
		-- require('diagnostic').on_attach()
		require('completion').on_attach()
	end

	local servers = {'clangd', 'tsserver', 'vuels', 'vimls', 'sqlls', 'jsonls', 'intelephense','html', 'cssls', 'cmake', 'bashls'}

	for _, lsp in ipairs(servers) do
		nvim_lsp[lsp].setup{
			on_attach = on_attach,
		}
	end
EOF

	inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
endfun

call LspConfig()
