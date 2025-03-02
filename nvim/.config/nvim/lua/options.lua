local opt = vim.opt


opt.mouse = 'a'

opt.showmode = true

vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

opt.breakindent = true
opt.undofile = true
opt.signcolumn = 'yes'
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true

opt.list = true
opt.listchars = { tab = '>> ', trail = '·', nbsp = '_' }

opt.inccommand = 'split'
opt.cursorline = true
opt.scrolloff = 999

----------------------
--- Neovim UI
----------------------
opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.swapfile = false
opt.colorcolumn = '80'
opt.showmatch = true

----------------------
--- Tabs, indent
----------------------
opt.softtabstop = 2
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true

opt.colorcolumn = '80'
opt.wrap = false
opt.termguicolors = true

