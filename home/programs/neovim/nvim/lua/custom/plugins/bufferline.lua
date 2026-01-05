-- in your plugins.lua / where you declare your plugins:
return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    lazy = true, -- do not load at startup
    dependencies = 'nvim-tree/nvim-web-devicons',
    -- this init block runs BEFORE the plugin is loaded:
    init = function()
      -- create an augroup so we can clear it once bufferline is loaded
      local grp = vim.api.nvim_create_augroup('LazyBufferline', { clear = true })

      vim.api.nvim_create_autocmd({ 'BufAdd', 'BufReadPost', 'BufNewFile' }, {
        group = grp,
        callback = function()
          -- count only listed buffers
          local bufs = vim.fn.getbufinfo { buflisted = 1 }
          if #bufs >= 2 then
            -- unload our augroup so this only ever fires once
            vim.api.nvim_del_augroup_by_name 'LazyBufferline'
            -- actually load bufferline now
            require('lazy').load { plugins = { 'bufferline.nvim' } }
          end
        end,
      })
    end,

    -- config runs once the plugin has been loaded
    config = function()
      local bg = '#191d23' -- replace with your @thm_bg var or actual HEX
      local fg = '#CCD5E5' -- optional: if you want a default fg

      vim.opt.termguicolors = true
      require('bufferline').setup {
        options = {
          style_preset = require('bufferline').style_preset.minimal,
          offsets = {
            {
              filetype = 'snacks_layout_box',
              text = '',
              text_align = 'left',
              separator = true,
            },
          },
        },
        highlights = {
          -- the “fill” group is the empty space after your last tab
          fill = {
            -- gui = true,
            bg = bg,
            fg = fg, -- you can even match fg to your @thm_fg
          },
          -- background for non‐selected tabs
          background = {
            bg = bg,
          },
          -- separator between tabs
          separator = {
            bg = bg,
          },
          separator_selected = {
            bg = bg,
          },
          separator_visible = {
            bg = bg,
          },
          -- if you want the active tab to also blend:
          buffer_selected = {
            bg = bg,
          },
        },
      }
    end,
  },
}
