"General
set mouse=a
set showcmd
set encoding=utf-8
syntax enable
set number

call plug#begin()
	" themes
	Plug 'sainnhe/everforest'
	"Syntax
	Plug 'sheerun/vim-polyglot'
	Plug 'windwp/nvim-autopairs'
	Plug 'jlcrochet/vim-razor'

	" GUI
	Plug 'leath-dub/stat.nvim'
	Plug 'nvim-tree/nvim-tree.lua'
	
	" Utilities
	Plug 'lewis6991/gitsigns.nvim'

	"Finder
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()

if has('termguicolors')
	set termguicolors
endif
set background=dark
let g:everforest_background = 'soft'
let g:everforest_better_performance = 1
let g:everforest_transparent_background = 1
autocmd! colorscheme everforest
colorscheme everforest

inoremap jf <Esc>
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>
nnoremap cls :q!<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-p> :Gitsigns preview_hunk<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap tt <cmd>Telescope find_files<cr>
nnoremap tb <cmd>Telescope buffers<cr>
nnoremap gbr <cmd>Telescope git_branches<cr>
nnoremap gs <cmd>Telescope git_status<cr>
nnoremap glc <cmd>Telescope git_commits<cr>
nnoremap gash <cmd>Telescope git_stash<cr>


lua<<EOF
require("nvim-tree").setup()
require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules", ".git", ".next", "obj", "bin", ".vs" }} }
require('gitsigns').setup()
require("nvim-autopairs").setup {}
require("stat").setup({
  winbar = {
    ___,
    Stat.mod.file()
  },
  statusline = {
    ___,
    Stat.mod.mode,
    Stat.mod.filetype,
    Stat.mod.git_diff
  },
	theme = {
    ["N"] = { fg = "#2d353b", bg = "#83c092" },
    ["I"] = { fg = "#2d353b", bg = "#7fbbb3" },
    ["V"] = { fg = "#2d353b", bg = "#dbbc7f" },
    ["C"] = { fg = "#2d353b", bg = "#d699b6" },
    ["T"] = { fg = "#2d353b", bg = "#a7c080" },
    ["S"] = { fg = "#2d353b", bg = "#e67e80" },
    ["File"] = { fg = "#d3c6aa", bg = "#272e33" },
    ["Filetype"] = { fg = "#d3c6aa", bg = "#272e33" },
    ["GitDiffDeletion"] = { fg = "#e67e80", bg = "#232a2e" },
    ["GitDiffInsertion"] = { fg = "#a7c080", bg = "#232a2e" }
  }
})
EOF
