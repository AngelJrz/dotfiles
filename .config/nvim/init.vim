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

	" GUI
	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'leath-dub/stat.nvim'
	Plug 'glepnir/dashboard-nvim'
	
	" Utilities
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
	Plug 'tpope/vim-commentary'
	Plug 'lewis6991/gitsigns.nvim'

	"Finder
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()

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

lua << EOF
require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules", ".git", ".next" }} }
require('gitsigns').setup()
require("nvim-autopairs").setup {}
require("stat").setup({
  winbar = {
    ___,
    __Stat__.mod.file()
  },
  statusline = {
    ___,
    __Stat__.mod.mode,
    __Stat__.mod.filetype,
    __Stat__.mod.git_diff
  },
	theme = {
    ["N"] = { fg = "#2d353b", bg = "#83c092" },
    ["I"] = { fg = "#2d353b", bg = "#7fbbb3" },
    ["V"] = { fg = "#2d353b", bg = "#dbbc7f" },
    ["C"] = { fg = "#2d353b", bg = "#d699b6" },
    ["T"] = { fg = "#2d353b", bg = "#a7c080" },
    ["S"] = { fg = "#2d353b", bg = "#e67e80" },
    ["File"] = { fg = "#d3c6aa", bg = "#543A48" },
    ["Filetype"] = { fg = "#d3c6aa", bg = "#272e33" },
    ["GitDiffDeletion"] = { fg = "#e67e80", bg = "#232a2e" },
    ["GitDiffInsertion"] = { fg = "#a7c080", bg = "#232a2e" }
  }
})
local db = require('dashboard')
db.custom_header= {
		 \'',
		 \'   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ',
		 \'    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
		 \'          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ',
		 \'           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
		 \'          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
		 \'   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
		 \'  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
		 \' ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
		 \' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ',
		 \'      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
		 \'       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
		 \'',
		\}
db.custom_center = {
	{icon = 'ᐅ\t',
	desc = 'Find  Files',
	action = 'Telescope find_files'},
	{icon = 'ᐅ\t',
	desc = 'New File',
	action = 'DashboardNewFile'},
	{icon = 'ᐅ\t',
	desc = 'Configuration',
	action = 'edit $MYVIMRC'},
  {icon = 'ᐅ\t',
  desc = 'Exit',
  action = 'exit'}
}
EOF

" Mappings
inoremap jf <Esc>
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>
nnoremap exit :q!<CR>
nnoremap <C-m> :MarkdownPreviewToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Telescope Mappings
nnoremap tele <cmd>Telescope find_files<cr>
nnoremap telb <cmd>Telescope buffers<cr>
nnoremap ggb <cmd>Telescope git_branches<cr>
nnoremap ggc <cmd>Telescope git_commits<cr>
nnoremap ggsh <cmd>Telescope git_stash<cr>
nnoremap ggst <cmd>Telescope git_status<cr>


"Mappings COC Auto Select
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_global_extensions = ['coc-word', 'coc-snippets', 'coc-html', 'coc-tsserver', 'coc-omnisharp', 'coc-json', 'coc-css']
