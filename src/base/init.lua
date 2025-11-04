-- Neovim 0.12 配置
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 基础设置
require('config.options')
-- 按键映射
require('config.keymaps')
-- 插件管理
require('config.plugins')
-- LSP 配置
require('config.lsp')
-- 其他插件配置
require('config.plugin-config')
