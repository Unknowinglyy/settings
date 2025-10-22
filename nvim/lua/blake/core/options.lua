-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- block cursor
vim.opt.guicursor = ""

-- disabling banner for netrw which is default file manager for vim
vim.cmd("let g:netrw_banner = 0")

vim.opt.nu = true
vim.opt.relativenumber = true

-- better tabbing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
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
vim.opt.backspace = {"start", "eol", "indent" }

vim.opt.splitright = true
vim.opt.splitbelow = true

--update faster
vim.opt.updatetime = 50

--column on the right side
vim.opt.colorcolumn = "80"

vim.opt.mouse = "a"

-- "consist editting styles across editors"
vim.g.editorconfig = true

-- moonfly colorscheme settings
vim.g.moonflyTransparent = true
vim.g.moonflyUnderlineMatchParen = true
vim.g.moonflyVirtualTextColor = true
