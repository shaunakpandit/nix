-- movement
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = false })
vim.api.nvim_set_keymap('v', 'jk', '<Esc>', { noremap = false })
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { noremap = true, silent = true })
-- Quicker close split
vim.keymap.set('n', '<leader>qq', ':q<CR>', { silent = true, noremap = true })

-- save without formatting
vim.keymap.set('n', '<leader>ww', ':noau w<CR>', { desc = 'Save without formatting' })

-- saving and exiting
vim.api.nvim_set_keymap('n', 'QQ', ':q!<enter>', { noremap = false })
vim.api.nvim_set_keymap('n', 'WW', ':w!<enter>', { noremap = false })
vim.api.nvim_set_keymap('n', 'E', '$', { noremap = false })
vim.api.nvim_set_keymap('n', 'B', '^', { noremap = false })
vim.api.nvim_set_keymap('n', 'TT', ':TransparentToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ss', ':noh<CR>', { noremap = true })

-- Terminal Mappings
vim.keymap.set('t', '<C-/>', '<cmd>close<cr>', { desc = 'Hide Terminal' })
vim.keymap.set('t', '<c-_>', '<cmd>close<cr>', { desc = 'which_key_ignore' })

-- windows
vim.keymap.set('n', '<leader>w', '<c-w>', { desc = 'Windows', remap = true })
vim.keymap.set('n', '<leader>-', '<C-W>s', { desc = 'Split Window Below', remap = true })
vim.keymap.set('n', '<leader>|', '<C-W>v', { desc = 'Split Window Right', remap = true })
vim.keymap.set('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window', remap = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Move Lines
vim.keymap.set('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
vim.keymap.set('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
vim.keymap.set('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
vim.keymap.set('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })

-- Code actions
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover' })
vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, { desc = 'Signature Help' }) -- signatureHelp
vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Help' }) -- signatureHelp
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' }) -- codeAction
vim.keymap.set({ 'n', 'v' }, '<leader>cc', vim.lsp.codelens.run, { desc = 'Run Codelens' }) -- codeLens
vim.keymap.set('n', '<leader>cC', vim.lsp.codelens.refresh, { desc = 'Refresh & Display Codelens' }) -- codeLens
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename' }) -- rename

-- quatro
vim.keymap.set('n', '<leader>o', '<nop>', { desc = 'Quatro' })
vim.keymap.set('n', '<leader>op', ':QuartoPreview<CR>', { silent = true, noremap = true })

-- parentKeymap Naming
vim.keymap.set('n', '<leader>a', '<nop>', { desc = '🤖 AI' })
vim.keymap.set('n', '<leader>b', '<nop>', { desc = '📑 Buffer' })
vim.keymap.set('n', '<leader>d', '<nop>', { desc = '🐝 Dbee' })
vim.keymap.set('n', '<leader>g', '<nop>', { desc = '🐙 Git' })
vim.keymap.set('n', '<leader>m', '<nop>', { desc = '🔥 Molten' })
vim.keymap.set('n', '<leader>u', '<nop>', { desc = '🍪 Snacks' })
vim.keymap.set('n', '<leader>x', '<nop>', { desc = '🚨 Trouble' })

-- SETTING THIS IN QUARTRO.NVIM file
-- local runner = require 'quarto.runner'
-- vim.keymap.set('n', '<leader>Rc', runner.run_cell, { desc = 'run cell', silent = true })
-- vim.keymap.set('n', '<leader>rca', runner.run_above, { desc = 'run cell and above', silent = true })
-- vim.keymap.set('n', '<leader>ra', runner.run_all, { desc = 'run all cells', silent = true })
-- vim.keymap.set('n', '<leader>rl', runner.run_line, { desc = 'run line', silent = true })
-- vim.keymap.set('v', '<leader>r', runner.run_range, { desc = 'run visual range', silent = true })
-- vim.keymap.set('n', '<leader>RA', function()
--   runner.run_all(true)
-- end, { desc = 'run all cells of all languages', silent = true })

-- Molten
vim.keymap.set('n', '<leader>mi', function()
  local venv = os.getenv 'VIRTUAL_ENV' or os.getenv 'CONDA_PREFIX'
  if venv ~= nil then
    -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
    venv = string.match(venv, '/.+/(.+)')
    vim.cmd(('MoltenInit %s'):format(venv))
  else
    vim.cmd 'MoltenInit python3'
  end
end, { desc = 'Initialize Molten for python3', silent = true })

vim.keymap.set('n', '<leader>os', ':noautocmd MoltenEnterOutput<CR>', { silent = true, desc = 'show/enter output' })
