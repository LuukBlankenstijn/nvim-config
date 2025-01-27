local path_package = vim.fn.stdpath('data') .. '/site'

require("config.lazy")

vim.keymap.set({"n"}, "<C-h>", ":tabp<CR>", {silent = true})
vim.keymap.set({"n"}, "<C-l>", ":tabn<CR>", {silent = true})

vim.opt.number = true
