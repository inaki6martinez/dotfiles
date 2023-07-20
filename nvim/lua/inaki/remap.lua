vim.keymap.set("n", "ff", ":w<CR>")
vim.keymap.set("i", "kk", "->")
-- Difffiles
vim.keymap.set("n", "<leader>dr", vim.cmd.diffg)
vim.keymap.set("n", "<leader>dw", vim.cmd.diffpu)
vim.keymap.set("n", "<leader>dp", "[c")
vim.keymap.set("n", "<leader>dn", "]c")
-- Remove search highlight
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>")
-- Move tabs
vim.keymap.set("n", "H", 'gT')
vim.keymap.set("n", "L", 'gt')
-- Copy paste into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>P", "\"+P")
vim.keymap.set("v", "<leader>P", "\"+P")

vim.keymap.set("x", "<leader>p", "\"_dP")

-- quickfix https://freshman.tech/vim-quickfix-and-location-list/
vim.keymap.set("n", "<leader>cn", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>cp", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>ln", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>lp", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Search results centered please
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "g*", "g*zz")
-- Move text in blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Leave the cursor at the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- search and replace
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- set same size to all windows
vim.keymap.set("n", "<leader>w", "<C-w>=")
-- Brackets and keys
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "{", "{}<left>")
vim.keymap.set("i", "{<CR>", "{<CR>}<ESC>O")
vim.keymap.set("i", "{;<CR>", "{<CR>};<ESC>O")
vim.api.nvim_exec([[
	inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
	inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
	inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
	inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
	inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
]], false)

-- Format json files, apt install jq is needed
vim.keymap.set("n", "<leader>jf", ":%!jq .<CR>")

-- Disable caps lock
function disable_caps_lock()
	os.execute('bash /usr/local/bin/turn_off_capslock')
end

vim.api.nvim_set_keymap('n', '<esc>', '<esc>:lua disable_caps_lock()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<esc>', '<esc>:lua disable_caps_lock()<CR>', { noremap = true, silent = true })

-- Disable q for macro record
vim.api.nvim_set_keymap('n', 'q', 'i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', 'q', { noremap = true, silent = true })

-- C macros
vim.api.nvim_set_keymap('n', '<leader>mo', 'O#ifdef ', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mc', 'o#endif <ESC>b%2wyiwb%A/* <ESC>pA */<ESC>', { noremap = true, silent = true })

-- Navigate to previous/next function
vim.api.nvim_set_keymap('n', '<leader>ps', '[[', { noremap = true, silent = true }) -- previous { in first column
vim.api.nvim_set_keymap('n', '<leader>ns', ']]', { noremap = true, silent = true }) -- next { in first column
vim.api.nvim_set_keymap('n', '<leader>pe', '[]', { noremap = true, silent = true }) -- previous } in first column
vim.api.nvim_set_keymap('n', '<leader>ne', '][', { noremap = true, silent = true }) -- next } in first column










