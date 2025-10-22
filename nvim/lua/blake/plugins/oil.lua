return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons"},
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = {},
            keymaps = {},
            delete_to_trash = true,
            view_options = {
                show_hidden = true,
            },
            skip_confirm_for_simple_edits = true,
        })

        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "open parent dir" })
        vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "toggle floating window for oil"})
        vim.api.nvim_create_autocmd("FileType",{
            pattern = "oil",
            callback = function()
                vim.opt_local.cursorline = true
            end,
        })

    end
}
