return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false, 
        terminal_colors = true, 
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = true },
          variables = { bold = false },
        },
        sidebars = { "qf", "help" },
        lualine_bold = true, 
      })
      vim.cmd.colorscheme("tokyonight") 
    end,
  },
}
