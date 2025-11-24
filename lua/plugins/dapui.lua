require("dapui").setup()
local dap = require("dap")

-- Для codelldb (ставим через Mason: :MasonInstall codelldb)
-- mason-nvim-dap создаст конфиг; если нужно вручную:
dap.adapters.codelldb = { type = "server", port = "${port}",
  executable = { command = vim.fn.stdpath("data").."/mason/bin/codelldb", args = { "--port", "${port}" } }
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function() return vim.fn.input("Path to exe: ", "./build/", "file") end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
dap.configurations.c = dap.configurations.cpp

