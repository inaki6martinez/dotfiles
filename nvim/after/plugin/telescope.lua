local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>o', builtin.find_files, {})
vim.keymap.set('n', '<leader>O', builtin.buffers, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>f', function()
		builtin.grep_string({ search = vim.fn.input("Grep > ")})
end)
vim.keymap.set('n', '<leader>fg', builtin.grep_string)
vim.keymap.set('n', '<leader>fe', builtin.live_grep)
vim.keymap.set('n', '<leader>fi', builtin.current_buffer_fuzzy_find)

require('telescope').setup{  defaults = { file_ignore_patterns = { "toolchain" }} }

vim.keymap.set('n', '<leader>lr', builtin.lsp_references)

vim.keymap.set('n', '<leader>gch', builtin.git_branches)

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')


--require('telescope').setup{  defaults = { vimgrep_arguments = {"rg",
--                                                               "--no-heading",
--                                                               "--with-filename",
--                                                               "--line-number",
--                                                               "--column",
--                                                               "--smart-case"}
--                                        }}
