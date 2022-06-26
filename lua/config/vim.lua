local opt = vim.opt
local g = vim.g

-- Encoding
opt.encoding = 'utf-8'

-- Leader map
g.mapleader = ','

-- Theme variant. Available: [dark|dimmed|dark_default|dark_colorblind|light|light_default|light_colorblind]
g.theme_variant = 'light'
opt.termguicolors = true


-- Line numbers
opt.number = true

-- Cmd height
opt.cmdheight = 1

-- Enable mouse
opt.mouse = 'a'

-- Show editing file in terminal title
opt.title = true


-- Set scrolling offset
opt.scrolloff = 10
opt.sidescrolloff = 10

-- Set vertical ruller
opt.colorcolumn = '80'

-- Use system clipboard
opt.clipboard = 'unnamedplus'

-- Confirm actions
opt.confirm = true

-- Disable backup files
opt.backup = false
opt.wb = false
opt.swapfile = false

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

-- Lines wrapping
opt.wrap = false

-- Don't redraw while executing macros (good perfomance confg)
opt.lazyredraw = true

-- Searching
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
