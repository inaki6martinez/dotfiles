vim.keymap.set('n', '<leader>zh', function()
	--local cmd = io.popen("sh your_script.sh")
	local cmd = "pwd"
	print("hello from source header")
	
	-- read the output of the shell script and print it to the console
	local handle = io.popen(cmd)
	local output = handle:read("*a")
	print(output)
	
	-- close the file handle to the shell script
	handle:close()
end)
