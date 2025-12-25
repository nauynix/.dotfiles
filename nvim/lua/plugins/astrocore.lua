-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Mappings can be configured through AstroCore as well.
    mappings = {
      n = {
        -- Quickfix
        ["<A-j>"] = { "<cmd>cnext<cr>", desc = "Next quickfix item" },
        ["<A-k>"] = { "<cmd>cprev<cr>", desc = "Previous quickfix item" }
        ["<A-q>"] = {
          function()
            local qf_exists = false
            for _, win in pairs(vim.fn.getwininfo()) do
              if win["quickfix"] == 1 then qf_exists = true end
            end
            if qf_exists then
              vim.cmd("cclose")
            else
              -- Only open if there are actually items in the list
              if not vim.tbl_isempty(vim.fn.getqflist()) then
                vim.cmd("copen")
              else
                print("Quickfix list is empty")
              end
            end
          end,
          desc = "Toggle Quickfix Window",
        },
        -- Leap
        s = { "<Plug>(leap)", desc = "Leap to target" },
        S = { "<Plug>(leap-from-window)", desc = "Leap from window" },
        -- Search
        ["<Leader>fw"] = {
          function()
            local exclusion_globs = {
              -- Exclude files in plz-out/ anywhere in src/
              "!src/**/plz-out/**",
              -- Exclude all files containing "_test."
              "!**/*_test.*",
              -- Exclude specific file extensions/names
              "!**/*.ts",
              "!**/*.tsx",
              "!**/*pb.go",
              "!**/*.js",
              "!**/*_pb2_*.py",
              "!**/*.java",
            }
            require("snacks.picker").grep {
              glob = exclusion_globs,
              regex = false,
              title = "Find words (Non-Regex, Sourcegraph)",
            }
          end,
          desc = "Find words",
        },
        ["<Leader>fc"] = {
          function()
            local exclusion_globs = {
              -- Exclude files in plz-out/ anywhere in src/
              "!src/**/plz-out/**",
              -- Exclude all files containing "_test."
              "!**/*_test.*",
              -- Exclude specific file extensions/names
              "!**/*.ts",
              "!**/*.tsx",
              "!**/*pb.go",
              "!**/*.js",
              "!**/*_pb2_*.py",
              "!**/*.java",
            }
            require("snacks.picker").grep_word {
              glob = exclusion_globs,
              regex = false,
              title = "Find words (Sourcegraph)",
            }
          end,
          desc = "Find word under cursor",
        },
      },
      v = {
        s = { "<Plug>(leap)", desc = "Leap to target (Visual)" },
      },
      o = {
        s = { "<Plug>(leap)", desc = "Leap to target (Operator)" },
      },
    },
  },
}
