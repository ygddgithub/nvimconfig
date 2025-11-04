-- ~/.config/nvim/lua/config/lsp.lua
-- Neovim 0.11+ 原生 LSP（已废弃 lspconfig.setup）

local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- ==================== 1. 快捷键（不变） ====================
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K',  vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format { async = true }
  end, bufopts)
end

-- ==================== 2. Capabilities（不变） ====================
local capabilities = cmp_nvim_lsp.default_capabilities()

-- ==================== 3. Mason（不变） ====================
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls", "pyright", "ts_ls", "html", "cssls", "jsonls", "yamlls"
  },
})

-- ==================== 4. 新版原生配置（关键！） ====================
-- 所有服务器统一写在这里，mason 会自动安装
vim.lsp.config('lua_ls', {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config('pyright',   { on_attach = on_attach, capabilities = capabilities })
vim.lsp.config('ts_ls',     { on_attach = on_attach, capabilities = capabilities })
vim.lsp.config('html',      { on_attach = on_attach, capabilities = capabilities })
vim.lsp.config('cssls',     { on_attach = on_attach, capabilities = capabilities })
vim.lsp.config('jsonls',    { on_attach = on_attach, capabilities = capabilities })
vim.lsp.config('yamlls',    { on_attach = on_attach, capabilities = capabilities })

-- ==================== 5. 启动所有服务器 ====================
vim.lsp.enable({
  "lua_ls", "pyright", "ts_ls", "html", "cssls", "jsonls", "yamlls"
})

-- ==================== 6. 诊断美化（不变） ====================
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = { border = "rounded", source = "always" },
})
