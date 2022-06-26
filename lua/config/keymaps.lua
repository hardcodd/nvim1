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

    -- buffers navigation
    ['<Tab>'] = { ':bNext <CR>', '→ next buffer' },
    ['<S-Tab>'] = { ':bprevious <CR>', '← previous buffer' },

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

M.comment = {

  -- toggle comment in both modes
  n = {
    ['gc'] = {
      function()
        require('Comment.api').toggle_current_linewise()
      end,

      '蘒  toggle comment',
    },
  },

  v = {
    ['gc'] = {
      '<ESC><cmd>lua require(\'Comment.api\').toggle_linewise_op(vim.fn.visualmode())<CR>',
      '蘒  toggle comment',
    },
  },
}

M.lspconfig = {
  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ['gD'] = {
      function()
        vim.lsp.buf.declaration()
      end,
      '   lsp declaration',
    },

    ['gd'] = {
      function()
        vim.lsp.buf.definition()
      end,
      '   lsp definition',
    },

    ['K'] = {
      function()
        vim.lsp.buf.hover()
      end,
      '   lsp hover',
    },

    ['gi'] = {
      function()
        vim.lsp.buf.implementation()
      end,
      '   lsp implementation',
    },

    ['<leader>ls'] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      '   lsp signature_help',
    },

    ['<leader>D'] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      '   lsp definition type',
    },

    ['<leader>ra'] = {
      function()
        require('nvchad.ui.renamer').open()
      end,
      '   lsp rename',
    },

    ['<leader>ca'] = {
      function()
        vim.lsp.buf.code_action()
      end,
      '   lsp code_action',
    },

    ['gr'] = {
      function()
        vim.lsp.buf.references()
      end,
      '   lsp references',
    },

    ['<leader>f'] = {
      function()
        vim.diagnostic.open_float()
      end,
      '   floating diagnostic',
    },

    ['[d'] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      '   goto prev',
    },

    ['d]'] = {
      function()
        vim.diagnostic.goto_next()
      end,
      '   goto_next',
    },

    ['<leader>q'] = {
      function()
        vim.diagnostic.setloclist()
      end,
      '   diagnostic setloclist',
    },

    ['<leader>fm'] = {
      function()
        vim.lsp.buf.formatting()
      end,
      '   lsp formatting',
    },

    ['<leader>wa'] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      '   add workspace folder',
    },

    ['<leader>wr'] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      '   remove workspace folder',
    },

    ['<leader>wl'] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      '   list workspace folders',
    },
  },
}

return M
