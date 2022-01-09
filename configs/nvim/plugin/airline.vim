let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_whitespace = 0
let g:airline_section_warning = " "
let g:airline#extensions#tabline#formatter = "unique_tail_improved"
let g:airline#extensions#whitespace#enabled = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = " "
let g:airline_symbols.whitespace = " "
