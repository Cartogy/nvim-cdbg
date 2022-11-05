# Nvim-cdbg

**nvim-cdbg** is meant to be a simple plugin to debug using neovim.
It is a thin wrapper over the **Termdebug** package, that is included in *vim/nvim*.

## What is nvim-cdbg for?

* Facilitate the compilation and debugging of projects utilizing *cmake*.
* Meant for more complicated projects with multiple sub-directories.

## What is nvim-cdgb not built for?

* Not meant to be used for basic/simple projects where the command *:make* would suffice. (e.g., single-directory projects)
* Not a plugin that can be used to debug in all programming languages. (See nvim-dap for this [https://github.com/mfussenegger/nvim-dap](nvim-dap)).

## Why another nvim debugger?

There are two main debugger plugins for neovim (that the author is aware of): *vimspector* and *nvim-dap*.
These debugger plugins seem too complicated for my basic needs, so I set out to create a simple plugin to facilitate debugging in C/C++ when dealing with large projects.

# Dependencies

* neovim (with '+terminal' option included)
* git
* gdb
* cmake

# TODO

* [ ] Display menu to select which binary to execute in GDB.
* [ ] Get Documentation working properly.
