return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window = opts.window or {}
    opts.window.mappings = opts.window.mappings or {}
    -- Disable all default Neo-tree mappings starting with 'z'
    opts.window.mappings["z"] = "noop"
  end,
}
