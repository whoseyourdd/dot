local M = {}
local whichkey = require("which-key")

local mappings = {
	-- LSP Action
	{
		key = "<leader>lr",
		cmd = vim.lsp.buf.rename,
		desc = "[L]sp [R]ename"
	},
	-- {
	-- 	key = "<leader>lo",
	-- 	cmd = vim.lsp.buf.organize_imports,
	-- 	desc = "[L]sp [O]rganize Imports"
	-- },
	{
		key = "<leader>la",
		cmd = vim.lsp.buf.code_action,
		desc = "[L]sp [A]ction"
	},

	-- Jump Action
	{
		key = "<leader>gD",
		cmd = vim.lsp.buf.definition,
		desc = "[G]oto [D]efinition"
	},
	{
		key = "<leader>gd",
		cmd = vim.lsp.buf.declaration,
		desc = "[G]oto [D]eclaration"
	},
	{
		key = "<leader>gi",
		cmd = vim.lsp.buf.implementation,
		desc = "[G]oto [I]mplementation"
	},

	-- Telescope
	{
		key = "<leader>gr",
		cmd = require("telescope.builtin").lsp_references,
		desc = "[G]oto [R]eferences"
	},
	{
		key = "<leader>fs",
		cmd = require("telescope.builtin").lsp_document_symbols,
		desc = "[F]ind [S]ymbols"
	},
	{
		key = "<leader>gs",
		cmd = require("telescope.builtin").lsp_dynamic_workspace_symbols,
		desc = "[G]lobal [S]ymbols"
	},

	-- Additional
	{
		key = "<S-k>",
		cmd = vim.lsp.buf.hover,
		desc = "Hover Documentation"
	},
	{
		key = "<C-k>",
		cmd = vim.lsp.buf.signature_help,
		desc = "Signature Documentation"
	},
}

M.mapping = mappings
M.whichkey = whichkey

return M
