-- Options are automatically loaded before lazy.nvim startupcolor
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- block cursor
vim.opt.guicursor = ""

-- disabling banner for netrw which is default file manager for vim
vim.cmd("let g:netrw_banner = 0")

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.showmode = true

-- better tabbing
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- word wrapping
vim.opt.wrap = true

-- make sure no garbage files are left around
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- better search
vim.opt.incsearch = true
vim.opt.inccommand = "nosplit"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- better colors
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- at least 8 spaces top and bottom when scrolling
vim.opt.scrolloff = 8

-- something with the left side of the screen?
vim.opt.signcolumn = "yes"

-- backspace can get rid of these characters in one swoop
vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.splitright = true
vim.opt.splitbelow = true

--update faster
vim.opt.updatetime = 50

--column on the right side, tells me when the line will start to wrap
vim.opt.colorcolumn = "81"

vim.opt.mouse = "a"

-- make all floating windows have rounded border
-- vim.o.winborder = "rounded"

-- "consist editting styles across editors"
vim.g.editorconfig = true
