return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			-- mypy for static type checking
			-- pylint for general linting
			python = { "pylint" },
			c = { "cpplint" },
			verilog = { "verible" },
			lua = { "luacheck" },
		}

		local events = {
			--[["BufWritePost",]]
			"BufEnter",
			"InsertLeave",
			"TextChanged",
		}

		vim.api.nvim_create_autocmd(events, {
			callback = function()
				-- try_lint without arguments runs the linters defined in `linters_by_ft`
				-- for the current filetype
				lint.try_lint()
			end,
		})
	end,
}
