return {
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
    local builtin_schemes = require("telescope._extensions.themes").builtin_schemes

    telescope.load_extension("fzf")
    telescope.load_extension("themes")

    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          --don't show files in .git directories
          "%.git",
        },
        preview = {
          -- treesitter = false,
        },
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
            horizontal = {
              width = 0.8,
              height = 0.7,
            },
          },
          enable_previewer = true,
          enable_live_preview = true,
          ignore = vim.list_extend(builtin_schemes, {
            "vaporwave",
            "miniwinter",
            "minisummer",
            "minispring",
            "minischeme",
            "miniautumn",
            "minicyan",
            "onelight",
            "randomhue",
            "catppuccin-latte",
            "kanagawa-lotus",
            "kanagawa-paper-canvas",
            "tokyonight-day",
            "rose-pine-dawn",
            "bamboo-light",
            "evergarden-summer",
            "evergarden-spring",
            "evergarden-winter",
            "evergarden-fall",
            "jellybeans-light",
            "jellybeans-hc-light",
            "jellybeans-hc-light",
            "jellybeans-mono-light",
            "jellybeans-muted-light",
            "jellybeans-muted-light",
          }),
          light_themes = {
            ignore = true,
            keywords = { "light", "day", "frappe", "morning" },
          },
          persist = {
            enabled = true,
            path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>ff", function()
      builtin.find_files({
        hidden = true,
        -- also show files in the code directory along with cwd
        search_dirs = { "~/code/" },
      })
    end, { desc = "file finder (including hidden ones)" })

    vim.keymap.set("n", "<leader>fh", function()
      builtin.help_tags()
    end, { desc = "search help" })

    vim.keymap.set("n", "<leader>en", function()
      builtin.find_files({
        cwd = vim.fn.stdpath("config"),
      })
    end, { desc = "start editting neovim files" })

    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "find old files" })

    vim.keymap.set("n", "<leader>pWs", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end, { desc = "find connected words under cursor" })

    vim.keymap.set(
      "n",
      "<leader>th",
      "<cmd>Telescope themes<CR>",
      { noremap = true, silent = true, desc = "theme switcher" }
    )
  end,
}
