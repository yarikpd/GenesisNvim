local M = {}

local function set(hg, spec) vim.api.nvim_set_hl(0, hg, spec) end

-- === базовое применение ===
function M.apply()
  local ok, theme = pcall(require, "mytheme.colors.mytheme")
  if not ok then return end
  local c = theme.colors

  vim.o.termguicolors = true
  -- если хотите — вычисляйте светлую/тёмную динамически; пока оставим:
  vim.o.background = "dark"

  -- базовые группы редактора
  set("Normal",   { fg = c.foreground, bg = c.background })
  set("Comment",  { fg = c.comment, italic = true })
  set("Keyword",  { fg = c.keyword, bold = true })
  set("String",   { fg = c.string })
  set("Number",   { fg = c.number })
  set("Visual",   { bg = c.selection })

  -- плавающие окна и рамки
  set("NormalFloat",     { fg = c.foreground, bg = c.background })
  set("FloatBorder",     { fg = c.comment,    bg = c.background })
  set("WinSeparator",    { fg = c.background, bg = c.background })

  -- применяем «подтемы»
  M.apply_nvimtree()
  M.apply_dashboard()
  M.apply_whichkey()
  M.apply_bufferline()
end

-- === NvimTree ===
function M.apply_nvimtree()
  local ok, theme = pcall(require, "mytheme.colors.mytheme")
  if not ok then return end
  local c = theme.colors

  local set = vim.api.nvim_set_hl

  -- фон и текст
  set(0, "NvimTreeNormal",      { fg = c.foreground, bg = c.background })
  set(0, "NvimTreeNormalNC",    { fg = c.foreground, bg = c.background })
  set(0, "NvimTreeEndOfBuffer", { fg = c.background, bg = c.background })

  -- папки и структура
  set(0, "NvimTreeRootFolder",        { fg = c.keyword, bold = true })
  set(0, "NvimTreeFolderName",        { fg = c.foreground })
  set(0, "NvimTreeOpenedFolderName",  { fg = c.keyword, bold = true })
  set(0, "NvimTreeFolderIcon",        { fg = c.keyword })
  set(0, "NvimTreeIndentMarker",      { fg = c.comment })

  -- выделения
  set(0, "NvimTreeCursorLine",        { bg = "NONE" })
  set(0, "NvimTreeCursorColumn",      { bg = "NONE" })
  set(0, "NvimTreeSelection",         { bg = c.selection, fg = c.foreground })
  set(0, "NvimTreeWinSeparator",      { fg = c.background, bg = c.background })

  -- файлы
  set(0, "NvimTreeExecFile",    { fg = c.string,  bold = true })
  set(0, "NvimTreeSpecialFile", { fg = c.keyword, underline = true })
  set(0, "NvimTreeSymlink",     { fg = c.number,  italic = true })

  -- Git
  set(0, "NvimTreeGitDirty",    { fg = c.number })
  set(0, "NvimTreeGitStaged",   { fg = c.string })
  set(0, "NvimTreeGitNew",      { fg = c.string })
  set(0, "NvimTreeGitDeleted",  { fg = c.comment })
  set(0, "NvimTreeGitIgnored",  { fg = c.comment, italic = true })

  -- 🔥 открытые файлы
  set(0, "NvimTreeOpenedFile", { fg = c.keyword, bold = true, italic = true })
  set(0, "NvimTreeOpenedHL",   { fg = c.keyword, bg = "NONE", bold = true })

  -- при желании: выделение символа-разделителя (│)
  set(0, "NvimTreeVertSplit", { fg = c.background, bg = c.background })
end


-- === Dashboard ===
-- Поддержим оба популярных плагина: nvimdev/dashboard-nvim и alpha-nvim
function M.apply_dashboard()
  local ok, theme = pcall(require, "mytheme.colors.mytheme")
  if not ok then return end
  local c = theme.colors

  -- dashboard-nvim (nvimdev)
  set("DashboardHeader", { fg = c.keyword,    bg = c.background, bold = true })
  set("DashboardFooter", { fg = c.comment,    bg = c.background, italic = true })
  set("DashboardDesc",   { fg = c.foreground, bg = c.background })
  set("DashboardKey",    { fg = c.string,     bg = c.background, bold = true })
  set("DashboardIcon",   { fg = c.number,     bg = c.background })
  set("DashboardShortCut",{ fg = c.string,    bg = c.background })
  set("DashboardCenter", { fg = c.foreground, bg = c.background })
  set("DashboardBorder", { fg = c.comment,    bg = c.background })

  -- alpha-nvim (на всякий случай)
  set("AlphaHeader",   { fg = c.keyword, bg = c.background, bold = true })
  set("AlphaFooter",   { fg = c.comment, bg = c.background, italic = true })
  set("AlphaButtons",  { fg = c.foreground, bg = c.background })
  set("AlphaShortcut", { fg = c.string, bg = c.background, bold = true })
end

-- === which-key ===
function M.apply_whichkey()
  local ok, theme = pcall(require, "mytheme.colors.mytheme")
  if not ok then return end
  local c = theme.colors

  set("WhichKey",         { fg = c.keyword,    bg = c.background, bold = true })
  set("WhichKeyGroup",    { fg = c.string,     bg = c.background })
  set("WhichKeyDesc",     { fg = c.foreground, bg = c.background })
  set("WhichKeySeparator",{ fg = c.comment,    bg = c.background })
  set("WhichKeyFloat",    { fg = c.foreground, bg = c.background })
  set("WhichKeyBorder",   { fg = c.comment,    bg = c.background })
  set("WhichKeyValue",    { fg = c.number,     bg = c.background })
end

function M.apply_bufferline()
  local ok, theme = pcall(require, "mytheme.colors.mytheme")
  if not ok then return end
  local c = theme.colors

  -- фон полосы и «пустых» мест
  set("BufferLineFill",            { bg = c.background })
  set("BufferLineBackground",      { fg = c.comment,    bg = c.background })

  -- обычные буферы (видимые, но не активные)
  set("BufferLineBufferVisible",   { fg = c.foreground, bg = c.background })
  set("BufferLineSeparator",       { fg = c.background, bg = c.background })
  set("BufferLineSeparatorVisible",{ fg = c.background, bg = c.background })

  -- выбранный буфер (активная вкладка — как на скрине)
  set("BufferLineBufferSelected",  { fg = c.foreground, bg = c.background, bold = true })
  set("BufferLineSeparatorSelected",{ fg = c.background, bg = c.background })
  set("BufferLineIndicatorSelected",{ fg = c.keyword,   bg = c.background }) -- цвет индикатора под активной вкладкой

  -- значки/крестики (опционально)
  set("BufferLineCloseButton",           { fg = c.comment,    bg = c.background })
  set("BufferLineCloseButtonVisible",    { fg = c.comment,    bg = c.background })
  set("BufferLineCloseButtonSelected",   { fg = c.keyword,    bg = c.background })
  set("BufferLineModified",              { fg = c.keyword,    bg = c.background })
  set("BufferLineModifiedVisible",       { fg = c.keyword,    bg = c.background })
  set("BufferLineModifiedSelected",      { fg = c.keyword,    bg = c.background, bold = true })

  -- если используете режим Tabs
  set("BufferLineTab",            { fg = c.comment,    bg = c.background })
  set("BufferLineTabSelected",    { fg = c.foreground, bg = c.background, bold = true })
  set("BufferLineTabSeparator",   { fg = c.background, bg = c.background })
  set("BufferLineTabSeparatorSelected", { fg = c.background, bg = c.background })
end

return M

