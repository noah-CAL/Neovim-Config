-- Temporary fix while most recent Mason update breaks changes
-- https://www.reddit.com/r/neovim/comments/1kgpw60/failed_to_run_config_for_nvimlspconfig/
return {
	{ "mason-org/mason.nvim", version = "~1.0.0" },
	{ "mason-org/mason-lspconfig.nvim", version = "~1.0.0" },
}
