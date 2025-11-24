-- базовое применение темы на старте
require("scripts.theme_switcher").apply()

-- NvimTree: когда окно открыто — докрашиваем его
vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function() require("scripts.theme_switcher").apply_nvimtree() end,
})

-- dashboard-nvim / alpha-nvim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dashboard", "alpha" },
  callback = function() require("scripts.theme_switcher").apply_dashboard() end,
})

-- which-key: событие открытия/закрытия всплывающего окна
vim.api.nvim_create_autocmd("User", {
  pattern = { "WhichKey", "WhichKeyFloat", "WhichKeyTrigger" },
  callback = function() require("scripts.theme_switcher").apply_whichkey() end,
})

-- при смене любой colorscheme (если плагин её меняет) — вернуть наши оттенки
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function() require("scripts.theme_switcher").apply() end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function() require("mytheme.load").apply_bufferline() end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "BufferLineTruncMarkerUpdate", -- на всякий случай
  callback = function() require("mytheme.load").apply_bufferline() end,
})

