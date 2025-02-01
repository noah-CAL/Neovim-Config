return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			-- add the config here
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
					colorscheme = "gruvbox"
				}
			},
			livePreview = true,
		})
		vim.keymap.set("n", "<C-n>", ":Themery<cr>")
	end
}
