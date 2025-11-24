
vim.opt.termguicolors = true

require("bufferline").setup({
  options = {
    mode = "buffers",       -- или "tabs"
    show_buffer_close_icons = true,
    show_close_icon = false,
    diagnostics = false,
    always_show_bufferline = true,
  },
})

