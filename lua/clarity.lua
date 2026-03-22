local M = {}

local vim = vim
--- Accent colors -- was "base_colors" >> "base_colors"
M.base_colors = {
	red      = "#E85A4F",
	coral    = "#FF6B6B",
	rose     = "#FF758F",
	pink     = "#E57AA4",
	lavender = "#C9A0FF",
	violet   = "#A998F0",
	blue     = "#5B82C7",
	cyan     = "#64B8B4",
	mint     = "#7CE0C2",
	green    = "#5FB36A",
	lime     = "#9ACD5A",
	yellow   = "#F6CE4E",
	peach    = "#FFB07C",
	orange   = "#FF8E29",
}

--- @class color_group
M.color_group = {
    white = '#e4f1e6',
    main = {
        base = "#1c9b86", -- base color (the most dark of the three)
        pale = "#9bf2e4", -- pale color (bit more lighter than base)
        bright = "5cc7b5", -- bright color (the most bright of the three)
    }
}

--- @class Colors
M.colors = {
	main_accent = M.color_group.main.bright,
	white       = M.color_group.white,
	gray        = "#737373",
	light_gray  = "#A6A6A6",
	dark_gray   = "#282828",
	ghost       = "#4D4D4D",
	dark        = "#141414",
    -- git status colors
	diff_add    = "#273C29",
	diff_change = "#4D4322",
	diff_delete = "#492523",
	diff_text   = "#857131",
}

--- Convenience `vim.api.nvim_set_hl()` wrapper
--- @param name string
--- @param highlight vim.api.keyset.highlight
local function hl(name, highlight)
	vim.api.nvim_set_hl(0, name, highlight)
end

function M.colorscheme()
	vim.o.background = "dark"
	vim.g.colors_name = "clarity"
	vim.cmd.highlight("clear")
	if vim.fn.has("syntax_on") then
		vim.cmd.syntax("reset")
	end

    -- Normal color. It will be linked later.
	hl("Normal", { bg = M.colors.dark, fg = M.colors.white })

	hl("@constant.html", { fg = M.colors.light_gray })
	hl("@tag", { fg = M.colors.main_accent })
	hl("@tag.attribute", { link = "Normal" })
	hl("@tag.builtin", { fg = M.colors.main_accent })
	hl("@tag.delimiter", { link = "Normal" })
	hl("@variable", { link = "Normal" })
	hl("Added", { fg = M.base_colors.green })
	hl("Changed", { fg = M.base_colors.yellow })
	hl("ColorColumn", { bg = M.colors.dark_gray })
	hl("Comment", { fg = M.colors.gray })
	hl("Conceal", { fg = M.colors.ghost })
	hl("Constant", { link = "Normal" })
	hl("CursorColumn", { bg = M.colors.dark_gray })
	hl("CursorLine", { bg = M.colors.dark_gray })
	hl("Delimiter", { link = "Normal" })
	hl("DiagnosticError", { fg = M.base_colors.red })
	hl("DiagnosticHint", { fg = M.base_colors.blue })
	hl("DiagnosticInfo", { fg = M.base_colors.cyan })
	hl("DiagnosticOk", { fg = M.base_colors.green })
	hl("DiagnosticUnderlineError", { underline = true, sp = M.base_colors.red })
	hl("DiagnosticUnderlineHint", { underline = true, sp = M.base_colors.blue })
	hl("DiagnosticUnderlineInfo", { underline = true, sp = M.base_colors.cyan })
	hl("DiagnosticUnderlineOk", { underline = true, sp = M.base_colors.green })
	hl("DiagnosticUnderlineWarn", { underline = true, sp = M.base_colors.yellow })
	hl("DiagnosticWarn", { fg = M.base_colors.yellow })
	hl("DiffAdd", { bg = M.colors.diff_add })
	hl("DiffChange", { bg = M.colors.diff_change })
	hl("DiffDelete", { bg = M.colors.diff_delete })
	hl("DiffText", { bg = M.colors.diff_text })
	hl("Directory", { fg = M.color_group.main.bright })
	hl("Error", { bg = M.base_colors.red })
	hl("ErrorMsg", { fg = M.base_colors.red })
	hl("FloatShadow", { bg = M.colors.gray, blend = 80 })
	hl("FloatShadowThrough", { bg = M.colors.gray, blend = 100 })
	hl("Folded", { bg = M.colors.dark_gray, fg = M.colors.gray })
	hl("Function", { fg = M.color_group.main.pale })
	hl("Identifier", { fg = M.color_group.main.base })
	hl("Keyword", { fg = M.color_group.main.base })
	hl("LineNr", { fg = M.colors.light_gray })
	hl("LineNrBelow", { fg = M.colors.light_gray })
	hl("MatchParen", { bg = M.colors.dark_gray })
	hl("ModeMsg", { fg = M.base_colors.yellow })
	hl("MoreMsg", { fg = M.base_colors.blue })
	hl("NonText", { fg = M.colors.ghost })
	hl("NormalFloat", { bg = M.colors.dark_gray, fg = M.colors.white })
	hl("OkMsg", { fg = M.base_colors.green })
	hl("Operator", {fg = M.color_group.white })
	hl("Pmenu", { bg = M.colors.dark_gray })
	hl("PmenuMatch", { fg = M.colors.main_accent })
	hl("PmenuMatchSel", { fg = M.colors.dark })
	hl("PmenuSel", { bg = M.colors.main_accent, fg = M.colors.dark })
	hl("PmenuThumb", { bg = M.colors.gray })
	hl("PreProc", { link = "Normal" })
	hl("Question", { fg = M.colors.main_accent })
	hl("QuickFixLine", { bg = M.colors.dark_gray })
	hl("Removed", { fg = M.base_colors.red })
	hl("SignColumn", { fg = M.colors.light_gray })
	hl("Special", { link = "Normal" })
	hl("SpecialKey", { fg = M.colors.ghost })
	hl("SpellBad", { undercurl = true, sp = M.base_colors.red })
	hl("SpellCap", { undercurl = true, sp = M.base_colors.yellow })
	hl("SpellLocal", { undercurl = true, sp = M.base_colors.green })
	hl("SpellRare", { undercurl = true, sp = M.base_colors.blue })
	hl("Statement", { fg = M.colors.main_accent })
	hl("StatusLine", { bg = M.colors.ghost, fg = M.colors.white })
	hl("StatusLineNC", { bg = M.colors.dark_gray, fg = M.colors.white })
	hl("String", { fg = M.colors.light_gray })
	hl("TabLineSel", { fg = M.colors.white })
	hl("Title", { fg = M.colors.white })
	hl("Todo", { link = "Normal" })
	hl("Type", { fg = M.color_group.main.btight })
	hl("Visual", { bg = M.colors.dark_gray })
	hl("WarningMsg", { fg = M.base_colors.yellow })
	hl("WinBar", { bg = M.colors.main_accent, fg = M.colors.dark })
	hl("WinBarNC", { bg = M.colors.main_accent, fg = M.colors.dark })
	hl("WinSeparator", { fg = M.colors.gray })

	vim.g.terminal_color_0 = M.colors.dark_gray
	vim.g.terminal_color_1 = M.base_colors.red
	vim.g.terminal_color_2 = M.base_colors.green
	vim.g.terminal_color_3 = M.base_colors.yellow
	vim.g.terminal_color_4 = M.base_colors.blue
	vim.g.terminal_color_5 = M.base_colors.pink
	vim.g.terminal_color_6 = M.base_colors.cyan
	vim.g.terminal_color_7 = M.colors.white
	vim.g.terminal_color_8 = M.colors.gray
	vim.g.terminal_color_9 = "#FF6A6A"
	vim.g.terminal_color_10 = "#7AD48A"
	vim.g.terminal_color_11 = "#FFE07A"
	vim.g.terminal_color_12 = "#7FA2E6"
	vim.g.terminal_color_13 = "#F29BC1"
	vim.g.terminal_color_14 = "#7FD9D4"
	vim.g.terminal_color_15 = "#FFFFFF"
end

--- Configure colorscheme
--- @param colors? Colors
function M.setup(colors)
	if colors ~= nil then
		M.colors = vim.tbl_extend("force", M.colors, colors)
	end
end

return M
