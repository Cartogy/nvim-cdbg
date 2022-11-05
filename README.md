# Nvim-cdbg

**nvim-cdbg** is meant to be a simple plugin to debug using neovim.
It is a thing wrapper over the **Termdebug** package already included in *vim/nvim*.

## What is nvim-cdbg for?

* Facilitate the compilation and debugging of projects utilizing *cmake*.
* Meant for more complicated projects with multiple sub-directories.

## What is nvim-cdgb not built for?

* Not meant to be used for basic/simple projects where the command *:make* would suffice. (e.g., single-directory projects)
* Not a plugin that can be used to debug in all programming languages. (See nvim-dap for this).

# Dependencies

* neovim (with +terminal)
* git
* gdb
* cmake
