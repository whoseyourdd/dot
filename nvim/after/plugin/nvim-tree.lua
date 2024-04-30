-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.g.nvim_tree_icons = {
	default = '',
}

require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
		root_folder_modifier = ":t",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "H",
			info = "I",
			warning = "W",
			error = "E",
		},
	},
	filters = {
		dotfiles = false,
	},
})
