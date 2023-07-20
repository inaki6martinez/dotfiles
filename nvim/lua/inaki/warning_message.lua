local api = vim.api

-- Define a function to check if a file path contains the word "output"
local function has_output(filepath)
  return string.match(filepath, "output") ~= nil
end

-- Define a function to show a warning message in a floating window
function show_warning()
  local bufnr = api.nvim_create_buf(false, true)
  api.nvim_buf_set_lines(bufnr, 0, -1, false, {"WARNING: This file contains the word 'output' in its path."})
  local width = 50
  local height = 3
  local row = math.floor((vim.o.lines - height) / 2 - 1)
  local col = math.floor((vim.o.columns - width) / 2)
  local opts = {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal'
  }
  local win = api.nvim_open_win(bufnr, true, opts)
  api.nvim_win_set_option(win, 'winblend', 30)
end

-- Define a function to be called when a file is opened
local function on_file_opened()
  local filepath = vim.fn.expand('%:p')
  if has_output(filepath) then
    show_warning()
  end
end

-- Register the on_file_opened function to be called on the BufReadPost event
api.nvim_create_autocmd(
	{}
)
vim.cmd([[augroup myplugin]])
vim.cmd([[autocmd!]])
vim.cmd([[autocmd BufReadPost * lua on_file_opened()]])
vim.cmd([[augroup END]])

