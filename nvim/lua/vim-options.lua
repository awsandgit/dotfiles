vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")
vim.api.nvim_set_keymap('n', '<Space>pp', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>pl', '"0p', { noremap = true, silent = true })
vim.g.mapleader= " "
