local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

local core_map = {
	-- Suckless
	["n|<S-Tab>"] = map_cr("normal za"):with_noremap():with_silent():with_desc("editn: Toggle code fold"),
	["n|<C-s>"] = map_cu("write"):with_noremap():with_silent():with_desc("editn: Save file"),
	["n|<C-S-s>"] = map_cmd("execute 'silent! write !sudo tee % >/dev/null' <bar> edit!")
		:with_silent()
		:with_noremap()
		:with_desc("editn: Save file using sudo"),
	["n|Y"] = map_cmd("y$"):with_desc("editn: Yank text to EOL"),
	["n|D"] = map_cmd("d$"):with_desc("editn: Delete text to EOL"),
	["n|-"] = map_cmd("ddp"):with_noremap():with_silent():with_desc("editn: Move the line down"),
	["n|_"] = map_cmd("ddkP"):with_noremap():with_silent():with_desc("editn: Move the line up"),
	["n|H"] = map_cmd("^"):with_noremap():with_silent():with_desc("Go to the start of the line"),
	["n|L"] = map_cmd("$"):with_noremap():with_silent():with_desc("Go to the end of the line"),
	["n|n"] = map_cmd("nzzzv"):with_noremap():with_desc("editn: Next search result"),
	["n|N"] = map_cmd("Nzzzv"):with_noremap():with_desc("editn: Prev search result"),
	["n|J"] = map_cmd("mzJ`z"):with_noremap():with_desc("editn: Join next line"),
	["n|<leader>sh"] = map_cmd("<C-w>s"):with_noremap():with_silent():with_desc("window: Split horizontal"),
	["n|<leader>sv"] = map_cmd("<C-w>v"):with_noremap():with_silent():with_desc("window: Split vertical"),
	["n|<leader>hn"] = map_cr("set nohlsearch")
		:with_noremap()
		:with_silent()
		:with_desc("search: Set nohighlight in search"),
	["n|<leader>hy"] = map_cr("set hlsearch"):with_noremap():with_silent():with_desc("search: Set highlight in search"),
	["n|<C-h>"] = map_cmd("<C-w>h"):with_noremap():with_desc("window: Focus left"),
	["n|<C-l>"] = map_cmd("<C-w>l"):with_noremap():with_desc("window: Focus right"),
	["n|<C-j>"] = map_cmd("<C-w>j"):with_noremap():with_desc("window: Focus down"),
	["n|<C-k>"] = map_cmd("<C-w>k"):with_noremap():with_desc("window: Focus up"),
	["t|<C-h>"] = map_cmd("<Cmd>wincmd h<CR>"):with_silent():with_noremap():with_desc("window: Focus left"),
	["t|<C-l>"] = map_cmd("<Cmd>wincmd l<CR>"):with_silent():with_noremap():with_desc("window: Focus right"),
	["t|<C-j>"] = map_cmd("<Cmd>wincmd j<CR>"):with_silent():with_noremap():with_desc("window: Focus down"),
	["t|<C-k>"] = map_cmd("<Cmd>wincmd k<CR>"):with_silent():with_noremap():with_desc("window: Focus up"),
	["n|<A-[>"] = map_cr("vertical resize -5"):with_silent():with_desc("window: Resize -5 vertically"),
	["n|<A-]>"] = map_cr("vertical resize +5"):with_silent():with_desc("window: Resize +5 vertically"),
	["n|<A-;>"] = map_cr("resize -2"):with_silent():with_desc("window: Resize -2 horizontally"),
	["n|<A-'>"] = map_cr("resize +2"):with_silent():with_desc("window: Resize +2 horizontally"),
	-- ["n|<C-q>"] = map_cmd(":wq<CR>"):with_desc("editn: Save file and quit"),
	-- ["n|<A-S-q>"] = map_cmd(":q!<CR>"):with_desc("editn: Force quit"),
	["n|<leader>o"] = map_cr("setlocal spell! spelllang=en_us"):with_desc("editn: Toggle spell check"),
	-- Insert mode
	["i|<C-u>"] = map_cmd("<C-G>u<C-U>"):with_noremap():with_desc("editi: Delete previous block"),
	["i|<A-h>"] = map_cmd("<Left>"):with_noremap():with_desc("editi: Move cursor to left"),
	["i|<A-l>"] = map_cmd("<Right>"):with_noremap():with_desc("editi: Move cursor to right"),
	["i|<C-a>"] = map_cmd("<ESC>^i"):with_noremap():with_desc("editi: Move cursor to line start"),
	["i|<C-s>"] = map_cmd("<Esc>:w<CR>"):with_desc("editi: Save file"),
	-- ["i|<C-q>"] = map_cmd("<Esc>:wq<CR>"):with_desc("editi: Save file and quit"),
	-- Command mode
	["c|<C-b>"] = map_cmd("<Left>"):with_noremap():with_desc("editc: Left"),
	["c|<C-f>"] = map_cmd("<Right>"):with_noremap():with_desc("editc: Right"),
	["c|<C-j>"] = map_cmd("<Up>"):with_noremap():with_desc("editc: Last command"),
	["c|<C-k>"] = map_cmd("<Down>"):with_noremap():with_desc("editc: Next command"),
	["c|<C-a>"] = map_cmd("<Home>"):with_noremap():with_desc("editc: Home"),
	["c|<C-e>"] = map_cmd("<End>"):with_noremap():with_desc("editc: End"),
	["c|<C-d>"] = map_cmd("<Del>"):with_noremap():with_desc("editc: Delete"),
	["c|<C-h>"] = map_cmd("<BS>"):with_noremap():with_desc("editc: Backspace"),
	["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]])
		:with_noremap()
		:with_desc("editc: Complete path of current file"),
	-- Visual mode
	["v|J"] = map_cmd(":m '>+1<CR>gv=gv"):with_desc("editv: Move this line down"),
	["v|K"] = map_cmd(":m '<-2<CR>gv=gv"):with_desc("editv: Move this line up"),
	["v|<"] = map_cmd("<gv"):with_desc("editv: Decrease indent"),
	["v|>"] = map_cmd(">gv"):with_desc("editv: Increase indent"),
	--enhanced edit
	['n|<leader>"'] = map_cmd('viw<esc>a"<esc>bi"<esc>lel'):with_noremap():with_desc('Add " for word'),
	["n|<leader>("] = map_cmd("viw<esc>a)<esc>bi(<esc>lel"):with_noremap():with_desc("Add ( for word"),
	["n|<leader>["] = map_cmd("viw<esc>a]<esc>bi[<esc>lel"):with_noremap():with_desc("Add [ for word"),
	["n|<leader><"] = map_cmd("viw<esc>a><esc>bi<<esc>lel"):with_noremap():with_desc("Add < for word"),
	["n|<leader>{"] = map_cmd("viw<esc>a}<esc>bi{<esc>lel"):with_noremap():with_desc("Add { for word"),
	["n|<leader>'"] = map_cmd("viw<esc>a'<esc>bi'<esc>lel"):with_noremap():with_desc("Add ' for word"),
	["v|<leader>'"] = map_cmd("<esc>`<i'<esc>`>a'<esc>"):with_noremap():with_desc("Add ' for block"),
	['v|<leader>"'] = map_cmd('<esc>`<i"<esc>`>a"<esc>'):with_noremap():with_desc('Add " for word'),
	["v|<leader>{"] = map_cmd("<esc>`<i{<esc>`>a}<esc>"):with_noremap():with_desc("Add { for block"),
	["v|<leader>("] = map_cmd("<esc>`<i(<esc>`>a)<esc>"):with_noremap():with_desc("Add ( for block"),
	["v|<leader>["] = map_cmd("<esc>`<i[<esc>`>a]<esc>"):with_noremap():with_desc("Add [ for block"),
	["v|<leader><"] = map_cmd("<esc>`<i<<esc>`>a><esc>"):with_noremap():with_desc("Add < for block"),
}

bind.nvim_load_mapping(core_map)
