-- Set <space> as the leader key
-- See `:help mapleader`

vim.g.mapleader = " "

-- [[ Setting options ]] See `:h vim.o`
-- NOTE: You can change these options as you ish!
-- For more options, you can see `:help option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)
-- Print the line number in front of each line
vim.o.number = true

vim.o.guicursor = "n-v-c-i:block"

-- Use relative line numbers, so that it is easier to jump with j, k. This will affect the 'number'
-- option above, see `:h number_relativenumber`
vim.o.relativenumber = true

-- Sync clipboard between OS and Neovim. Schedule the setting after `UiEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		vim.opt.clipboard = "unnamedplus"
	end,
})

-- Set indentation to 4 spaces
vim.opt["shiftwidth"] = 4
vim.opt["tabstop"] = 4

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Highlight the line where the cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Show <tab> and trailing spaces
vim.o.list = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s) See `:help 'confirm'`
vim.o.confirm = true

-- enable signcolumn
vim.opt.signcolumn = "yes"
-- [[ Set up keymaps ]] See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- Autoformat on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
-- Use <Esc> to exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ "t", "i" }, "<A-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set({ "t", "i" }, "<A-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set({ "t", "i" }, "<A-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set({ "t", "i" }, "<A-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set({ "n" }, "<A-h>", "<C-w>h")
vim.keymap.set({ "n" }, "<A-j>", "<C-w>j")
vim.keymap.set({ "n" }, "<A-k>", "<C-w>k")
vim.keymap.set({ "n" }, "<A-l>", "<C-w>l")
vim.keymap.set({ "n" }, "<leader>w", ":w<CR>", { noremap = true })
vim.keymap.set({ "n" }, "<leader>q", ":q<CR>", { noremap = true })
vim.keymap.set({ "n" }, "<leader>oo", ":Oil<CR>", { noremap = true })
vim.keymap.set({ "n" }, "<leader>op", ":TypstPreview<CR>", { noremap = true })

-- [[ Basic Autocommands ]].
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})

-- [[ Create user commands ]]
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command("GitBlameLine", function()
	local line_number = vim.fn.line(".") -- Get the current line number. See `:h line()`
	local filename = vim.api.nvim_buf_get_name(0)
	print(vim.fn.system({ "git", "blame", "-L", line_number .. ",+1", filename }))
end, { desc = "Print the git blame for the current line" })

-- [[ Add optional packages ]]
-- Nvim comes bundled with a set of packages that are not enabled by
-- default. You can enable any of them by using the `:packadd` command.

-- For example, to add the "nohlsearch" package to automatically turn off search highlighting after
-- 'updatetime' and when going to insert mode
vim.cmd("packadd! nohlsearch")

-- Lazy vim
require("config.lazy")

-- Colorscheme
require("2077.init").colorscheme()

-- nvim nvim-treesitter
-- require("lazy").setup({
-- 	{ "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },
-- })

-- Oil vim
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})

-- Enable inline virtual text
vim.diagnostic.enable = true
vim.diagnostic.config({
	virtual_text = true,
})

-- LSP
vim.lsp.config["lua_ls"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
}

vim.lsp.config["ts_ls"] = {
	cmd = { "typescript-language-server" },
	filetypes = { "js", "ts" },
}

vim.lsp.config["clangd"] = {
	cmd = { "clangd" },
	filetypes = { "c", "cpp" },
}

vim.lsp.config["qmlls"] = {
	cmd = { "qmlls" },
	filetypes = { "qml" },
}

vim.lsp.config["tinymist"] = {
	cmd = { "tinymist" },
	filetypes = { "typst" },
	settings = {
		formatterMode = "typstyle",
		exportPdf = "onSave",
	},
}

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("qmlls")
vim.lsp.enable("tinymist")

-- Telescope keymapping
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- split below
vim.opt.splitbelow = true

-- terminal scripts
-- opens terminal below current window in terminal mode
vim.keymap.set("n", "<leader>t", function()
	vim.cmd.new()
	vim.cmd.term()
	vim.cmd.wincmd("j")
	vim.api.nvim_win_set_height(0, 10)
	vim.cmd("startinsert")
end)
