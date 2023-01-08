"General
set mouse=a
set showcmd
set encoding=utf-8
syntax enable
set number

call plug#begin('~\AppData\Local\nvim\plugged')
	" themes
	Plug 'sainnhe/everforest'
	"Syntax
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'sheerun/vim-polyglot'
	Plug 'windwp/nvim-autopairs'
	Plug 'mattn/emmet-vim'
	Plug 'OmniSharp/omnisharp-vim'

	" GUI
	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'itchyny/lightline.vim'
	
	" Utilities
	Plug 'junegunn/goyo.vim'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

	"Finder
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()

lua << EOF
require("nvim-autopairs").setup {} 
EOF

" Mappings
inoremap jf <Esc>
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>
nnoremap exit :q!<CR>
nnoremap markp :MarkdownPreview<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Telescope Mappings
nnoremap tele <cmd>Telescope find_files<cr>
nnoremap telb <cmd>Telescope buffers<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"Mappings COC Auto Select
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Theme configurations
function! s:start_theme()
  " Your theme customizations (function created for goyo theme reset)
	hi NonText ctermbg=NONE
	hi Normal guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
	let g:mkdp_theme = 'light'
endfunction

if has('termguicolors')
	set termguicolors
endif
set background=dark
let g:everforest_background = 'soft'
let g:everforest_better_performance = 1
let g:everforest_transparent_background = 1
autocmd! colorscheme everforest call s:start_theme()
colorscheme everforest
