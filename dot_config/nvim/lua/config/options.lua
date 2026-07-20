local g = vim.g
local opt = vim.opt


-- globals
g.mapleader = " "
g.maplocalleader = "\\"

--ui
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "screenline"
opt.showmode = true
opt.signcolumn = "auto"
opt.winborder = "rounded"
opt.laststatus = 3
opt.list = true
opt.listchars = {
    tab = '--',
    trail = '·',
    extends = '→',
    precedes = '←',
    nbsp = '␣',
}


--tabs 
local tab_size = 4
opt.tabstop = tab_size
opt.softtabstop= tab_size
opt.shiftwidth = tab_size
opt.expandtab = true
opt.shiftround = true
--wraps 
opt.linebreak = true
opt.breakindent = true
opt.smoothscroll = true

--search
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true

--splits
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = 'screen'


--other
local scroll_off = 4
opt.undofile = true
opt.swapfile = false
opt.scrolloff = scroll_off
opt.sidescrolloff = scroll_off
opt.clipboard = "unnamedplus"
opt.diffopt:append('algorithm:histogram')

