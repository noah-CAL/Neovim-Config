return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local harpoon = require("harpoon")
		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		-- TODO: remap mappings
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Harpoon: add" })
		vim.keymap.set("n", "<leader>d", function()
			harpoon:list():remove()
		end, { desc = "Harpoon: delete" })
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon: Quick Menu" })

		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon: buf[1]" })
		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon: buf[2]" })
		vim.keymap.set("n", "<C-l>", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon: buf[3]" })
		vim.keymap.set("n", "<C-;>", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon: buf[4]" })

		-- Toggle previous & next buffers stored within Harpoon list
		--vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
		--vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		-- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
		-- { desc = "Open harpoon window" })
	end,
}
