--[[
  --- CORE NEOVIM CONFIG  ---
  View more information for each option with :help <option-name>
--]]

local global = vim.g
local set = vim.opt

----- GLOBALS -----
global.mapleader = " "

----- GENERAL -----
set.clipboard = "unnamedplus"
set.cmdheight = 1
set.cursorline = true
set.hidden = true
set.fillchars = { eob = " " }
set.mouse = "a"
set.shortmess:append("sI")
set.undofile = true
set.whichwrap:append("<>[]hl")

----- COLORS -----
set.termguicolors = true

----- LAYOUT -----
set.signcolumn = "yes"
set.splitbelow = true
set.splitright = true
set.title = true

----- NUMBERS -----
set.ignorecase = true
set.number = true
set.numberwidth = 2
set.relativenumber = false
set.ruler = false

----- TABS -----
set.expandtab = true
set.shiftwidth = 2
set.softtabstop = 2
set.tabstop = 2

----- TEXT -----
set.ignorecase = true
set.smartcase = true
