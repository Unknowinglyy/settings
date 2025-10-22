return {
	"j-morano/buffer_manager.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local ui = require("buffer_manager.ui")

		require("buffer_manager").setup({
			focus_alternate_buffer = true, --cursor starts not on current buffer
			line_keys = "1234567890", --keys to jump to buffers
		})

		vim.keymap.set("n", "<leader>bb", ui.toggle_quick_menu, { desc = "toggle the buffer menu" })

        -- buffer session save
        local file ='/home/blake/.local/share/nvim/buffer_manager'
        vim.keymap.set("n", "<leader>bs", function()
            ui.save_menu_to_file(file)
            vim.notify("buffer session saved.", vim.log.levels.INFO)
        end, { desc = "save buffer session" })

        -- buffer session load
        vim.keymap.set("n", "<leader>bl", function()
            ui.load_menu_from_file(file)
            ui.toggle_quick_menu()
            vim.notify("buffer session loaded.", vim.log.levels.INFO)
        end, { desc = "load buffer session" })

        -- auto save & load buffer sessions on exit and startup
        -- might change this later so that it checks for a saved buffer list before loading
        -- local group = vim.api.nvim_create_augroup("buffer_manager_auto", { clear = true })

        -- vim.api.nvim_create_autocmd("VimEnter", {
        --     group = group,
        --     callback = function()
        --         local ok = pcall(ui.load_menu_from_file)
        --         if ok then
        --             vim.notify("Buffer session auto-loaded", vim.log.levels.INFO)
        --         else
        --             vim.notify("Buffer session not found", vim.log.levels.WARN)
        --         end
        --     end,
        --     desc = "auto-load buffer session on startup"
        -- })
	end,
}
