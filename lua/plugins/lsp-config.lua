return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"tinymist",  -- Typst
					"texlab", -- LaTeX
				}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- Set up each installed LSP to talk to Neovim
			lspconfig.lua_ls.setup({})
			lspconfig.pyright.setup({})
			lspconfig.tinymist.setup({})
			lspconfig.texlab.setup({})

			-- NOTE: look at the lspconfig docs to change this so it's on the "AttachLsp" hook -- that way 
			-- these keymaps do nothing when LSP server is not attached
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "ga", vim.lsp.buf.code_action, {})
		end
	}
}
