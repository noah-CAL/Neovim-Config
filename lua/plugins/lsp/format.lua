return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")

		conform.setup({
			-- formatters by "filetype"
			formatters_by_ft = {
				lua = { "stylua" },
				-- isort for sorting import statements
				python = { "isort", "autopep8", stop_after_first = false }, -- Conform will run multiple formatters sequentially
				c = { "clang-format" },
				asm = { "asmfmt" },
				riscv = { "asmfmt" },
			},
		})

		conform.formatters["clang-format"] = {
			prepend_args = {
				"--style=file", -- load from .clang-format file (in CWD or parent directory)
				"--fallback-style=llvm", -- Google style is CPPlint's default
			},
		}

		-- mp for "make pretty"
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file in range (or visual mode)" })

		-- format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				conform.format({ bufnr = args.buf })
			end,
		})
	end,
}
