require('options')
require('plugins')

vim.cmd("colorscheme sorbet")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")

-- init.lua 
local g = vim.g

vim.g.mapleader = ','
local keymap = vim.api.nvim_set_keymap 

-- g.have_nerd_font = true


vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true }) 
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') 
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the down window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the up window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
-- vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({higroup='Visual', timeout=500})
  end,
})


keymap('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
keymap('n', '<leader><space>', ':ALEFix<CR>', { noremap = true, silent = true })
keymap('n', '<leader>/', 'gcc', { noremap = true, silent = true })
keymap('n', '<leader>t', ':tabnew<CR>', { noremap = true, silent = true })


local function get_layout_strategy()
  return vim.o.columns < 120 and "vertical" or "horizontal"
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({
    layout_strategy = get_layout_strategy()
  })
end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', function()
  builtin.live_grep({
    layout_strategy = get_layout_strategy()
  })
end, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', function()
  builtin.buffers({
    layout_strategy = get_layout_strategy()
  })
end, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', function()
  builtin.help_tags({
    layout_strategy = get_layout_strategy()
  })
end, { desc = 'Telescope help tags' })

-- vim.keymap.set('n', '<leader>d', '<cmd>lua builtin.diagnostics()<CR>', { noremap = true, silent = true })

--
-- -- Tree-sitter setup
require'nvim-treesitter.configs'.setup {
  -- Automatically install parsers for all supported languages
  -- ensure_installed = { "python", "lua" },
  
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python" },
  
  -- Enable various Tree-sitter features
  highlight = {
    enable = true,  -- Enable syntax highlighting
  },

--     Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
  indent = {
    enable = true,  -- Enable Tree-sitter based indentation
  },

  -- Enable auto-install for missing parsers
  auto_install = true,  -- Automatically install parsers for languages when needed
}


-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    side = 'right',
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


-- Set up nvim-cmp
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,

  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim-lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  }),
})

-- Use buffer source for '/' and '?'
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }), 
  matching = { disallow_symbol_nonprefix_matching = false },
})

-- Set up lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Replace `<YOUR_LSP_SERVER>` with each LSP server you've enabled 
require('lspconfig')['pyright'].setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities, 
})

-- require('lspconfig')['ts_ls'].setup({
--   capabilities = capabilities,
-- })

vim.g.ale_fixers = {
  python = { 'black', 'isort' },
}
vim.g.ale_linters = {
  python = { 'pylint' },
}

vim.g.ale_fix_on_save = 1
vim.g.ale_python_black_options = '--line-length 88'
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_on_text_changed = 'always'

vim.g.ale_linters_explicit = 1

vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })


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
