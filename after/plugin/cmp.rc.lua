local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'

local function formatForTailwindCSS(entry, vim_item)
  if vim_item.kind == 'Color' and entry.completion_item.documentation then
    local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
    if r then
      local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
      local group = 'Tw_' .. color
      if vim.fn.hlID(group) < 1 then
        vim.api.nvim_set_hl(0, group, { fg = '#' .. color })
      end
      vim_item.kind = "●"
      vim_item.kind_hl_group = group
      return vim_item
    end
  end
  vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
  return vim_item
end


require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },

    { name = 'bootstrap' },
    { name = 'html-css' },

  }, {
    { name = 'buffer' },
  }),

  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      before = function(entry, vim_item)
        if entry.source.name == "html-css" then
          vim_item.menu = entry.completion_item.menu
        end

        vim_item = formatForTailwindCSS(entry, vim_item)
        return vim_item
      end
    })
  },

  option = {
    enable_on = {
      "html",
      "jsx",
      "tsx"
    },                                           -- set the file types you want the plugin to work on
    file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
    style_sheets = {
      -- example of remote styles, only css no js for now
      "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
      "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
    }
  }

})


require("bootstrap-cmp.config").setup({
  file_types = { -- Specify the file types where you want to use this completion
    "html",
    "javascript",
    "css",
  },
  url = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css", -- Set your Bootstrap URL or CDN link here
})


vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
