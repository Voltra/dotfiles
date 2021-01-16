syntax enable
set t_Co=256

if(has("termguicolors"))
	set termguicolors
endif

colorscheme OceanicNext
let g:airline_theme='oceanicnext'


highlight ColorColumn ctermbg=0 guibg=grey
"highlight LineNr guifg=#5eacd3
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

