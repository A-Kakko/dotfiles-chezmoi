local M = {}

-- Get Catppuccin color palette
-- Returns the mocha flavor palette by default
function M.get_palette()
  local ok, catppuccin = pcall(require, "catppuccin.palettes")
  if not ok then
    -- Fallback colors if catppuccin is not available
    return {
      text = "#cdd6f4",
      overlay0 = "#6c7086",
      mauve = "#cba6f7",
      red = "#f38ba8",
      peach = "#fab387",
      yellow = "#f9e2af",
      sky = "#89dceb",
      mantle = "#181825",
    }
  end
  return catppuccin.get_palette("mocha")
end

-- Export palette for convenient access
M.palette = M.get_palette()

return M
