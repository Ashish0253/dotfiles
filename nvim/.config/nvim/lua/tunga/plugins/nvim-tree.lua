return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPLugin = 1

    nvimtree.setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        side = 'right',
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    --set keymaps
    local keymap = vim.keymap.set  -- vim.keymap.set recommended in newer nvim

    keymap('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  end
}
