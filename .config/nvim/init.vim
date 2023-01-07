"General
set mouse=a
set showcmd
set encoding=utf-8
syntax enable

call plug#begin('~\AppData\Local\nvim\plugged')
	" themes
	Plug 'morhetz/gruvbox'

	"Syntax
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'sheerun/vim-polyglot'
	Plug 'windwp/nvim-autopairs'
	Plug 'mattn/emmet-vim'
	Plug 'lukas-reineke/indent-blankline.nvim'

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
nnoremap markp :MarkdowPreview<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Mappings COC Auto Select
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Telescope Mappings
nnoremap tele <cmd>Telescope find_files<cr>
nnoremap telb <cmd>Telescope buffers<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" Theme configurations
function! s:start_theme()
  " Your theme customizations (function created for goyo theme reset)
	hi Normal guibg=NONE ctermbg=NONE
endfunction


autocmd! ColorScheme gruvbox call s:start_theme()
colorscheme gruvbox
