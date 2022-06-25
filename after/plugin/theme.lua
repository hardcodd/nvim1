local g = vim.g
local present, theme = pcall(require, 'github-theme')

if not present then
  return
end

theme.setup {
  theme_style = g.theme_variant,
  comment_style = 'italic',
  keyword_style = 'italic',
  function_style = 'italic',
  variable_style = 'italic',
  sidebars = {'qf', 'vista_kind', 'terminal', 'packer'},
}
