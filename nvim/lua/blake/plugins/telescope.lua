return{
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "andrew-george/telescope-themes",
    },

    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.load_extension("fzf")
        telescope.load_extension("themes")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                    },
                },
            },
            extensions = {
                themes = {
                    layout_config = {
                        horizontal = {width = 0.8, height = 0.7,},
                    },
                    enable_previewer = true,
                    enable_live_preview = true,
                    ignore = {"vaporwave", "minicyan", "onelight", "randomhue"},
                    light_themes = {
                        ignore = true,
                        keywords = {"light", "day", "frappe", "morning"},
                    },
                    persist = {
                        enabled = true,
                        path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua"
                    },
                }
             },
         })

         vim.keymap.set("n", "<leader>ff", function()
            builtin.find_files({ hidden = true })
         end,{ desc = "file finder (including hidden ones)" })

        vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "find old files"})

         vim.keymap.set("n", "<leader>pWs", function()
             local word = vim.fn.expand("<cWORD>")
             builtin.grep_string({ search = word})
         end, { desc = "find connected words under cursor" })

         vim.keymap.set("n", "<leader>ths", "<cmd>Telescope themes<CR>", {noremap = true, silent = true, desc = "theme switcher"})
     end,
}
