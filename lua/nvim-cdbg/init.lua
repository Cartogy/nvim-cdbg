
local M = {}

local c_compile_cmd = 'cmake --build'
local relative_build = '/out/build/'

--M.example = function()
--	print("In Example")
--end

M.setup = function(opts)
	if opts['cmd'] then
		c_compile_cmd = opts['cmd']
	end
	if opts['relative_build'] then
		relative_build = opts['relative_build']
	end
--	print("Running nvim-cdbg")
end

M.set_compile_cmd = function(s)
	c_compile_cmd = s
end

M.set_build_path = function(b)
	relative_build = b
end

-- [[ New commands used:
-- * [ ] vim.cmd -> Runs a vimscript command.
-- * [ ] vim.fn.stridx() -> Runs a function from vim
-- * [ ] vim.fn.getreg('x') -> Get value of register
-- ]]

-- Compile using CMake
M.compile = function()
	local run = c_compile_cmd .. " " .. vim.fn.getcwd() .. relative_build
	-- print(run)
	--vim.cmd("!"..run)
	-- Check if there is a git repo.
	vim.cmd("let @x = system('git rev-parse --show-toplevel')")
	-- Compare strings to check if it is a git repo or not.
	-- If the command contains 'fatal', then it is not a git repo.
	
	-- 1) Check if there is root
	local no_git = vim.fn.stridx(vim.fn.getreg('x'),"fatal")
	if no_git == 0 then
		print("ERROR: Not a git Repository")
		return
	else
		-- print("Has git")
		-- 2) Check if there is CMakeLists.txt file in root
		local root_dir = vim.fn.getreg('x'):gsub("[\n]","")
		local cmake_lists_file = root_dir .. '/CMakeLists.txt'
		local has_cmake = vim.fn.filereadable(cmake_lists_file)

		if has_cmake == 1 then
			-- 3) Check if there is the given build path.
			-- print("Has CMake")
			local build_dir = root_dir .. relative_build
			local has_build = vim.fn.isdirectory(build_dir)

			if has_build == 1 then
				run = c_compile_cmd .. " " .. root_dir .. relative_build
				vim.cmd("!"..run)
			else
				print("ERROR: Build path does not exists.")
				print("Expected to see: '" .. relative_build .. "'")
			end
		else
			print("ERROR:No 'CMakeLists.txt' in root directory.")
		end

	end
end


-- Begin Debugging
M.start_debug = function()
	--vim.cmd('echo "hello in lua function"')
    -- The option below caused an error when terminal font was too big.
	--vim.g.termdebug_wide = 1
vim.cmd("packadd termdebug")
	vim.cmd("Termdebug")
    vim.cmd("Source")
    -- Move the Source window to the right.
    vim.cmd('execute "normal! \\<c-w>L"')
end

return M
