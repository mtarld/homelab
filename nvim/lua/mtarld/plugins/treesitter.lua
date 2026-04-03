return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects" },
  },
  event = "BufRead",
  config = function()
    require("nvim-treesitter").install({
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
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        if vim.treesitter.get_parser(vim.api.nvim_get_current_buf()) then
          vim.treesitter.start()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
