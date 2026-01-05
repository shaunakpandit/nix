return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  ft = { 'markdown' },
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
    -- see below for full list of optional dependencies 👇
  },
  -- A list of workspace names, paths, and configuration overrides.
  -- If you use the Obsidian app, the 'path' of a workspace should generally be
  -- your vault root (where the `.obsidian` folder is located).
  -- When obsidian.nvim is loaded by your plugin manager, it will automatically set
  -- the workspace to the first workspace in the list whose `path` is a parent of the
  -- current markdown file being edited.
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~//Library/Mobile Documents/iCloud~md~obsidian/Documents/Brain2',
      },
    },
    notes_subdir = 'inbox',
    new_notes_location = 'notes_subdir',

    disable_frontmatter = true,
    templates = {
      subdir = '99 - Meta/00 - Templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M:%S',
    },
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = '06 - Daily',
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = '%Y-%m-%d',
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = '%B %-d, %Y',
      -- Optional, default tags to add to each new daily note created.
      default_tags = { 'daily-notes' },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = '(TEMPLATE) nvimDaily.md',
    },

    -- name new notes starting the ISO datetime and ending with note name
    -- put them in the inbox subdir
    -- note_id_func = function(title)
    --   local suffix = ""
    --   -- get current ISO datetime with -5 hour offset from UTC for EST
    --   local current_datetime = os.date("!%Y-%m-%d-%H%M%S", os.time() - 5*3600)
    --   if title ~= nil then
    --     suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    --   else
    --     for _ = 1, 4 do
    --       suffix = suffix .. string.char(math.random(65, 90))
    --     end
    --   end
    --   return current_datetime .. "_" .. suffix
    -- end,

    -- key mappings, below are the defaults
    mappings = {
      -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- toggle check-boxes
      ['<leader>ch'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    ui = {
      -- Disable some things below here because I set these manually for all Markdown files using treesitter
      checkboxes = {},
      bullets = {},
    },
  },
}
