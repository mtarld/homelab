return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = {
      "lua_ls",
      "phpactor",
      "eslint",
      "ts_ls",
      "html",
      "cssls",
      "yamlls",
      "jsonls",
    },
  },
  config = function ()
    vim.lsp.config('phpactor', {
      init_options = {
        ['language_server_php_cs_fixer.enabled'] = false,
        ['language_server_worse_reflection.inlay_hints.enable'] = true,
        ['language_server_worse_reflection.inlay_hints.params'] = true,
        ['language_server_worse_reflection.inlay_hints.types'] = true,
        ['language_server_completion.trim_leading_dollar'] = true,
      },
    })
  end,
}
