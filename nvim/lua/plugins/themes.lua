return {
  {
    "Mofiqul/dracula.nvim",
    name = "dracula",
    priority = 1000 ,
    config = function()
      vim.cmd.colorscheme "dracula"
    end
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme "catppuccin-mocha"
    -- end
  },
    {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    -- config = function()
    --   vim.cmd.colorscheme "tokyonight"
    -- end,
  }
}
