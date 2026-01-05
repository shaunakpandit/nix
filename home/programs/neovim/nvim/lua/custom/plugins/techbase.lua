return {
  'mcauley-penney/techbase.nvim',
  lazy = true,
  -- priority = 1000, -- Make sure to load this before all the other start plugin
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('techbase').setup {
      styles = {
        comments = { italic = false }, -- Disable italics in comments
      },
    }

    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'techbase'
  end,
}
