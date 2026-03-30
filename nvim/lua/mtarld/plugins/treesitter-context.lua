return {
  "nvim-treesitter/nvim-treesitter-context",
  opts = {
    max_lines = 1,
  },
  event = "BufRead",
  config = function(_, opts)
    local context = require("treesitter-context")
    context.setup(opts)

    -- Workaround for Neovim 0.12 race condition where treesitter parse()
    -- can produce nil nodes, causing range/assertion errors (neovim/neovim#38461)
    local ctx = require("treesitter-context.context")
    local original_get = ctx.get
    ctx.get = function(...)
      local ok, ranges, lines = pcall(original_get, ...)
      if ok then
        return ranges, lines
      end
      return nil, nil
    end
  end,
}
