local present, lsp_installer = pcall(require, 'nvim-lsp-installer')

if not present then
  return
end

lsp_installer.setup {
  automatic_installation = true,

  ui = {
    icons = {
      server_installed = ' ',
      server_pending = ' ',
      server_uninstalled = ' ﮊ',
    },
    keymaps = {
      toggle_server_expand = '<CR>',
      install_server = 'i',
      update_server = 'u',
      check_server_version = 'c',
      update_all_servers = 'U',
      check_outdated_servers = 'C',
      uninstall_server = 'X',
    },
  },

  max_concurrent_installers = 10,
}

local on_attach = function(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  if client.server_capabilities.signatureHelpProvider then
      require('ui.signature').setup(client)
   end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { 'markdown', 'plaintext' },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  },
}

-- Servers

require('lspconfig').pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require'lspconfig'.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand '$VIMRUNTIME/lua'] = true,
          [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
