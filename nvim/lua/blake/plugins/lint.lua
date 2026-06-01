return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    local go_linter = "golangcilint"

    lint.linters_by_ft = {
      go = { go_linter },
      -- use this later?
      -- python = { "pylint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    local ns = lint.get_namespace(go_linter)

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
    }, ns)

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>lt", function()
      lint.try_lint()
      require("telescope.builtin").diagnostics({ bufnr = 0 })
    end, { desc = "Trigger linting for current file and show errors" })
  end,
}
