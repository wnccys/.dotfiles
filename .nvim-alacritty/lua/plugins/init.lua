return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "declancm/cinnamon.nvim",
    version = "*", -- Use the latest release
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("cinnamon").setup({
        keymaps = {
          basic = true, -- Enable basic keymaps like <C-u>, <C-d>
          extra = true, -- Enable extra keymaps like zz, zt, zb
        },
        options = {
          mode = "window", -- Animate both cursor and window scrolling
          delay = 3, -- Delay between scroll steps (in ms)
          step_size = {
            vertical = 1, -- Lines moved per step
            horizontal = 2, -- Columns moved per step
          },
          max_delta = {
            line = false, -- No limit on line movements
            column = false, -- No limit on column movements
            time = 30, -- Max duration for a movement (in ms)
          },
        },
      })
      -- Optional: Custom keymaps for centered scrolling
      vim.keymap.set("n", "<C-u>", function() require("cinnamon").scroll("<C-u>zz") end)
      vim.keymap.set("n", "<C-d>", function() require("cinnamon").scroll("<C-d>zz") end)
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },


  {
    "akinsho/toggleterm.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("toggleterm").setup({
        size = 20, -- Height for horizontal, width for vertical
        open_mapping = [[<A-t>]], -- Toggle with Alt+t
        shade_terminals = true,
        direction = "horizontal", -- Options: "float", "horizontal", "vertical"
      })
    end,
  }

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
