local keymap = vim.keymap

-- 使用 Neovim 0.12 的 vim.keymap.set
local map = vim.keymap.set

-- 模式缩写
local opts = { noremap = true, silent = true }

-- 正常模式快捷键
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>', opts)

-- 窗口管理
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- 调整窗口大小
map('n', '<M-left>', ':vertical resize -2<CR>', opts)
map('n', '<M-right>', ':vertical resize +2<CR>', opts)
map('n', '<M-up>', ':resize -2<CR>', opts)
map('n', '<M-down>', ':resize +2<CR>', opts)

-- 缓冲区管理
map('n', '<S-l>', ':bnext<CR>', opts)
map('n', '<S-h>', ':bprevious<CR>', opts)
map('n', '<leader>bd', ':Bdelete<CR>', opts)

-- LSP 相关
map('n', 'gd', vim.lsp.buf.definition, { desc = '跳转到定义' })
map('n', 'gr', vim.lsp.buf.references, { desc = '查看引用' })
map('n', 'K', vim.lsp.buf.hover, { desc = '悬停文档' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '代码操作' })
map('n', '<leader>rn', vim.lsp.buf.rename, { desc = '重命名' })

-- 使用 Neovim 0.12 的 vim.iter 示例
map('n', '<leader>ut', function()
  local iter = vim.iter
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local transformed = iter(lines)
    :map(function(line)
      return line:upper()
    end)
    :totable()
  vim.api.nvim_buf_set_lines(0, 0, -1, false, transformed)
end, { desc = '转换文本为大写 (演示 iter)' })
