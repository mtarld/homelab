return {
  "mtarld/tempo.nvim",
  opts = {},
  cmd = { "TempoStart", "TempoPause", "TempoToggle", "TempoStop", "TempoShow", "TempoOpen" },
  keys = {
    { "<leader>tt", ":TempoToggle<CR>" },
    { "<leader>tx", ":TempoStop<CR>" },
    { "<leader>ts", ":TempoShow<CR>" },
    { "<leader>to", ":TempoOpen<CR>" },
  },
}
