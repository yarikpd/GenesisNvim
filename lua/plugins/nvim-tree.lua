require("nvim-tree").setup({
  renderer = {
    highlight_opened_files = "all",
    highlight_git = true,
    root_folder_label = false,
  },
  view = {
    signcolumn = "no",
    cursorline = false,
  },
})

