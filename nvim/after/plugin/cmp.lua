local cmp = require 'cmp'
local luasnip = require 'luasnip'

require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

local kind_icons = require('whoseyourdd.icons').kind

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		expandable_indicator = "true",
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = kind_icons[vim_item.kind]
			vim_item.menu = ({
				nvim_lsp = "[lsp]",
				nvim_lua = "[lua]",
				luasnip = "[lua]",
				buffer = "[buff]",
				path = "[path]",
				codeium = "[codeium]"
			})[entry.source.name]
			return vim_item
		end,
	},
	mapping = cmp.mapping.preset.insert {
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'codeium' },
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}
