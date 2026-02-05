-- nvim/lua/plugins/catppuccin.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      -- ensure true color
      vim.opt.termguicolors = true
      -- catppuccin setup
      require("catppuccin").setup({
        flavour = "mocha", -- change to latte/frappe/macchiato if you prefer
        transparent_background = true,
        term_colors = true,
        integrations = {
          lualine = true,
          telescope = true,
          treesitter = true,
        },
      })
      -- apply colorscheme
      vim.cmd("colorscheme catppuccin")
    end,
  },
}
