local remap = function(mode, keys, func, desc)
	if desc then
		desc = "" .. desc
	end
	vim.keymap.set(mode, keys, func, { desc = desc, silent = true })
end

local nsremap = function(mode, keys, func, desc)
	if desc then
		desc = "" .. desc
	end
	vim.keymap.set(mode, keys, func, { desc = desc, silent = false })
end

remap('n', '<C-s>', ':w<CR>', 'Map Netrw')
remap('i', '<C-s>', '<Esc>:w<CR>', 'Map Netrw')
remap('n', '<leader>e', ':NvimTreeToggle<CR>', 'Map Netrw')

remap('n', '<C-l>', '<Nop>', '')
remap('n', '<C-Left>', ':bp<CR>', 'Prev Tab')
remap('n', '<C-Right>', ':bn<CR>', 'Next Tab')
remap('n', '<leader>qw', ':bd<CR>', 'Close Tab')
remap('n', '<leader>qq', ':q<CR>', 'Exit')

-- Telescope builtin
remap('n', '<leader>ff', require('telescope.builtin').find_files, '[F]ind [F]iles')
remap('n', '<leader>fg', require('telescope.builtin').live_grep, '[F]ind [G]rep')
remap('n', '<leader>fw', require('telescope.builtin').grep_string, '[F]ind [W]ord')

-- Debugger
remap('n', '<leader>dt', ':lua require("dapui").toggle()<CR>', '[D]ebugger [T]oggle')
remap('n', '<leader>db', ':DapToggleBreakpoint<CR>', '[D]ebugger [B]reakpoint')
remap('n', '<leader>dc', ':DapContinue<CR>', '[D]ebugger [C]ontinue')
remap('n', '<leader>dr', ':lua require("dapui").open({reset=true})<CR>', '[D]ebugger [R]eset')

remap('n', '<C-a>', 'GVgg', 'Select All')
nsremap('n', '<C-f>', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 'Replace all word')

-- Move block lines
remap('v', 'J', ":m '>+1<CR>gv=gv", 'Move block up')
remap('v', 'K', ":m '<-2<CR>gv=gv", 'Move block down')
remap("v", "<", "<gv")
remap("v", ">", ">gv")

remap('n', '<C-t>', [[<Cmd>exe v:count1 . "ToggleTerm"<CR>]], 'ToggleTerm')
remap('i', '<C-t>', [[<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]], 'ToggleTerm')
