return {
  "marcuscaisey/please.nvim",
  cmd = { "Please" },
  keys = {
    -- 1. Build & Run
    {
      "<leader>pb",
      function() require("please").build() end,
      desc = "Please Build",
    },
    {
      "<leader>pr",
      function() require("please").run() end,
      desc = "Please Run",
    },
    {
      "<leader>pt",
      function() require("please").test() end,
      desc = "Please Test",
    },
    {
      "<leader>pd",
      function() require("please").debug() end,
      desc = "Please Debug",
    },

    -- 2. Navigation
    {
      "<leader>pj",
      function() require("please").jump_to_target() end,
      desc = "Jump to Target",
    },
    {
      "<leader>pl",
      function() require("please").look_up_target() end,
      desc = "Inspect Target",
    },

    -- 3. Utility
    {
      "<leader>py",
      function() require("please").yank() end,
      desc = "Yank Label",
    },
    {
      "<leader>ph",
      function() require("please").history() end,
      desc = "Build History",
    },
    {
      "<leader>m",
      function() require("please").maximise_popup() end,
      desc = "Maximise popup",
    },

    -- 4. Send to toggleterm
    {
      "<leader>pv",
      function()
        local history_path = vim.fs.joinpath(vim.fn.stdpath("data"), "please-command-history.json")
        local f = io.open(history_path)
        if not f then
          vim.notify("No please command history found", vim.log.levels.WARN)
          return
        end
        local text = f:read("*a")
        f:close()
        local history = vim.json.decode(text) or {}

        -- Find the repo root for the current file
        local path = vim.api.nvim_buf_get_name(0)
        if path == "" then path = vim.uv.cwd() end
        local root = vim.fs.root(path, ".plzconfig")
        if not root or not history[root] or #history[root] == 0 then
          vim.notify("No please command history for this repo", vim.log.levels.WARN)
          return
        end

        local cmd = history[root][1].description -- e.g. "plz test //foo:bar"
        local ratio = vim.g.vertical_term_ratio or 0.4
        local width = math.floor(vim.o.columns * ratio)
        local Terminal = require("toggleterm.terminal").Terminal
        local term = Terminal:new({
          cmd = cmd,
          dir = root,
          direction = "vertical",
          close_on_exit = false,
        })
        term:toggle(width)
      end,
      desc = "Please cmd in vertical term",
    },
    {
      "<leader>pc",
      function()
        local history_path = vim.fs.joinpath(vim.fn.stdpath("data"), "please-command-history.json")
        local f = io.open(history_path)
        if not f then
          vim.notify("No please command history found", vim.log.levels.WARN)
          return
        end
        local text = f:read("*a")
        f:close()
        local history = vim.json.decode(text) or {}

        local path = vim.api.nvim_buf_get_name(0)
        if path == "" then path = vim.uv.cwd() end
        local root = vim.fs.root(path, ".plzconfig")
        if not root or not history[root] or #history[root] == 0 then
          vim.notify("No please command history for this repo", vim.log.levels.WARN)
          return
        end

        local cmd = history[root][1].description
        vim.fn.setreg('"', cmd)
        vim.fn.setreg('*', cmd)
        vim.notify("Copied: " .. cmd)
      end,
      desc = "Copy last please cmd",
    },
  },
}
