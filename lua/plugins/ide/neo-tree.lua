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
		vim.keymap.set("n", "<leader>b", ":Neotree source=buffers position=float<CR>", { desc = "Buffers" })
		vim.keymap.set(
			"n",
			"\\",
			":Neotree source=filesystem position=right reveal=true action=show toggle<CR>",
			{ desc = "Neotree Open" }
		)
	end,
}
