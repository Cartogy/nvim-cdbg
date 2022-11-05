# STEPS For Creating Lua Plugin.

0. Have your plugin contain the relative path to this folder.
	- ln -s ~/path/to/plug/nvim-dbg ~/.config/nvim/bundles (For Pathogen)
1. Creating a *plugin* folder ensures that all code in the *plugin* gets automatically executed. (e.g., Usually for Default mappings or command creations.)
2. Create a *lua* folder to store all code. (:help runtimepath)
	- This folder is an important folder that neovim looks for. 
	- Does not get automatically executed, but becomes available to the user.
	- To execute it, run:
		```lua
		:lua require'nvim-dbg'
		```
		This will import the functionality of 'nvim-dbg' into the neovim environment.
3. Structure of Lua 
	-lua
	    - nvim-dbg
	        - init.vim

	OR

	- lua
	    - nvim-dbg.lua

4. Lua caches the setup when calling the *require* function.
	- Lua always checks the cache when running the *require* function.

*require* is shared amongst all plugins. It uses the cached *require* value when it ran.

## Setting up a Plugin

1. There is an idiom of creating a local *M* to be considered a *module*:
	```lua
	local M = {}
	M.example = function()
		print("Example")
	end

	return M
	```
	- *M* is a table, and everything in between is setting up the field for the module *M*.

2. This allows access to functions of the plugin via the *require* function:
	```
	:lua print(vim.inspect(require'nvim-dbg'))
	```
	- This is how you see the common pattern:

	```lua
	require('telescope').setup( {...} )
	```

3. Setting up a dummy setup function to delay startup:
	
	```lua
	M.setup(opts) = function()
		print("Print Options", opts)
	end
	```

## Using Lua as a REPL
1. Write file
2. Run:
	```lua
	:source %
	```
	To execute the lua file.

## Using Lua as a REPL

We will have to ovveride the cache if we want to re-load the plugin via *require*.

1. Neovim stores all packages in the *package* table:
	- We can check if our plugin has been loaded via: print(package.loaded["nvim-dbg"])
2. We can make our plugin not be stored in the table by:
	```lua
	:lua package.loaded["nvim-dbg"] = nil
	```
	(If a key does not exist in Lua, it returns *nil*)
