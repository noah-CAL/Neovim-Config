-- Mini.nvim plugin
return {
	"echasnovski/mini.indentscope",
	config = function()
		local indentscope = require("mini.indentscope")
		indentscope.setup({
			draw = {
				-- Delay (in ms) between event and start of drawing scope indicator
				delay = 0,

				-- 2ms time to draw each line
				animation = function(s, n)
					return 0
				end,
				--minidoc_replace_end

				-- Whether to auto draw scope: return `true` to draw, `false` otherwise.
				-- Default draws only fully computed scope (see `options.n_lines`).
				predicate = function(scope)
					return not scope.body.is_incomplete
				end,

				-- Symbol priority. Increase to display on top of more symbols.
				priority = 2,
			},
		})
	end,
}
