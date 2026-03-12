return {
  -- Disable indent-blankline
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  -- Disable snacks.nvim indent guides (enabled by default in AstroNvim v5)
  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = false },
    },
  },
  -- C-shaped scope indicator via hlchunk
  {
    "shellRaining/hlchunk.nvim",
    event = "User AstroFile",
    opts = {
      chunk = {
        enable = true,
        style = { { fg = "#6699cc" } },
        duration = 0,
        delay = 0,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = "─",
        },
      },
      indent = { enable = false },
      line_num = { enable = false },
      blank = { enable = false },
    },
  },
}
