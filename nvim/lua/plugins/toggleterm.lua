return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    -- 1. Disable persistence so it doesn't remember "small" sizes
    persist_size = false,
    -- 2. Define the base size logic
    size = function(term)
      if term.direction == "vertical" then
        return math.floor(vim.o.columns * (vim.g.vertical_term_ratio or 0.4))
      elseif term.direction == "horizontal" then
        return math.floor(vim.o.lines * 0.3)
      end
      return 20
    end,
    -- 3. Ensure it opens in the right mode
    open_mapping = [[<c-\>]], -- Optional: fallback global toggle
    direction = "vertical",
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Define the toggle logic specifically for your Vertical 40/60
    vim.keymap.set("n", "<Leader>tz", function()
      -- Update the ratio
      if vim.g.vertical_term_ratio == 0.6 then
        vim.g.vertical_term_ratio = 0.4
        print("Vertical Width: 40%")
      else
        vim.g.vertical_term_ratio = 0.6
        print("Vertical Width: 60%")
      end

      -- If a terminal is open, we need to kill it and restart it 
      -- to force the NEW size calculation to trigger.
      vim.cmd("ToggleTerm")
      vim.cmd("ToggleTerm")
    end, { desc = "Toggle Vertical Width" })

    -- FORCED REPLACEMENT for AstroNvim's <Leader>tv
    -- This ensures AstroNvim doesn't use its own small default
    vim.keymap.set("n", "<Leader>tv", function()
      local ratio = vim.g.vertical_term_ratio or 0.4
      local width = math.floor(vim.o.columns * ratio)
      vim.cmd(string.format("ToggleTerm size=%d direction=vertical", width))
    end, { desc = "Toggle Vertical Terminal (Forced)" })
    
    -- FORCED REPLACEMENT for <Leader>th (Horizontal)
    vim.keymap.set("n", "<Leader>th", function()
      local height = math.floor(vim.o.lines * 0.3)
      vim.cmd(string.format("ToggleTerm size=%d direction=horizontal", height))
    end, { desc = "Toggle Horizontal Terminal (Forced)" })
  end,
}
