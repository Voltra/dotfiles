fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun

fun! OnBoot()
	if(argc() == 0)
		Explore .
	end
endfun


augroup VOLTRA
	autocmd!
	autocmd VimEnter * :call OnBoot()
	autocmd BufWritePre * :call TrimWhitespace()
	autocmd FileType scss set iskeyword+=-
	autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
augroup END

