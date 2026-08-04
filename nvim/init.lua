require("crimson.remap")
require("crimson.lazy")
require("crimson.options")
require("plugins.render-markdown")
require("lazy").setup("crimson.lazy")
require("plugins.telescope")
print("init.lua loaded successfully")

vim.opt.clipboard = "unnamedplus"
vim.opt.showmatch = true

-- clipboard set up so i can yank and paste to outside programs
vim.g.clipboard = {
	name = "xclip",
	copy = {
		["+"] = { "xclip", "-selection", "clipboard" },
		["*"] = { "xclip", "-selection", "primary" },
	},
	paste = {
		["+"] = { "xclip", "-selection", "clipboard", "-o" },
		["*"] = { "xclip", "-selection", "primary", "-o" },
	},
	cache_enabled = false,
}
