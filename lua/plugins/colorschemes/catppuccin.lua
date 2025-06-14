return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	-- instead of "require(...)" in init.lua, Neovim looks for a `config` function inside of the table
	-- returned by the module and it will run the code inside of the `config` function
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}
