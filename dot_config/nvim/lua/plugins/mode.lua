return {
  {
    "mvllow/modes.nvim",
    version = "*",
    event = { "CursorMoved", "CursorMovedI" },
    opts = function()
      local palette = require("utils.colors").palette
      return {
        colors = {
          copy = palette.yellow,
          delete = palette.red,
          insert = palette.sky,
          visual = palette.mauve,
        },
        line_opacity = {
          copy = 0.4,
          delete = 0.4,
          insert = 0.4,
          visual = 0.4,
        },
      }
    end,
  },
}
