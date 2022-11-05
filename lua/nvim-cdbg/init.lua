print("In Nvim-cdbg")
local M = {}

local c_compile_cmd = 'cmake --build'
local relative_build = '/out/build/'

M.example = function()
	print("In Example")
end

-- [[ New commands used:
-- * [ ] vim.cmd -> Runs a vimscript command.
-- * [ ] vim.fn.stridx() -> Runs a function from vim
-- * [ ] vim.fn.getreg('x') -> Get value of register
-- ]]

M.compile = function()
	local run = c_compile_cmd .. " " .. vim.fn.getcwd() .. relative_build
	-- print(run)
	--vim.cmd("!"..run)
	-- Check if there is a git repo.
	vim.cmd("let @x = system('git rev-parse --show-toplevel')")
	-- Compare strings to check if it is a git repo or not.
	-- If the command contains 'fatal', then it is not a git repo.
	local no_git = vim.fn.stridx(vim.fn.getreg('x'),"fatal")
	print(vim.fn.getreg('x'))
	print(no_git)
	-- Check only if 'fatal' is the first word. (Some cases could be that a directory has 'fatal' as a subdirectory.)
	if no_git == 0 then
		print("ERROR: Not a Git Repo.")
		print("SOLUTION: Initialize a git repo in the desired root directory for the project.")
	else
		print("Has Git Repo")
		-- Remove 'new line' character from the command.
		local root_dir = vim.fn.getreg('x'):gsub("[\n]","")
		run = c_compile_cmd .. " " .. root_dir .. relative_build
		vim.cmd("!"..run)
	end

end

M.startup = function()
	--vim.cmd('echo "hello in lua function"')
	vim.g.termdebug_wide = 1
	vim.cmd('packadd termdebug')
	vim.cmd('Termdebug')
end

-- M.compile()

return M
