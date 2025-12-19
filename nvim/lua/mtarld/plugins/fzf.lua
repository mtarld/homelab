return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    { "junegunn/fzf", build = "./install --bin" },
  },
  config = function ()
    require("fzf-lua").setup({
      fzf_colors = {
        ["fg"] = { "fg", "CursorLine" },
        ["bg"] = { "bg", "Normal" },
        ["hl"] = { "fg", "CursorLine" },
        ["fg+"] = { "fg", "Normal" },
        ["bg+"] = { "bg", "CursorLine" },
        ["hl+"] = { "fg", "Normal" },
        ["info"] = { "fg", "Comment" },
        ["prompt"] = { "fg", "Normal" },
        ["pointer"] = { "fg", "Exception" },
        ["marker"] = { "fg", "Keyword" },
        ["spinner"] = { "fg", "Comment" },
        ["header"] = { "fg", "Comment" },
        ["gutter"] = { "bg", "CursorLine" },
      },
      grep = {
        -- override color=always
        rg_opts = " --sort=path --column --line-number --no-heading --color=never --smart-case --max-columns=4096 -e",
      },
      keymap = {
        fzf = {
          ["ctrl-u"] = "half-page-up",
          ["ctrl-d"] = "half-page-down",
          ["alt-a"] = "toggle-all",
          ["alt-p"] = "toggle-preview",
        },
      },
      winopts = {
        split = "botright new",
        preview = {
          default = "bat",
          hidden = "hidden",
        },
      },
    })
    require("fzf-lua").register_ui_select()
  end,
  cmd = "FzfLua",
  keys = {
    { "<leader>.", "<CMD>FzfLua live_grep<CR>" },
    { "<leader><CR>", "<CMD>FzfLua resume<CR>" },
    { "<leader> ", "<CMD>FzfLua files<CR>" },
    { "<leader>lb", "<CMD>FzfLua buffers<CR>" },
    { "<leader>ld", "<CMD>FzfLua lsp_document_diagnostics<CR>" },
    { "<leader>ll", "<CMD>FzfLua lsp_finder<CR>" },
    { "<leader>lf", "<CMD>FzfLua lsp_live_workspace_symbols<CR>" },
    { "<leader>ca", "<CMD>FzfLua lsp_code_actions<CR>" },
    { "gd", "<CMD>FzfLua lsp_definitions<CR>" },
    { "gi", "<CMD>FzfLua lsp_implementations<CR>" },
    { "<leader>lr", "<CMD>FzfLua registers<CR>" },
  },
}
