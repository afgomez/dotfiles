-- HACK: used in the <CR> mapping close the completion if the match is exact.
local snippet_kind = 15

return {
   'hrsh7th/nvim-cmp',
   dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'petertriho/cmp-git',

      -- Snippets
      {
         "L3MON4D3/LuaSnip",
         version = "2.*",
         build = "make install_jsregexp",
         config = function()
            require('luasnip').setup()
            require("luasnip.loaders.from_vscode").lazy_load()
         end
      },
      'saadparwaiz1/cmp_luasnip',
   },
   config = function()
      local luasnip = require('luasnip')
      local cmp = require('cmp')

      cmp.setup({
         snippet = {
            expand = function(args)
               luasnip.lsp_expand(args.body)
            end
         },
         preselect = cmp.PreselectMode.Item,
         mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping(function(fallback)
               if cmp.visible() then
                  local current_entry = cmp.get_selected_entry()

                  if not current_entry then
                     -- HACK: Internal API.
                     current_entry = cmp.core.view:get_first_entry()
                  end

                  if current_entry.exact and current_entry.completion_item.kind ~= snippet_kind then
                     cmp.close()
                     fallback()
                  else
                     cmp.confirm({ select = true })
                  end
               else
                  fallback()
               end
            end),
            ['<Tab>'] = cmp.mapping(function(fallback)
               if cmp.visible() then
                  cmp.confirm({ select = true })
               elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
               else
                  fallback()
               end
            end),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
               if luasnip.jumpable(-1) then
                  luasnip.jump(-1)
               else
                  fallback()
               end
            end)
         }),
         sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
         }),
         experimental = {
            ghost_text = true,
         }
      })

      cmp.setup.filetype('gitcommit', {
         sources = cmp.config.sources({
            { name = 'git' },
            { name = 'path' },
         })
      })
   end
}
