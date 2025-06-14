-- Installed latest Neovim 'nightly' version for Debian WSL2
--		1) Install FUSE package (and RIPGREP for Telescope grep)
--			 RIPGREP for Telescope grep
--			 Node.js for Github Copilot (https://nodejs.org/en/download/)
--		2) Download the Neovim nightly appimage from Github
--		3) chmod u+x the appimage and ./___ to install with FUSE
--		4) Rename appimage to "nvim" and move to /usr/local/bin
--		5) Ensure /usr/local/bin is in $PATH
--		6) If formatters / linters / etc. installation fail,
--		   manually install with :Mason 5
--
-- Setup taken from Typecraft Neovim customization tutorial
-- https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&index=1

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

require("vim-options")
require("lazy").setup("plugins")
