return {
  'kndndrj/nvim-dbee',
  lazy = true, -- don't load at startup
  dependencies = { 'MunifTanjim/nui.nvim' },
  build = function()
    require('dbee').install()
  end,

  -- map <leader>db to load & open dbee
  keys = {
    {
      '<leader>db',
      function()
        -- 1) load the plugin
        require('lazy').load { plugins = { 'nvim-dbee' } }
        -- 2) open the UI
        require('dbee').open()
      end,
      desc = '🗄️  Open nvim-dbee',
      silent = true,
      noremap = true,
    },
  },
  config = function()
    require('dbee').setup {
      sources = {
        require('dbee.sources').EnvSource:new 'DBEE_CONNECTIONS',
        -- require("dbee.sources").MemorySource:new({
        --   {
        --     id = "localThea",
        --     name = "local",
        --     type = "mysql",
        --     url = "root:admin123@tcp(localhost:3306)/testlit_new",
        --     -- url = "jdbc:mysql://root:admin123@localhost:3306/testlit_new",
        --   },
        -- }),
      },
    }
  end,
}
