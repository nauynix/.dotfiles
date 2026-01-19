return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    -- Dynamically set the size based on direction
    size = function(term)
      if term.direction == "horizontal" then
        return 30 -- Default height for horizontal
      elseif term.direction == "vertical" then
        -- Calculate 40% of the current total columns (width)
        return math.floor(vim.o.columns * 0.4)
      else
        -- Default size for floating terminal
        return 20
      end
    end,
  },
}
