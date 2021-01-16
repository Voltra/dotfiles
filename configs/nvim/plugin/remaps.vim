nnoremap <leader>ps :lua require'telescope.builtin'.grep_string{ search = vim.fn.input("Grep for > ") } <CR>


nnoremap <c-s> :w<CR>
vnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>

