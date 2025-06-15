-- Mini.nvim plugin
return {
	"echasnovski/mini.animate",
	version = false,
	config = function()
		require("mini.animate").setup({
			-- cursor path
			cursor = {
				enable = true,
				-- Timing of animation (how steps will progress in time)
				timing = function()
					return 5
				end,
			},

			-- TODO: go through and figure out non-linear functions for these
			-- Vertical scroll
			scroll = {
				enable = true,
			},

			-- Window resize
			resize = {
				enable = false,
			},

			-- Window open
			open = {
				enable = false,
			},

			-- Window close
			close = {
				enable = false,
			},
		})
	end,
}
