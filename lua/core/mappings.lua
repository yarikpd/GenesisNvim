vim.g.mapleader = " "

-- Quit
vim.keymap.set('n', '<C-q>', '<cmd>:q<CR>')

-- Copy all text
vim.keymap.set('n', '<C-a>', '<cmd>%y+<CR>')

-- Saving a file via Ctrl+S
vim.keymap.set('i', '<C-s>', '<cmd>:w<CR>')
vim.keymap.set('n', '<C-s>', '<cmd>:w<CR>')

-- NvimTree
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>tf', ':NvimTreeFocus<CR>')

-- BufferLine
vim.keymap.set('n','<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n','<S-Tab>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<C-l>', ':BufferLineCloseOthers<CR>')

-- TodoList
vim.keymap.set('n', '<leader>nl', ':TodoTelescope<CR>')

-- ToggleTerm
vim.keymap.set('n', '<leader>s', ':ToggleTerm direction=float<CR>')

-- Ctrl+Z = отмена
vim.keymap.set("n", "<C-z>", "u", { noremap = true, silent = true })
vim.keymap.set("i", "<C-z>", "<C-o>u", { noremap = true, silent = true })

-- Ctrl+Shift+Z = повтор (redo)
vim.keymap.set("n", "<C-S-z>", "<C-r>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-S-z>", "<C-o><C-r>", { noremap = true, silent = true })

-- Cmake
vim.keymap.set("n", "<leader>cg", "<cmd>CMakeGenerate<CR>")
vim.keymap.set("n", "<leader>cb", "<cmd>CMakeBuild<CR>")
vim.keymap.set("n", "<leader>cr", "<cmd>CMakeRun<CR>")
vim.keymap.set("n", "<leader>ct", "<cmd>CMakeRunTest<CR>")
