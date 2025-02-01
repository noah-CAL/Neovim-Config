return {
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function ()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, {})
			vim.keymap.set("n", "<leader>ft", builtin.current_buffer_tags, {})
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
			vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
			vim.keymap.set("n", "<leader>gp", builtin.planets, {})
		end
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",  -- for pretty-looking Telescope UIs
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
						}
					}
				}
			})
			require("telescope").load_extension("ui-select")
		end
	}
}
