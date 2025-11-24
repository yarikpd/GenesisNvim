
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	
	{ 'neovim/nvim-lspconfig' },

	-- Autocomplete support
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'williamboman/mason.nvim' },

    {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
	  'nvimdev/dashboard-nvim',
	  event = 'VimEnter',
	  config = function()
	    require('dashboard').setup {
	      -- config
	    }
	  end,
	  dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},

	{ 'Eandrju/cellular-automaton.nvim' },
	{ 'norcalli/nvim-colorizer.lua' },

	{
	    'nvim-lualine/lualine.nvim',
	    dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	{
	  "folke/todo-comments.nvim",
	  dependencies = { "nvim-lua/plenary.nvim" },
	  opts = {
	    -- your configuration comes here
	    -- or leave it empty to use the default settings
	    -- refer to the configuration section below
	  }
	},

	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		opts = {
			default_mappings = true,           -- последовательность для выхода из Insert режима
			timeout = vim.o.timeoutlen or 300, -- время на нажатие
			clear_line = false,            -- заменяет старое clear_empty_lines
		}
	},

	{
	    'numToStr/Comment.nvim',
	    opts = {
	        -- add any options here
	    },
	    lazy = false,
	},

	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

	{
	  "nvim-tree/nvim-tree.lua",
	  version = "*",
	  lazy = false,
	  dependencies = {
	    "nvim-tree/nvim-web-devicons",
	  },
	  config = function()
	    require("nvim-tree").setup {}
	  end,
	},

	{
	    'dense-analysis/ale',
	    config = function()
	        -- Configuration goes here.
	        local g = vim.g
	
	        g.ale_linters = {
	        	python = {'mypy'},
	            lua = {'lua_language_server'}
	        }
	    end
	},

	{ 'RRethy/vim-illuminate' },

	{
	    "vhyrro/luarocks.nvim",
	    priority = 1001, -- this plugin needs to run before anything else
	    opts = {
	        rocks = { "magick" },
	    },
	},

	{
	 "folke/trouble.nvim",
	 dependencies = { "nvim-tree/nvim-web-devicons" },
	 opts = {
	  -- your configuration comes here
	  -- or leave it empty to use the default settings
	  -- refer to the configuration section below
	 },
	},

	{'akinsho/toggleterm.nvim', version = "*", config = true},

	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  init = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	  end,
	  opts = {
	    -- your configuration comes here
	    -- or leave it empty to use the default settings
	    -- refer to the configuration section below
	  }
	},

	-- Выравнивание и перемещение текста
	-- Автоматическое открытие фигурных скобок, кавычек и т.д
	{ 'echasnovski/mini.nvim', version = false },
	{ 'echasnovski/mini.move', version = false },
	{ 'echasnovski/mini.pairs', version = false },
    
    -- мои плагины
    { "wakatime/vim-wakatime", lazy = false },

    -- ######################################
    --                  C++
    -- ######################################

    -- Core
    { "williamboman/mason.nvim", build = ":MasonUpdate", config = true },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "p00f/clangd_extensions.nvim" },

    -- Completion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "L3MON4D3/LuaSnip" },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = { ensure_installed = { "c", "cpp", "cmake", "make", "bash", "json", "lua", "python" } }
    },

    -- CMake + tasks
    { "Civitasv/cmake-tools.nvim" },
    { "stevearc/overseer.nvim", config = true },
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    -- DAP
    { "mfussenegger/nvim-dap" },
    { "nvim-neotest/nvim-nio" },
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    { "jay-babu/mason-nvim-dap.nvim", opts = { ensure_installed = { "codelldb" } } },

    -- UX
    { "folke/trouble.nvim", opts = {} },
    { "folke/which-key.nvim", opts = {} },
    { "windwp/nvim-autopairs", opts = {} },
    { "numToStr/Comment.nvim", opts = {} },
    { "lewis6991/gitsigns.nvim", opts = {} },

})
