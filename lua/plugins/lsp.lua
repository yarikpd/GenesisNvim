vim.lsp.config['pyright'] = {
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { '*' },
      },
    },
  },
}

vim.lsp.config['ts_ls'] = {}

vim.lsp.config['rust_analyzer'] = {
  settings = {
    ['rust-analyzer'] = {},
  },
}

vim.lsp.config['ruff'] = {
  init_options = {
    settings = {
      args = {
        '--select=E,F,UP,N,I,ASYNC,S,PTH',
        '--line-length=79',
        '--respect-gitignore',
        '--target-version=py311',
      },
    },
  },
}

-- capabilities для cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- clangd через новый API (без require('lspconfig'))
vim.lsp.config["clangd"] = {
  capabilities = capabilities,
  cmd = { "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--offset-encoding=utf-16"  -- важно для некоторых систем
  },
  init_options = { clangdFileStatus = true },
}

-- Расширения clangd (inlay hints, AST и т.д.)
require("clangd_extensions").setup({
  inlay_hints = { inline = false, only_current_line = false },
})

vim.lsp.enable({ 'pyright', 'ts_ls', 'rust_analyzer', 'ruff', 'clangd' })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', 'lD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'ld', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'lk', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'i', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set({'n','v'}, '<space>r', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

