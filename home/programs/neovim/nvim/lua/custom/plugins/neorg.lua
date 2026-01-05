return {
  'nvim-neorg/neorg',
  build = 'Neorg sync-parsers',
  version = '*',
  lazy = true, -- do not load at startup
  event = 'BufEnter',
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.keybinds'] = {
          config = {
            vim.api.nvim_create_autocmd('FileType', {
              pattern = 'norg',
              callback = function()
                vim.keymap.set('n', '<localleader>s', ':Neorg generate-workspace-summary<CR>', { buffer = true })
                vim.keymap.set('n', '<localleader>im', ':Neorg inject-metadata <CR>', {})
              end,
            }),
            vim.keymap.set('n', '<localleader>ni', ':Neorg index <CR>', {}),
            vim.keymap.set('n', '<localleader>jj', ':Neorg journal today <CR>', {}),
            vim.keymap.set('n', '<localleader>jt', ':Neorg journal tomorrow <CR>', {}),
            vim.keymap.set('n', '<localleader>jy', ':Neorg journal yesterday <CR>', {}),
            vim.keymap.set('n', '<localleader>wp', ':Neorg workspace notes <CR>', {}),
            vim.keymap.set('n', '<localleader>wt', ':Neorg workspace thea <CR>', {}),
          },
        },
        ['core.summary'] = {},
        ['core.export'] = {},
        ['core.concealer'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/norgotes/notes',
              thea = '~/norgotes/thea',
            },
            default_workspace = 'notes',
          },
        },
      },
    }

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
