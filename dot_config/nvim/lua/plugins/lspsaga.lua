return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  keys = {
    { "gp", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek Definition" },
    { "gP", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peek Type Definition" },
    { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Documentation" },
    { "gh", "<cmd>Lspsaga finder<cr>", desc = "LSP Finder" },
    { "gr", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
    { "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Previous Diagnostic" },
    { "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" },
    { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code Action", mode = { "n", "v" } },
    { "<leader>o", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
  },
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
        title = true, -- タイトルを常に表示
      },
      lightbulb = {
        enable = false, -- 電球を完全に無効化
        enable_in_insert = false,
        sign = false,
      },
      finder = {
        max_height = 0.8,
        min_width = 50,
        keys = {
          toggle_or_open = "<CR>",
          vsplit = "v",
          split = "s",
          quit = { "q", "<ESC>" },
        },
      },
      definition = {
        width = 0.8,
        height = 0.6,
        show_name = true, -- ファイル名を表示
        keys = {
          edit = "<CR>",
          vsplit = "<C-c>v",
          split = "<C-c>s",
          quit = "q",
        },
      },
      rename = {
        keys = {
          quit = "<ESC>",
        },
      },
      border_style = "single",
      symbol_in_winbar = {
        enable = true,
      },
      code_action_lightbulb = {
        enable = false, -- 電球を無効化
      },
      show_outline = {
        win_width = 50,
        auto_preview = false,
      },
    })
  end,
}
