return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile"},
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    --configure treesitter
    treesitter.setup({
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "python",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "bash",
        "dockerfile",
        "gitignore",
      },
      sync_install = false, -- install parsers synchronously (only on `:TSInstall` command)
      auto_install = true,  -- automatically install missing parsers when entering buffer
      ignore_install = {},  -- list of parsers to ignore installing
      modules = {},  -- just to remove lsp warning
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end
}
