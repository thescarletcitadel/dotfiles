vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-o>", ":Lazy<CR>")
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<leader>v", ":vsplit ~/")
vim.keymap.set("n", "<leader>ns", ":nohlsearch<CR>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" }
)

vim.keymap.set("n", "<leader>k", ":e ~/")
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>jp", 'o<C-r>"<Esc>', { noremap = true, silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
