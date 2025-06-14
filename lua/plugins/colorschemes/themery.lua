return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		vim.keymap.set("n", "<C-n>", ":Themery<cr>", { desc = "Themery Color Wheel" })
		require("themery").setup({
			livePreview = true,
			-- add themes here!
			themes = {
				{
					name = "Cat",
					colorscheme = "catppuccin",
					flavour = "mocha",
					before = [[
						-- this code block will be executed before colorscheme is applied
						vim.opt.background = "light"
					]],
					after = [[
						-- Same as before, but after if you need it
						vim.opt.background = "dark"
					]],
				},
				{
					name = "Gruv",
					colorscheme = "gruvbox",
				},
				{
					name = "Tokyo Moon",
					colorscheme = "tokyonight-moon",
				},
				{
					name = "Tokyo Storm",
					colorscheme = "tokyonight-storm",
				},
				{
					name = "Tokyo Night",
					colorscheme = "tokyonight-night",
				},
				{
					name = "Cyberdream",
					colorscheme = "cyberdream",
				},
				{
					name = "Moonfly",
					colorscheme = "moonfly",
				},
				{
					name = "Kanagawa Wave",
					colorscheme = "kanagawa",
					after = [[
						vim.cmd("colorscheme kanagawa-wave")
					]],
				},
				{
					name = "Kanagawa Dragon",
					colorscheme = "kanagawa",
					after = [[
						vim.cmd("colorscheme kanagawa-dragon")
					]],
				},
				{
					name = "[Light] Kanagawa Lotus",
					colorscheme = "kanagawa",
					after = [[
						vim.cmd("colorscheme kanagawa-lotus")
					]],
				},
				{
					name = "[Light] Tokyo Day",
					colorscheme = "tokyonight-day",
				},
			},
		})
	end,
}
