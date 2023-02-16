local map = require("braint.remap")

vim.g.mapleader = " "

local nnoremap = map.nnoremap
local inoremap = map.inoremap
local vnoremap = map.vnoremap
local xnoremap = map.xnoremap
local nmap = map.nmap
local f = require("braint.functions")

nnoremap("<Space>", "<Nop>")

-- nnoremap("<leader>e", "<cmd>NvimTreeFocus<CR>")
nnoremap("<leader>e", "<cmd>NvimTreeToggle<CR>")

nnoremap("<leader>F", "<cmd>Telescope live_grep<CR>")
nnoremap("<leader>f", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>")

nnoremap("<leader>t", "<cmd>ToggleTerm direction=float<CR>")

nnoremap("<leader><Left>", "<cmd>bp<CR>")
nnoremap("<leader><Right>", "<cmd>bn<CR>")
nnoremap("<leader>q", "<cmd>q!<CR>")
nnoremap("<leader>w", "<cmd>w<CR>")

-- l for lsp
nnoremap("<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>")
nnoremap("<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>")

nnoremap("<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>")
nnoremap("<leader>xw", "<cmd>TroubleToggle document_diagnostics<CR>")
nnoremap("<leader>xq", "<cmd>TroubleToggle quickfix<CR>")
nnoremap("<leader>xl", "<cmd>TroubleToggle loclist<CR>")
nnoremap("<leader>aa", "GVgg")

xnoremap("<leader>p", [["_dP]])
nnoremap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
nnoremap("<leader>y", [["+y]])
vnoremap("<leader>y", [["+y]])
nnoremap("<leader>Y", [["+Y]])


vnoremap("<leader>j", ":m '>+1<CR>gv=gv")
vnoremap("<leader>k", ":m '<-2<CR>gv=gv")

--Presentation.vim
nnoremap("<F5>", "<cmd>:set relativenumber! number! noshowcmd hidden!<CR>")
