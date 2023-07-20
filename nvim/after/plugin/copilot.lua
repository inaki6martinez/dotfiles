--require("copilot").setup({
--  panel = {
--    auto_refresh = true,
--    keymap = {
--      accept = "<CR>",
--      jump_prev = "[[",
--      jump_next = "]]",
--      refresh = "gr",
--      open = "<M-CR>",
--    },
--  },
--  suggestion = {
--    auto_trigger = true,
--    keymap = {
--      accept = "<M-l>",
--      prev = "<M-[>",
--      next = "<M-]>",
--      dismiss = "<C-]>",
--    },
--  },
--})
--
----panel = require("copilot.panel")
----vim.keymap.set("n", '<leader>ip', require("copilot.panel").open({"bottom",0.4}))
--
--vim.keymap.set("i", '<Tab>', function()
--  if require("copilot.suggestion").is_visible() then
--    require("copilot.suggestion").accept()
--  else
--    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
--  end
--end, {
--  silent = true,
--})