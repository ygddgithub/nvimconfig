local opt = vim.opt
local g = vim.g

-- 界面设置
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.cursorline = true
opt.wrap = false

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- 外观
opt.termguicolors = true
opt.background = 'dark'
opt.scrolloff = 8
opt.sidescrolloff = 8

-- 文件
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- 其他
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.completeopt = 'menuone,noselect'
opt.timeoutlen = 300
opt.updatetime = 50

-- Neovim 0.12 新特性
opt.splitkeep = 'screen'  -- 改善分割行为

-- 禁用 netrw (使用 nvim-tree)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
