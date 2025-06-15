-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			---Whether the cursor should stay at its position
			sticky = true,
			---Regex of Lines to be ignored while (un)comment
			ignore = nil,
			---LHS of toggle mappings in NORMAL mode
			toggler = {
				line = "gcc", ---Line-comment toggle keymap
				block = "gbc", ---Block-comment toggle keymap
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				line = "gc", ---Line-comment keymap
				block = "gb", ---Block-comment keyma
			},
		})
	end,
}
