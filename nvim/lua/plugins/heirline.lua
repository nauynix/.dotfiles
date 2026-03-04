-- Inside your AstroNvim user configuration (e.g., lua/user/polish.lua)
-- or within the 'heirline' configuration block

local clipboard_component = {
  provider = function()
    local is_ssh = os.getenv("SSH_CLIENT") ~= nil or os.getenv("SSH_TTY") ~= nil
    local is_linux = vim.loop.os_uname().sysname == "Linux"
    
    if is_linux and not is_ssh then
      return " 󰅌 Linux "
    else
      return " 󰆏 Mac "
    end
  end,
  hl = { fg = "orange", bold = true },
  -- Optional: Only show this if you are actually in a buffer
  condition = function() return vim.bo.buftype == "" end,
}

-- To actually inject it into the AstroNvim statusline:
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    -- statusline[3] is usually the 'center/right' section in AstroNvim
    table.insert(opts.statusline, 3, clipboard_component)
    return opts
  end,
}
