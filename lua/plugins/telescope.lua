
-- Требует: ripgrep в системе: `rg --version` должен работать
-- Если используешь lazy.nvim, сам плагин и plenary должны быть подключены отдельно.

local ok_telescope, telescope = pcall(require, "telescope")
if ok_telescope then
  telescope.setup({
    defaults = {
      -- Базовая конфигурация для live_grep
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      -- по вкусу:
      -- prompt_prefix = "  ",
      -- selection_caret = "❯ ",
      -- path_display = { "smart" },
    },
    pickers = {
      find_files = {
        hidden = true,       -- чтобы <leader>ff видел скрытые файлы
        no_ignore = false,   -- уважать .gitignore
      },
    },
  })
end

local builtin = require("telescope.builtin")

-- Файлы и буферы
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find File" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Find Buffer" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Find Help" })

-- Текстовый поиск (live_grep) + скрытые файлы, исключаем .git
vim.keymap.set("n", "<leader>ft", function()
  builtin.live_grep({
    additional_args = function()
      return { "--hidden", "--glob", "!.git/*" }
    end,
  })
end, { desc = "Find Text" })

-- Git
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Open Branches" })
vim.keymap.set("n", "<leader>gc", builtin.git_commits,  { desc = "Open Commits" })
vim.keymap.set("n", "<leader>gs", builtin.git_status,   { desc = "Open Status" })

-- Цветовые схемы
vim.keymap.set("n", "<leader>cs", builtin.colorscheme,  { desc = "Open" })

