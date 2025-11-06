-- Neovim 0.12 配置
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_create_user_command('CopyMessages', function()
  vim.cmd('redir @+ | silent messages | redir END')
  vim.notify('All messages copied to clipboard!', vim.log.levels.INFO)
end, {})

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
