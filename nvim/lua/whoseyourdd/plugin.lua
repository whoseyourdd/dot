local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

	-- nvim config helper
	{
		"folke/neodev.nvim",
		opts = {},
	},

	-- plenary
	{
		"nvim-lua/plenary.nvim",
	},

	-- TreeSitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
			},
		},
		build = ":TSUpdate",
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason.nvim",
				config = true,
			},
			{
				"williamboman/mason-lspconfig.nvim",
			},
			-- DAP With UI
			{
				"mfussenegger/nvim-dap",
			},
			{
				"rcarriga/nvim-dap-ui",
				config = function()
					require("dapui").setup()
				end
			},
			{
				"theHamsta/nvim-dap-virtual-text"
			},
			{
				"leoluz/nvim-dap-go"
			},
			{
				"nvim-neotest/nvim-nio"
			},
		},
	},

	-- inlayhints
	{
		"lvimuser/lsp-inlayhints.nvim"
	},

	-- code completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"hrsh7th/cmp-nvim-lsp",
			},
			{
				"L3MON4D3/LuaSnip",
			},
			{
				"saadparwaiz1/cmp_luasnip",
			},
			{
				"rafamadriz/friendly-snippets",
			},
		},
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
	},

	-- File Tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup()
		end
	},

	-- Why? cos im dumb hehe
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {}
	},

	-- Inactive LSP Server kill
	-- {
	-- 	"zeioth/garbage-day.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {}
	-- },

	-- Comment
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons'
	},

	-- Toggleterm
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true
	},

	-- Lualine
	{
		'nvim-lualine/lualine.nvim',
	},

	-- Golang additional extension
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", 'gomod' },
		build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
	},

	-- Autopairs
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},
	{
		'windwp/nvim-ts-autotag',
	},
	-- Null ls
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- null_ls.builtins.formatting.stylua,
					-- null_ls.builtins.diagnostics.eslint,
					-- null_ls.builtins.completion.spell,
				},
			})
		end
	},

	-- Java
	{
		"mfussenegger/nvim-jdtls"
	},

	-- Codeium
	-- {
 --    "Exafunction/codeium.vim",
 --    dependencies = {
 --        "nvim-lua/plenary.nvim",
 --        "hrsh7th/nvim-cmp",
 --    },
	--
	-- },
	-- {
 --    "Exafunction/codeium.nvim",
 --    dependencies = {
 --        "nvim-lua/plenary.nvim",
 --        "hrsh7th/nvim-cmp",
 --    },
 --    config = function()
 --        require("codeium").setup({
 --        })
 --    end
	-- },
}, {})
