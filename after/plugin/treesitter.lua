local present, treesitter = pcall(require, 'nvim-treesitter.configs')

if not present then
  return
end

treesitter.setup {

  ensure_installed = {
    'html',
    'python',
    'css',
    'scss',
    'lua',
    'javascript',
    'json',
    'markdown',
  },

  sync_install = false,

  highlight = {
    enable = true,
    use_languagetree = true,
  }

}
