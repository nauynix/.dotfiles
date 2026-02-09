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
  },
}
