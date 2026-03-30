return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects" },
  },
  event = "BufRead",
  config = function()
    -- Workaround for Neovim 0.12 race condition where parse() yields nil
    -- nodes causing 'range' nil errors (neovim/neovim#38461)
    local lt = require("vim.treesitter.languagetree")
    local original_parse = lt.parse
    lt.parse = function(self, ...)
      local ok, result = pcall(original_parse, self, ...)
      if ok then
        return result
      end
      return {}
    end

    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "c",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "php",
        "phpdoc",
        "query",
        "twig",
        "vim",
        "vimdoc",
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
