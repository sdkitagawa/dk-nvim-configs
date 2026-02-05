return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Cord Setup
{
  "vyfor/cord.nvim",
  lazy = false,
  build = ":Cord update",
  config = function()
    require("cord").setup {
      enabled = true,
      log_level = vim.log.levels.OFF,
      editor = { client = "neovim", tooltip = "Neovim" },
      display = { theme = "default", flavor = "dark", view = "full" },
      timestamp = { enabled = true },
      idle = { enabled = true, timeout = 300000, details = "Idling", tooltip = "💤" },
      text = {
        workspace = function(opts) return "In " .. opts.workspace end,
        viewing   = function(opts) return "Viewing " .. opts.filename end,
        editing   = function(opts) return "Editing " .. opts.filename end,
        dashboard = "Home",
      },
      buttons = nil,
    }
  end,
},

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}

