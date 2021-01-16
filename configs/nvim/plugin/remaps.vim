nnoremap <leader>ps :lua require'telescope.builtin'.grep_string{ search = vim.fn.input("Grep for > ") } <CR>


command! MoveSelectionUp execute ":m '<-2 <CR>gv=gv"
command! MoveSelectionDown execute ":m '>+1 <CR>gv=gv"


nnoremap <C-Down> :m +1<CR>==
nnoremap <C-Up> :m -2<CR>==
vnoremap J :MoveSelectionDown
vnoremap K :MoveSelectionUp
nnoremap <C-_> <Plug>NERDCommenterToggle<CR>

