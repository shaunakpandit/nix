return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = true, -- do not load at startup
  event = 'BufReadPre',
  config = function()
    require 'custom.pluginConfig.lualine-evilline'
  end,
}
