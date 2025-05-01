return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    -- "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require('telescope.builtin')
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.open,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap.set -- for conciseness

    local function get_layout_strategy()
      return vim.o.columns < 120 and "vertical" or "horizontal"
    end

    local function map_telescope_key(lhs, picker, desc)
      keymap('n', lhs, function()
        builtin[picker]({
          layout_strategy = get_layout_strategy(),
          hidden = true,
          no_ignore = true,
        })
      end, { desc = desc })
    end

    map_telescope_key('<leader>ff', 'find_files', 'Telescope find files')
    map_telescope_key('<leader>fg', 'live_grep', 'Telescope live grep')
    map_telescope_key('<leader>fb', 'buffers', 'Telescope buffers')
    map_telescope_key('<leader>fh', 'help_tags', 'Telescope help tags')

  end
}
