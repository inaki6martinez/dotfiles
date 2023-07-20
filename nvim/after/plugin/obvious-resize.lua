--Split resize
vim.keymap.set("n", "<C-right>", ":<C-U>ObviousResizeRight<CR>", { silent = true})
vim.keymap.set("n", "<C-left>",  ":<C-U>ObviousResizeLeft<CR>",{ silent = true})
vim.keymap.set("n", "<C-up>",    ":<C-U>ObviousResizeUp<CR>",{ silent = true})
vim.keymap.set("n", "<C-down>",  ":<C-U>ObviousResizeDown<CR>",{ silent = true})
