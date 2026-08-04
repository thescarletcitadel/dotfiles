return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false, -- Load immediately
		priority = 1000, -- Load before other plugins
		config = function()
			vim.cmd.colorscheme("rose-pine")

			-- Optional: Customize specific variants (moon, dawn, main)
			-- vim.g.rose_pine_variant = "main"
		end,
	},
}
