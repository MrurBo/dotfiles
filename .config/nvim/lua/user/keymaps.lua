vim.g.mapleader = "<Space>"
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local opt = vim.opt
opt.wrap = false
opt.number = true
opt.spell = false
opt.signcolumn = "auto"
opt.shiftwidth = 4
opt.tabstop = 4
vim.cmd.colorscheme("catppuccin")
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>n", ":BufferNext<CR>", opts)
keymap("n", "<leader>p", ":BufferPrevious<CR>", opts)
keymap("n", "<leader>c", ":BufferClose<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>t", ":terminal<CR>", opts)
keymap("t", "<Esc><Esc>", [[<C-\><C-n>]], opts)
