return{
    {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile"},
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = {
                enable = true,
            },
            indent = { enable = true },

            ensure_installed = {
                "json",
                "javascript",
                "go",
                "yaml",
                "html",
                "css",
                "python",
                "http",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "gitignore",
                "c",
                "rust",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                },
            },
            additional_vim_regex_highlighting = false,
        })
      end
    }
}
