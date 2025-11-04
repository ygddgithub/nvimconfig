-- Telescope 配置
local telescope = require('telescope')
telescope.setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      vertical = { width = 0.9 }
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
  },
})

-- 自动补全配置
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- 命令模式补全
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- 使用 Neovim 0.12 新特性的示例
local function demonstrate_iter()
  local iter = vim.iter
  
  -- 示例：处理缓冲区行
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  
  -- 使用 iter 过滤和转换
  local result = iter(lines)
    :filter(function(line) return #line > 0 end)  -- 过滤空行
    :map(function(line) return ">> " .. line end) -- 添加前缀
    :totable()
  
  print("处理了 " .. #result .. " 行非空文本")
end

-- 演示快捷键
vim.keymap.set('n', '<leader>di', demonstrate_iter, { desc = '演示 iter 功能' })
