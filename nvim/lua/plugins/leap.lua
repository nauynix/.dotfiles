return {
  url = "https://codeberg.org/andyg/leap.nvim",
  dependencies = {
    "tpope/vim-repeat",
    {},
  },
  specs = {
    {
      "catppuccin",
      optional = true,
      opts = { integrations = { leap = true } },
    },
  },
  opts = {},
}
