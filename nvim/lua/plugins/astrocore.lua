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
        s = { "<Plug>(leap)", desc = "Leap to target" },
        S = { "<Plug>(leap-from-window)", desc = "Leap from window" },
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
