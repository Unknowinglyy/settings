-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- turn silent to true if too annoying
local opts = { noremap = true, silent = false }

vim.g.mapleader = " "
vim.g.localmapleader = " "

-- Ctrl + c for exiting
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move lines down in visual selection mode" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move lines up in visual selection mode" })

-- joins the line below
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down with centered cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up with centered cursor" })

-- center when moving through the search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "n", "nzzzv")

-- easier indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- pasting without replacing clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- same but in visual
vim.keymap.set("v", "p", '"_dp', opts)

-- delete without putting in clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "clear highlighted search", silent = true })

-- formats code
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- clear one character without putting in clipboard
vim.keymap.set("n", "x", '"_x', opts)

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- open new tab
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")
-- close current tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>")
-- go to next tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")
-- go to prev tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")
-- open current tab in a new tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>")

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "make splits equal" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close current split" })

vim.keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~") --gets file path relative to home dir
	vim.fn.setreg("+", filePath) -- copy file path to clipboard
	print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

-- open a terminal
vim.keymap.set("n", "<leader>tt", function()
	vim.cmd.vnew()
	vim.cmd.term()

	local term_win = vim.api.nvim_get_current_win()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(term_win, 10)
	vim.api.nvim_set_current_win(term_win)

	vim.cmd.startinsert() --start off in insert mode
end)

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "easier to quit terminal" })

vim.keymap.set("n", "<leader>tc", function()
	vim.g.cmptoggle = not vim.g.cmptoggle
	if vim.g.cmptoggle then
		vim.notify("toggling completions on", vim.log.levels.INFO)
	else
		vim.notify("toggling completions off", vim.log.levels.INFO)
	end
end, { desc = "toggle completions" })

vim.keymap.set("n", "<leader>tl", function()
	if vim.diagnostic.is_enabled() then
		vim.notify("toggling LSP off", vim.log.levels.INFO)
	else
		vim.notify("toggling LSP on", vim.log.levels.INFO)
	end
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle LSP for the current buffer" })

vim.keymap.set("n", "<leader>ll", ":Lazy <CR>", { desc = "open Lazy menu" })

vim.keymap.set("n", "<leader>yy", ":%y+<CR>", { desc = "yank entire file to clipboard"} )

vim.keymap.set("v", "<leader>yy", '"+y', { desc = "yank selection to clipboard"})
