local M = {}

M.general = {

  i = {

    -- go to  beginning and end
    ['<C-b>'] = { '<ESC>^i', '論 beginning of line' },
    ['<C-e>'] = { '<End>', '壟 end of line' },

    -- navigate within insert mode
    ['<C-h>'] = { '<Left>', '  move left' },
    ['<C-l>'] = { '<Right>', ' move right' },
    ['<C-j>'] = { '<Down>', ' move down' },
    ['<C-k>'] = { '<Up>', ' move up' },

  },

  n = {

    -- save
    ['<C-s>'] = { '<cmd> w <CR>', '﬚  save file' },

    -- delete word under cursor
    ['dw'] = { 'wbdw', ' delete word under cursor' },

    -- duplicate line
    ['<M-n>'] = { 'yyp', 'ﱔ duplicate line' },

  }

}

M.telescope = {
  n = {

    -- find
    [';f'] = { '<cmd> Telescope find_files <CR>', '  find files' },
    [';a'] = { '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>', '  find all' },
    [';w'] = { '<cmd> Telescope live_grep <CR>', '   live grep' },
    [';b'] = { '<cmd> Telescope buffers <CR>', '  find buffers' },
    [';h'] = { '<cmd> Telescope help_tags <CR>', '  help page' },
    [';o'] = { '<cmd> Telescope oldfiles <CR>', '   find oldfiles' },
    [';k'] = { '<cmd> Telescope keymaps <CR>', '   show keys' },

    -- git
    ['<leader>cm'] = { '<cmd> Telescope git_commits <CR>', '   git commits' },
    ['<leader>gt'] = { '<cmd> Telescope git_status <CR>', '  git status' },
  },
}

M.whichkey = {
  n = {
    ['<leader>wK'] = {
      function()
        vim.cmd 'WhichKey'
      end,
      '   which-key all keymaps',
    },
    ['<leader>wk'] = {
      function()
        local input = vim.fn.input 'WhichKey: '
        vim.cmd('WhichKey ' .. input)
      end,
      '   which-key query lookup',
    },
  },
}

return M
