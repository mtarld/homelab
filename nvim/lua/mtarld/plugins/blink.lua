return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  opts_extend = { "sources.default" },
  opts = {
    keymap = {
      preset = 'enter',
      ['<Tab>'] = { 'select_and_accept' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
    },
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
    },
    sources = {
      cmdline = function()
        local type = vim.fn.getcmdtype()

        if type == ':' or type == '@' then
          return { 'cmdline' }
        end

        return {}
      end,
    },
  },
}
