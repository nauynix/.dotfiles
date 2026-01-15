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
        -- Custom launcher for lazygit to remove escape binding
        ["<Leader>gg"] = {
          function()
            local Terminal = require("toggleterm.terminal").Terminal
            local lazygit_term = Terminal:new {
              cmd = "lazygit",
              direction = "float", -- or "vertical", "horizontal"
              -- Define an on_attach function to modify settings after the terminal opens
              on_open = function(term)
                local bufnr = term.bufnr
                -- Instead of 'del', set a buffer-local <esc> binding to do nothing,
                -- allowing the keypress to pass through to the shell (lazygit)
                vim.keymap.set("t", "<esc>", "<Esc>", { buffer = bufnr, silent = true })
              end,
            }
            lazygit_term:toggle()
          end,
          desc = "ToggleTerm lazygit",
        },
        -- Quickfix
        ["<Esc>j"] = { "<cmd>cnext<cr>", desc = "Next quickfix item" },
        ["<Esc>k"] = { "<cmd>cprev<cr>", desc = "Previous quickfix item" },
        ["<Esc>q"] = {
          function()
            local qf_exists = false
            for _, win in pairs(vim.fn.getwininfo()) do
              if win["quickfix"] == 1 then qf_exists = true end
            end
            if qf_exists then
              vim.cmd "cclose"
            else
              -- Only open if there are actually items in the list
              if not vim.tbl_isempty(vim.fn.getqflist()) then
                vim.cmd "copen"
              else
                print "Quickfix list is empty"
              end
            end
          end,
          desc = "Toggle Quickfix Window",
        },
        ["<Leader>fq"] = {
          function() require("snacks.picker").qflist() end,
          desc = "Open Quickfix in Snacks",
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
              title = "Find word",
            }
          end,
          desc = "Find word",
        },
        ["<Leader>fW"] = {
          function()
            require("snacks.picker").grep {
              regex = false,
              title = "Find word in all files",
            }
          end,
          desc = "Find word in all files",
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
              title = "Find word under cursor",
            }
          end,
          desc = "Find word under cursor",
        },
        ["<Leader>fC"] = {
          function()
            require("snacks.picker").grep_word {
              title = "Find word under cursor in all files",
            }
          end,
          desc = "Find word under cursor in all files",
        },
      },
      v = {
        s = { "<Plug>(leap)", desc = "Leap to target (Visual)" },
      },
      o = {
        s = { "<Plug>(leap)", desc = "Leap to target (Operator)" },
      },
      t = {
        -- This maps the Escape key to the sequence that exits the terminal to normal mode
        ["<esc>"] = { "<C-\\><C-n>", desc = "Exit terminal to Normal mode" },
      },
    },
  },
}
