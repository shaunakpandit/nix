-- [[ Basic Autocommands ]].
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

local function augroup(name)
    return vim.api.nvim_create_augroup('lazyvim_' .. name, { clear = true })
end

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- format buffer on save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("LspFormatPreSave", { clear = true }),
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
        -- vim.lsp.buf.format({
        --     async = false,
        --     bufnr = args.buf,
        -- })
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
    group = augroup 'resize_splits',
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd 'tabdo wincmd ='
        vim.cmd('tabnext ' .. current_tab)
    end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
    group = augroup 'last_loc',
    callback = function(event)
        local exclude = { 'gitcommit' }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
            return
        end
        vim.b[buf].lazyvim_last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
    group = augroup 'close_with_q',
    pattern = {
        'PlenaryTestPopup',
        'checkhealth',
        'dbout',
        'gitsigns-blame',
        'grug-far',
        'help',
        'lspinfo',
        'neotest-output',
        'neotest-output-panel',
        'neotest-summary',
        'notify',
        'qf',
        'snacks_win',
        'spectre_panel',
        'startuptime',
        'tsplayground',
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.schedule(function()
            vim.keymap.set('n', 'q', function()
                vim.cmd 'close'
                pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
            end, {
                buffer = event.buf,
                silent = true,
                desc = 'Quit buffer',
            })
        end)
    end,
})

-- make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd('FileType', {
    group = augroup 'man_unlisted',
    pattern = { 'man' },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
    end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
    group = augroup 'wrap_spell',
    pattern = { 'text', 'plaintex', 'typst', 'gitcommit', 'markdown' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ 'FileType' }, {
    group = augroup 'json_conceal',
    pattern = { 'json', 'jsonc', 'json5' },
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    group = augroup 'auto_create_dir',
    callback = function(event)
        if event.match:match '^%w%w+:[\\/][\\/]' then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        local bs = { buffer = true, silent = true }
        local bsr = { buffer = true, remap = true, silent = true }
        vim.keymap.set('n', '<C-c>', '<cmd>bd<CR>', bs) -- Close the current Netrw buffer
        vim.keymap.set('n', '<Tab>', 'mf', bsr)         -- Mark the file/directory to the mark list
        vim.keymap.set('n', '<S-Tab>', 'mF', bsr)       -- Unmark all the files/directories
        -- Improved file creation
        vim.keymap.set('n', '%', function()
            local dir = vim.b.netrw_curdir or vim.fn.expand('%:p:h')
            vim.ui.input({ prompt = 'Enter filename: ' }, function(input)
                if input and input ~= '' then
                    local filepath = dir .. '/' .. input
                    vim.cmd('!touch ' .. vim.fn.shellescape(filepath))
                    vim.api.nvim_feedkeys('<C-l>', 'n', false)
                end
            end)
        end, { buffer = true, silent = true })
    end
})
