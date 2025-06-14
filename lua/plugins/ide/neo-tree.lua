return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- For full list of configs: https://github.com/nvim-neo-tree/neo-tree.nvim
		vim.keymap.set("n", "\\",  ":Neotree source=filesystem position=right reveal=true action=show toggle<CR>")
		vim.keymap.set("n", "<C-g>", ":Neotree source=git_status position=float<CR>")
		vim.keymap.set("n", "<C-b>", ":Neotree source=buffers position=float<CR>")
	end
}

