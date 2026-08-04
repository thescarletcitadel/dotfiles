return {
	{
		"oxfist/night-owl.nvim",
		name = "night-owl",
		lazy = false, -- Load immediately
		priority = 1000, -- Load before other plugins
		config = function()
			vim.cmd.colorscheme("night-owl")
		end,
	},
}
