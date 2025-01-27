require("config.lazy")

vim.keymap.set({ "n" }, "<C-h>", ":tabp<CR>", { silent = true })
vim.keymap.set({ "n" }, "<C-l>", ":tabn<CR>", { silent = true })
vim.keymap.set({ "i" }, "jk", "<Esc>", { silent = true })
vim.keymap.set({ "i" }, "kj", "<Esc>", { silent = true })

vim.opt.number = true
