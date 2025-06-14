return {
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
	end,
}
