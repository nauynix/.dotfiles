return {
  "ggandor/leap.nvim",
  dependencies = {
    "tpope/vim-repeat",
    {},
  },
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { leap = true } },
    },
  },
  opts = {},
}
