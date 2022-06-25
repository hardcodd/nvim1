local present, wk = pcall(require, 'which-key')

if not present then
  return
end

wk.setup {
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '  ', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
  },

  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },

  window = {
    border = 'none', -- none/single/double/shadow
  },

  layout = {
    spacing = 6, -- spacing between columns
  },

  hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' },

  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    i = { 'j', 'k' },
    v = { 'j', 'k' },
  },
}

local merge_tb = vim.tbl_deep_extend
local keymaps = require 'config.keymaps'

keymaps.lspconfig = nil

for _, section_keymaps in pairs(keymaps) do
  for mode, mode_keymaps in pairs(section_keymaps) do
    for keybind, mapping_info in pairs(mode_keymaps) do

      if mapping_info.opts then
        mapping_info.opts = nil
      end

      local default_opts = { mode = mode }
      local opts = merge_tb('force', default_opts, mapping_info.opts or {})

      wk.register({ [keybind] = mapping_info }, opts)
    end
  end
end

