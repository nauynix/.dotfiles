-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_cursor_trail_size = 0.4
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_particle_density = 5.0
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_scroll_animation_length = 0.15
  vim.g.neovide_scroll_animation_far_lines = 0
  vim.g.neovide_hide_mouse_when_typing = true
end
require("smart-paste").setup()

-- Make p/P paste from yank register ("0) by default,
-- but allow explicit register pastes ("ap, "bp, etc.) to work normally
vim.keymap.set("n", "p", '"0p', { noremap = true })
vim.keymap.set("n", "P", '"0P', { noremap = true })
for _, reg in ipairs({
  '"', '*', '+', '-', '.', ':', '%', '/', '=',
  '1', '2', '3', '4', '5', '6', '7', '8', '9',
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
  'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
  's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
}) do
  vim.keymap.set("n", '"' .. reg .. "p", '"' .. reg .. "p", { noremap = true })
  vim.keymap.set("n", '"' .. reg .. "P", '"' .. reg .. "P", { noremap = true })
end

-- Detect the environment
local is_ssh = os.getenv("SSH_CLIENT") ~= nil or os.getenv("SSH_TTY") ~= nil
local is_linux = vim.loop.os_uname().sysname == "Linux"

if is_linux and not is_ssh then
    -- LOCAL LINUX: Use the standard system clipboard
    -- This uses xclip or xsel, which handles the "replace" logic correctly.
    vim.opt.clipboard = "unnamedplus"
else
    -- MAC / SSH / TMUX: Use the OSC 52 Provider
    -- This "tunnels" the copy back to your Mac's iTerm2.
    vim.g.clipboard = {
        name = 'OSC 52',
        copy = {
            ['+'] = require('vim.ui.clipboard.osc52').copy '+',
            ['*'] = require('vim.ui.clipboard.osc52').copy '*',
        },
        paste = {
            ['+'] = require('vim.ui.clipboard.osc52').paste '+',
            ['*'] = require('vim.ui.clipboard.osc52').paste '*',
        },
    }
end
