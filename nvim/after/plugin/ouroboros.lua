--vim.keymap.set("n", "<leader>h", vim.cmd.Ouroboros)

function source_header()
	local api = vim.api
	-- Get the current buffer name and extension
	local bufname = api.nvim_buf_get_name(0)
	local extension = bufname:match("%.(%w+)$")
	--print(bufname)
	--print(extension)
	-- Set search_file_name to current buffer name and change extension if necessary
	local search_file_name
	if extension == "c" then
		search_file_name = bufname:gsub("%.(c)$", ".h")
	elseif extension == "cpp" then
		search_file_name = bufname:gsub("%.(cpp)$", ".h")
	elseif extension == "h" then
		search_file_name = bufname:gsub("%.(h)$", ".c")
	else
		return
	end

	local dir_path = string.match(search_file_name, "(.*/)")
	local file_name = string.match(search_file_name, "[^/]*$")
	-- Extract parent folder of dir_path
	local parent_folder = string.match(dir_path:sub(1, -2), "(.*/).*/")
	--print(dir_path)
	--print(file_name)
	--print(parent_folder)
	local b_file_name = "/" .. file_name

	for _, buffer in ipairs(api.nvim_list_bufs()) do
		local bufname = api.nvim_buf_get_name(buffer)
		if bufname:find(b_file_name, 1, true) then
			vim.api.nvim_set_current_buf(buffer)
			return
		end
	end

	local cmd = 'fdfind -g -t f "' .. file_name .. '" ' .. parent_folder
	--print(cmd)
	local result = vim.fn.systemlist(cmd)
	--print (#result)
	if not (#result > 0) then
		return
	end
	for _, file in ipairs(result) do
		--print (file)
		vim.api.nvim_command("edit ".. file)
	end

end




--local api = vim.api
--local cmd = vim.cmd
--
--local function search_buffer(file_name)
--  for _, buf_nr in ipairs(vim.fn.range(1, vim.fn.bufnr('$'))) do
--    local buf_name = vim.fn.bufname(buf_nr)
--    if buf_name ~= '' and vim.fn.fnamemodify(buf_name, ':t') == file_name then
--      vim.fn.switchbuf(buf_nr)
--      return true
--    end
--  end
--  return false
--end
--
---- Example usage: search for a file named "example.txt"
--if not search_buffer('example.txt') then
--  print('File not found in opened buffers')
--end


-- Define a function to search for the corresponding header/source file
--function header_source()
--
--	if not search_buffer("esmr5_mbus.c") then
--		print ("File not found esmr5_mbus.c")
--	end



--  -- Get the file extension of the current buffer
--  local ext = api.nvim_buf_get_option(0, 'filetype')
--  print(ext)
--  
--  -- Define the search pattern based on the file extension
--  local pattern = ''
--  if ext == 'c' or ext == 'cpp' then
--    pattern = '*.h'
--  elseif ext == 'h' then
--    pattern = '*.c,*.cpp'
--  else
--    return
--  end
--
--  local bufnr = vim.fn.bufnr(pattern)
--
--  -- Search for the corresponding file in the parent directory
--  local parent_dir = vim.fn.expand('%:p:h')
--  local cmd = 'fdfind -d 1 -t f "' .. pattern .. '" ' .. parent_dir
--  local result = vim.fn.systemlist(cmd)
--
--  -- If the file is found, open it in a new buffer
--  if #result > 0 then
--    for _, file in ipairs(result) do
--      if not vim.fn.bufwinnr(file) > 0 then
--        cmd('e ' .. file)
--        break
--      end
--    end
--  else
--    print('No corresponding file found')
--  end
--end

-- create a mapping that calls my_function
--vim.api.nvim_set_keymap('n', '<leader>h', ':lua vim.api.nvim_exec("call search_corresponding_file()", false)<CR>', {noremap=true})

vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua source_header()<CR>', {noremap=true, silent=true})


