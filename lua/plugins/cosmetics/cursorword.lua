-- Mini.nvim plugin
return {
	"echasnovski/mini.cursorword",
	version = false,
	config = function()
		require("mini.cursorword").setup({
			delay = 0,
		})
	end,
}
