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
		vim.keymap.set("n", "<C-w>b", ":Neotree source=buffers position=float<CR>", { desc = "View Open Buffers" })
		vim.keymap.set(
			"n",
			"\\",
			":Neotree source=filesystem position=right reveal=true action=show toggle<CR>",
			{ desc = "Neotree Open" }
		)
		vim.keymap.set(
			"n",
			"<C-w>\\",
			":Neotree source=filesystem position=right reveal=true<CR>",
			{ desc = "Jump to Neotree" }
		)
		require("neo-tree").setup({
			close_if_last_window = true,
			filesystem = {
				filtered_items = {
					visible = false, -- when true, they will just be displayed differently than normal items
					hide_dotfiles = true,
					hide_by_name = {
						--"node_modules"
					},
					hide_by_pattern = { -- uses glob style patterns
						--"*/src/*/tsconfig.json",
					},
					always_show = { -- remains visible even if other settings would normally hide it
						".gitignore",
					},
					always_show_by_pattern = { -- uses glob style patterns
						".bash*",
						"*.conf",
					},
					never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
						--".DS_Store",
						--"thumbs.db"
					},
					never_show_by_pattern = { -- uses glob style patterns
						--".null-ls_*",
					},
				},
			},
		})
	end,
}
