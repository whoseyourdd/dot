vim.cmd [[
try
    colorscheme gruvbox
    highlight Normal guibg=none ctermbg=none
    " highlight NvimTreeNormal guibg=none
catch /^Vim\%((\a\+)\)\=E:185/
    colorscheme default
    set background=none
endtry
]]


