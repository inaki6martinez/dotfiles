-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
	local lsp = require('lsp-zero')
	lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
	lsp.nvim_workspace()
	

	require'lspconfig'.clangd.setup{}

	-- Max width for the sugestion popup window
	formatting = {
		format = function(entry, vim_item)
		vim_item.abbr = string.sub(vim_item.abbr, 1, 30)
		return vim_item
		end
	}

	function FormatFunction()
		vim.lsp.buf.format({
			range = {
				["start"] = vim.api.nvim_buf_get_mark(0, "<"),
				["end"] = vim.api.nvim_buf_get_mark(0, ">"),
			}
		})
	end
	vim.api.nvim_set_keymap("v", "<leader>=", "<Esc><cmd>lua FormatFunction()<CR>", {noremap = true})
	vim.api.nvim_set_keymap("n", "<leader>=", "<Esc><cmd>lua vim.lsp.buf.format()<CR>", {noremap = true})

	lsp.setup()
