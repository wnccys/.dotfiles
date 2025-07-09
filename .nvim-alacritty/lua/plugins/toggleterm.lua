return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup {
      size = 15, -- Adjust size
      open_mapping = [[<A-t>]], -- Change to Ctrl+t
      direction = "horizontal", -- Default to horizontal split
      float_opts = {
        border = "curved", -- Stylish border for floating terminal
      },
    }
  end,
}
