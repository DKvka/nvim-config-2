vim.g.mapleader = ' '

-- Set up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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


-- Load plugins
require("lazy").setup({
    require('plugins.autopairs'),
    require('plugins.surround'),
    require('plugins.hardtime'),
})



-- # No ugly background under text
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


-- General editor settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 15

-- Width column
vim.opt.colorcolumn = '90'

-- Keybindings
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected block down a line' })
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv", { desc = 'Move selected block down a line' })
vim.keymap.set('n', '<leader>e', ':Ex %:p:h<CR>', { desc = 'Open file explorer' })
vim.keymap.set('n', '<leader>h', '^', { desc = 'Move to beginning of line' })
vim.keymap.set('n', '<leader>l', '$', { desc = 'Move to end of line' })
vim.keymap.set('n', '<leader>j', '20j', { desc = 'Scroll down' })
vim.keymap.set('n', '<leader>k', '20k', { desc = 'Scroll up' })
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to system' })

-- Disable horizontal mouse scroll
vim.keymap.set({'n', 'v', 'i'}, '<ScrollWheelLeft>', '<Nop>', { desc = 'Disable horizontal scrolling' })
vim.keymap.set({'n', 'v', 'i'}, '<ScrollWheelRight>', '<Nop>', { desc = 'Disable horizontal scrolling' })


-- Highlight text when yanked
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight text when yanked (copied)',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})


-- Syntax highlighting
--
-- Types:
--  Comment, 
--  Constant, 
--  String, 
--  Number, 
--  Boolean, 
--  Function, 
--  Identifier, 
--  Keyword, 
--  Statement, 
--  Type, 
--  Operator, 
--  Delimiter, 
--  PreProc, 
--  Error, 
--  Todo
vim.api.nvim_set_hl(0, "Comment",   { fg = "#aaaaaa", italic = true })
vim.api.nvim_set_hl(0, "Keyword",   { fg = "#5678dd", bold = true })
vim.api.nvim_set_hl(0, "String",    { fg = "#f2d2a9" })
vim.api.nvim_set_hl(0, "Function",  { fg = "#61bbef" })
vim.api.nvim_set_hl(0, "Identifier",{ fg = "#89d9df" })
vim.api.nvim_set_hl(0, "Operator",  { fg = "#def3f6" })
vim.api.nvim_set_hl(0, "Type",      { fg = "#d9aefb" })


