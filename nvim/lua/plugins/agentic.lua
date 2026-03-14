return {
  "carlos-algms/agentic.nvim",

  opts = {
    -- Available by default: "claude-agent-acp" | "gemini-acp" | "codex-acp" | "opencode-acp" | "cursor-acp" | "auggie-acp" | "mistral-vibe-acp"
    provider = "claude-agent-acp", -- setting the name here is all you need to get started
  },

  keys = {
    {
      "<Leader>at",
      function() require("agentic").toggle() end,
      mode = { "n", "v", "i" },
      desc = "Toggle Agentic Chat",
    },
    {
      "<Leader>af",
      function() require("agentic").add_selection_or_file_to_context() end,
      mode = { "n", "v" },
      desc = "Add file or selection to context",
    },
    {
      "<Leader>an",
      function() require("agentic").new_session() end,
      mode = { "n", "v", "i" },
      desc = "New Agentic session",
    },
    {
      "<Leader>ar",
      function() require("agentic").restore_session() end,
      desc = "Restore Agentic session",
      silent = true,
      mode = { "n", "v", "i" },
    },
    {
      "<Leader>ad",
      function() require("agentic").add_current_line_diagnostics() end,
      desc = "Add line diagnostic to Agentic",
      mode = { "n" },
    },
    {
      "<Leader>aD",
      function() require("agentic").add_buffer_diagnostics() end,
      desc = "Add buffer diagnostics to Agentic",
      mode = { "n" },
    },
    {
      "<Leader>as",
      function() require("agentic").switch_provider() end,
      desc = "Switch Agentic provider",
      mode = { "n" },
    },
  },
}
