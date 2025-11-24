-- Форматирование по сохранению через clang-format
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
  callback = function() vim.lsp.buf.format({ async = false }) end,
})
