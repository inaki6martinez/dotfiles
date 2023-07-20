require('tabnine').setup({
  disable_auto_comment=true,
  --accept_keymap="<Tab>",
  accept_keymap="<Right>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt"}
})

local tabnine_grp = vim.api.nvim_create_augroup("Tnine", { clear = true })

vim.api.nvim_create_autocmd(
  {"BufEnter", "BufWinEnter", "WinEnter"},
  {
	  pattern = {"*.c", "*.h", "*.cpp", "*.lua", "*.py"},
	  command = "TabnineEnable",
	  group = tabnine_grp
  }
)

vim.api.nvim_create_autocmd(
  {"BufEnter", "BufWinEnter", "WinEnter"},
  {
	  pattern = {"*.txt"},
	  command = "TabnineDisable",
	  group = tabnine_grp
  }
)
