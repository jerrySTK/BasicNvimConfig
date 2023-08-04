require "paq" {
    "savq/paq-nvim";
    "OmniSharp/omnisharp-vim";
    "preservim/nerdtree";
    "dense-analysis/ale";
    "BurntSushi/ripgrep";
    "nvim-lua/plenary.nvim";
    {"nvim-telescope/telescope.nvim", branch="0.1.x"};
    "mhinz/vim-signify";
    {"neoclide/coc.nvim",·branch="release"};
}

local wo = vim.wo
local g = vim.g
local opt = vim.opt

wo.number = true -- show line numbers
g.OmniSharp_server_use_net6 = 1
opt.wrap = false -- no text wrap
opt.backup = false -- no annoying backup file
-- everything in utf-8
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.termencoding = "utf-8"

opt.shell = 'powershell.exe'
g.terminal_emulator='powershell'
opt.shellcmdflag='-nologo -noprofile -ExecutionPolicy RemoteSigned -command'
opt.shellxquote= ''

vim.cmd([[
	set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
	set list
	" 4 spaces indentation
	set tabstop=4 softtabstop=0 expandtab shiftwidth=4

	" Deal with unwanted white spaces (show them in red)
	highlight ExtraWhitespace ctermbg=red guibg=red
	match ExtraWhitespace /\s\+$/
	autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
	autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	autocmd InsertLeave * match ExtraWhitespace /\s\+$/
	autocmd BufWinLeave * call clearmatches()

" Coc CSS
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
]])

vim.cmd('command NT NERDTree')
vim.cmd('command FN Telescope find_files')
vim.cmd('command FT Telescope live_grep')
