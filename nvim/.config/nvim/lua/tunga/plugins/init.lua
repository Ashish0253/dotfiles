local g = vim.g

local disabled_built_ins = {
	"netrwSettings",
	"netrwFileHandlers",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end

local vim = vim

return {
	-- Plugin specifications

	-- General Plugins
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically

	-- Theme
	{ "AlexvZyl/nordic.nvim", branch = "main" },

	-- For vsnip users

	-- Diagnostics and other utilities
	{ "dense-analysis/ale" },
	-- { 'psf/black' },
	-- { 'lewis6991/gitsigns.nvim' }, -- Figure out what it does before installing it
	-- { 'junegunn/fzf' },
	-- { 'numToStr/Comment.nvim' },
	-- { 'vim-pyright/pyright' },

	-- On-demand loading: loaded when the specified command is executed
	-- { 'preservim/nerdtree', cmd = 'NERDTreeToggle' },
}
