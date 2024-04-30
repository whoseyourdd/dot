local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "" .. desc
		end
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end
	local mappings = require('whoseyourdd.config.mapping')

	local keymap = mappings.mapping

	for _, mapping in pairs(keymap) do
		nmap(mapping.key, mapping.cmd, mapping.desc)
	end
end

local servers = {
	clangd = {},
	gopls = {},
	pyright = {},
	tsserver = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("neodev").setup({
	library = { plugins = { "nvim-dap-ui" }, types = true },
})

local setup_handlers = function(server_name)
	if server_name == 'jdtls' then
		return
	end
	require('lspconfig')[server_name].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = servers[server_name],
		filetypes = (servers[server_name] or {}).filetypes,
	})
end

local DEFAULT_SETTINGS = {
	ensure_installed = vim.tbl_keys(servers),
	automatic_installation = false,
	handlers = {
		setup_handlers
	}
}

require('mason').setup()
require('mason-lspconfig').setup(DEFAULT_SETTINGS)
