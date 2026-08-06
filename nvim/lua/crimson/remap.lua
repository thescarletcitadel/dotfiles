vim.g.mapleader = " "

-- the best keybind ever to not have to type Ex or have to exit and then go into neovim
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
-- ctrl + movement keys are for split views
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
-- opens the lazyvim menu
vim.keymap.set("n", "<C-o>", ":Lazy<CR>")
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>v", ":vsplit ~/")
vim.keymap.set("n", "<leader>ns", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>f", function()
	-- button for formatting keys inside of the file
	vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" }
)

vim.keymap.set("n", "<C-f>", function()
	return ":%s/" .. vim.fn.expand("<cword>")
end, { expr = true }
)

vim.keymap.set("n", "<leader>k", ":e ~/")
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>jp", 'o<C-r>"<Esc>', { noremap = true, silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
