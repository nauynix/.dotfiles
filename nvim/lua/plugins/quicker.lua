return {
  {
    "stevearc/quicker.nvim",
    ft = "qf", -- Optional: load only when the quickfix list is opened
    opts = {}, -- Empty opts table for default configuration
    config = function() require("quicker").setup() end,
  },
}
