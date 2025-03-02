print("treesitter iomport kr liya")

-- Tree-sitter setup
require'nvim-treesitter.configs'.setup {
  -- Automatically install parsers for all supported languages
  ensure_installed = "all",

  -- Enable various Tree-sitter features
  highlight = {
    enable = true,  -- Enable syntax highlighting
  },
  
  indent = {
    enable = true,  -- Enable Tree-sitter based indentation
  },

  -- Enable auto-install for missing parsers
  auto_install = true,  -- Automatically install parsers for languages when needed
}
