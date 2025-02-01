local themery = {
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
				},
				{
					name = "Tokyo Moon",
					colorscheme = "tokyonight-moon"
				},
				{
					name = "Tokyo Storm",
					colorscheme = "tokyonight-storm"
				},
				{
					name = "Tokyo Night",
					colorscheme = "tokyonight-night"
				},
				{
					name = "Cyberdream",
					colorscheme = "cyberdream"
				},
				{
					name = "Moonfly",
					colorscheme = "moonfly"
				},
				{
					name = "Kanagawa Wave",
					colorscheme = "kanagawa",
					after = [[
						vim.cmd("colorscheme kanagawa-wave")
					]]
				},
				{
					name = "Kanagawa Dragon",
					colorscheme = "kanagawa",
					after = [[
						vim.cmd("colorscheme kanagawa-dragon")
					]]
				},
				{
					name = "[Light] Kanagawa Lotus",
					colorscheme = "kanagawa",
					after = [[
						vim.cmd("colorscheme kanagawa-lotus")
					]]
				},
				{
					name = "[Light] Tokyo Day",
					colorscheme = "tokyonight-day"
				},
			},
			livePreview = true,
		})
		vim.keymap.set("n", "<C-n>", ":Themery<cr>")
	end
}


return {
	themery,
	{
		"catppuccin/nvim",
		name="catppuccin",
		priority = 1000,
		-- instead of "require(...)" in init.lua, Neovim looks for a `config` function inside of the table
		-- returned by the module and it will run the code inside of the `config` function
		config = function ()
			vim.cmd.colorscheme "catppuccin"
		end
	},
	{
		"ellisonleao/gruvbox.nvim",
		name="gruvbox",
	},
	{
		"scottmckendry/cyberdream.nvim",
		name = "cyberdream",
		lazy = false,
		config = function()
			require("cyberdream").setup({
				transparent = false,

				-- enable italics comments
				italic_comments = false,

				-- etc...
			})
		end
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa"
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly"
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight"
	}
}
