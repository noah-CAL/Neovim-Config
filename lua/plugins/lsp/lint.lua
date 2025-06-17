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
			makefile = { "checkmake" },
		}

		local global_linters = {
			"alex",
			"typos",
		}

		local events = {
			"BufWritePost",
			"BufEnter",
			"InsertLeave",
			"TextChanged",
		}

		-- Run linter for filetype
		vim.api.nvim_create_autocmd(events, {
			callback = function()
				-- try_lint without arguments runs the linters defined in `linters_by_ft`
				-- for the current filetype
				lint.try_lint()
			end,
		})

		-- Run all global linters less often
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			callback = function()
				for _, linter in ipairs(global_linters) do
					lint.try_lint(linter)
				end
			end,
		})

		vim.keymap.set("n", "<leader>ml", function()
			lint.try_lint()
		end, { desc = "Lint file" })
	end,
}
