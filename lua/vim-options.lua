vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set noswapfile")
vim.cmd("set scrolloff=3") -- https://neovim.io/doc/user/options.html#'scrolloff'

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<c-t>", ":tabnew\n", { desc = "Open a new tab" })
vim.keymap.set("n", "<c-w>w", ":tabclose\n", { desc = "Close the open tab" })
vim.keymap.set("n", "<Tab>", ":tabn\n", { desc = "Move forwards one tab" })
vim.keymap.set("n", "<S-Tab>", ":tabp\n", { desc = "Move backwards one tab" })

-- TOhtml keymap
vim.keymap.set("n", "<Leader>th", function()
	local filename = string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd() .. "/", "")
	local html = require("tohtml").tohtml(0, {
		title = filename,
		number_lines = true,
	})
	local bufid = vim.api.nvim_create_buf({ false }, { true })
	vim.api.nvim_buf_set_lines(bufid, 0, -1, true, html) -- insert HTML
	vim.api.nvim_open_win(bufid, true, { split = "above" })
	vim.api.nvim_set_option_value("modified", false, { buf = bufid }) -- so there's no "No save since last write for [new name]"
end, { desc = "Current Page-to-HTML" })

-- LSP Diagnostic Placements
-- Virtual Text: text to the right of the line
-- Virtual Lines: T/F | { current_line = T/F }: diagnostics below line
vim.diagnostic.config({ virtual_text = true}) --, virtual_lines = { current_line = true}, })
