-- bootstrap lazy.nvim, LazyVim and your plugins
require("blake.core")
require("blake.lazy")
require("current-theme")

--makes comments autoinsert when pressing <CR>
--specifically done because it was not working for python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.formatoptions:append("ro")
  end,
})
