local M = {}

local colors = {
	bg = "#111118",
	red = "#ff6058",
	blue = "#5bf6ff",
	yellow = "#ffff4e",
	green = "#1DED83",
	purple = "#9e2bf5",
	white = "#b3aca6",
	grey = "#9b9a95",
}

local D = 9

function M.colorscheme()
	vim.cmd("highlight clear")
	vim.cmd("syntax reset")

	vim.o.background = "dark"
	vim.g.colors_name = "2077"

	local set = vim.api.nvim_set_hl

	set(0, "SpecialKey", { fg = colors.grey })
	set(0, "EndOfBuffer", { fg = colors.grey })
	set(0, "NonText", { fg = colors.grey })
	set(0, "Directory", { fg = colors.blue })
	set(0, "ErrorMsg", { fg = colors.red })
	set(0, "IncSearch", { link = "CurSearch" })
	set(0, "Search", { bg = colors.yellow, fg = colors.bg })
	set(0, "CurSearch", { bg = colors.red, fg = colors.bg })
	set(0, "MoreMsg", { fg = colors.red })
	set(0, "ModeMsg", { fg = colors.yellow })
	set(0, "LineNr", { fg = colors.grey })
	set(0, "LineNrAbove", { link = "LineNr" })
	set(0, "LineNrBelow", { link = "LineNr" })
	set(0, "CursorLineNr", { fg = colors.red })
	set(0, "CursorLineSign", { link = "SignColumn" })
	set(0, "CursorLineFold", { link = "SignColumn" })
	set(0, "Question", { fg = colors.blue })
	set(0, "StatusLine", { bg = colors.red, fg = colors.bg })
	set(0, "StatusLineNC", { link = "StatusLine" })
	set(0, "WinSeparator", { link = "Normal" })
	set(0, "VertSplit", { link = "WinSeparator" })
	set(0, "Title", { bold = true, fg = colors.grey })
	set(0, "Normal", { bg = colors.bg, fg = colors.red })
	set(0, "Visual", { bg = colors.yellow, fg = colors.bg })
	set(0, "VisualNC", { link = "Visual" })
	set(0, "WarningMsg", { fg = colors.yellow })
	set(0, "WildMenu", { link = "PmenuSel" })
	set(0, "Folded", { fg = colors.bg, bg = colors.yellow })
	set(0, "FoldColumn", { link = "SignColumn" })
	set(0, "DiffAdd", { bg = colors.green, fg = colors.bg })
	set(0, "DiffChange", { bg = colors.grey, fg = colors.bg })
	set(0, "DiffDelete", { bg = colors.red, fg = colors.bg })
	set(0, "DiffText", { bg = colors.blue, fg = colors.bg })
	set(0, "SignColumn", { fg = colors.grey })
	set(0, "Conceal", { fg = colors.grey })
	set(0, "SpellBad", { undercurl = true, sp = colors.red })
	set(0, "SpellCap", { undercurl = true, sp = colors.yellow })
	set(0, "SpellRare", { undercurl = true, sp = colors.blue })
	set(0, "SpellLocal", { undercurl = true, sp = colors.green })
	set(0, "Pmenu", { bg = colors.bg, fg = colors.red })
	set(0, "PmenuSel", { bg = colors.red, fg = colors.bg })
	set(0, "PmenuMatch", { link = "Pmenu" })
	set(0, "PmenuMatchSel", { link = "PmenuSel" })
	set(0, "PmenuKind", { link = "Pmenu" })
	set(0, "PmenuKindSel", { link = "PmenuSel" })
	set(0, "PmenuExtra", { link = "Pmenu" })
	set(0, "PmenuExtraSel", { link = "PmenuSel" })
	set(0, "PmenSbar", { bg = colors.bg })
	set(0, "PmenuThumb", { bg = colors.red })
	set(0, "TabLine", { link = "StatusLineNC" })
	set(0, "TabLinSel", { bg = colors.bg, fg = colors.fg })
	set(0, "TabLineFill", { bg = colors.red, fg = colors.bg })
	set(0, "QuickFixLine", { fg = colors.blue })
	set(0, "NormalFloat", { bg = colors.bg })
	set(0, "WinBar", { bg = colors.bg, fg = colors.red })
	set(0, "WinBarNC", { link = "WinBar" })
	set(0, "Comment", { fg = colors.grey })
	set(0, "String", { fg = colors.green })
	set(0, "Constant", { fg = colors.yellow })
	set(0, "Identifier", { fg = colors.red })
	set(0, "Function", { fg = colors.red })
	set(0, "Keyword", { fg = colors.red })
	set(0, "Conditional", { fg = colors.yellow })
	set(0, "Repeat", { fg = colors.yellow })
	set(0, "Operator", { fg = colors.red })
	set(0, "Special", { fg = colors.red })
	set(0, "Character", { fg = colors.purple })
	set(0, "Boolean", { fg = colors.yellow })
	set(0, "@variable", { fg = colors.blue })
	set(0, "Type", { fg = colors.red })
	set(0, "Delimiter", { fg = colors.red })
	set(0, "DiagnosticError", { fg = colors.red })
	set(0, "DiagnosticWarn", { fg = colors.yellow })
	set(0, "DiagnosticInfo", { fg = colors.blue })
	set(0, "DiagnosticHint", { fg = colors.white })
	set(0, "DiagnosticOk", { fg = colors.green })
	set(0, "Statement", { fg = colors.red })
	set(0, "PreProc", { fg = colors.grey })
end

return M
