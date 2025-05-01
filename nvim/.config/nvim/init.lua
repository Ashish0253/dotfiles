vim.g.mapleader = ","

require("tunga.lazy")
require("options")
-- require('plugins')

-- require("lazy")
-- vim.cmd("colorscheme sorbet")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")

-- init.lua
local g = vim.g

local keymap = vim.api.nvim_set_keymap

-- g.have_nerd_font = true

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the down window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the up window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })

-- vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
-- vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 500 })
	end,
})

keymap("n", "<leader><space>", ":ALEFix<CR>", { noremap = true, silent = true })
keymap("n", "<leader>/", "gcc", { noremap = true, silent = true })
keymap("n", "<leader>t", ":tabnew<CR>", { noremap = true, silent = true })

-- Set up lspconfig
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Replace `<YOUR_LSP_SERVER>` with each LSP server you've enabled
-- require('lspconfig')['pyright'].setup({
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- })

-- require('lspconfig')['ts_ls'].setup({
--   capabilities = capabilities,
-- })

vim.g.ale_fixers = {
	python = { "black", "isort" },
}
vim.g.ale_linters = {
	python = { "pylint" },
}

vim.g.ale_fix_on_save = 1
vim.g.ale_python_black_options = "--line-length 88"
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_on_text_changed = "always"

vim.g.ale_linters_explicit = 1

-- slate, desert, sorbet, evening, habamax, retrobox, peachpuff

-- local telescope = require('telescope.builtin')
--
-- local function filter_diagnostics_by_message()
--
--   local term = vim.fn.input('Search for diagnostics: ')
--
--   if term == '' then
--     print('No search term entered')
--     return
--   end
--
--   local all_diagnostics = vim.diagnostic.get(0)
--   local filtered_diagnostics = {}
--
--   for _, diag in ipairs(all_diagnostics) do
--     if diag.message:match(term) then
--       table.insert(filtered_diagnostics, diag)
--     end
--   end
--
--   if #filtered_diagnostics > 0 then
--     telescope.diagnostics({
--       results = filtered_diagnostics
--     })
--   else
--     print("No diagnostics found matching: '" .. term .. "'")
--   end
-- end
--
--
-- vim.api.nvim_set_keymap('n', '<leader>d', ':lua filter_diagnostics_by_message()<CR>', { noremap = true, silent = true })
