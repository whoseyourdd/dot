local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local lsp = {
	function()
		local msg = 'No Active Lsp'
		local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = "lsp:",
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return "[" .. str .. "]"
	end,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 1,
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end


require("lualine").setup {
	options = {
		theme = 'auto', -- lualine theme
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		icons_enabled = true,
		disabled_filetypes = { "NvimTree" }
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { diagnostics },
		lualine_c = { "filename" },
		lualine_x = { branch, diff },
		lualine_y = { spaces, location },
		lualine_z = { lsp },
	},
}
