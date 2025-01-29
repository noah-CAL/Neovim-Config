-- Installed latest Neovim 'nightly' version for Debian WSL2 
--		1) Install FUSE package (and RIPGREP for Telescope grep)
--		2) Download the Neovim nightly appimage from Github
--		3) chmod u+x the appimage and ./___ to install with FUSE
--		4) Rename appimage to "nvim" and move to /usr/local/bin
--		5) Ensure /usr/local/bin is in $PATH
--
-- Setup taken from Typecraft Neovim customization tutorial
-- https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&index=1
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set noswapfile")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local plugins = {
	{ "catppuccin/nvim", name="catppuccin", priority = 1000 },
	{ 
		"nvim-telescope/telescope.nvim", tag = "0.1.5", 
		-- NOTE: need RIPGREP package installed on system for live grep
		dependencies = { "nvim-lua/plenary.nvim" }
	}, 
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
}
local opts = {}

-- Setup lazy.nvim
require("lazy").setup({plugins, opts})
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"lua", "c", "python", "vimdoc", "asm", "objdump", "bash", "tmux", "verilog"},
	highlight = { enable = true },
	indent = { enable = true },
})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

