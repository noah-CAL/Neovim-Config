-- Package Manager for LSPs, DAPs, Linters, Formatters
return {
	"mason-org/mason.nvim",
	config = function()
		require("mason").setup()
	end,
}
