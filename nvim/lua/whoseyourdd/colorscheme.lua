vim.cmd [[
	try
			colorscheme gruvbox
			highlight Normal guibg=none
	catch /^Vim\%((\a\+)\)\=:E185/
			colorscheme habamax
			highlight Normal guibg=none
	endtry
]]

