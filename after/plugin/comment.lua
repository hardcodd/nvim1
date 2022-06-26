local present, comment = pcall(require, 'nvim_comment')

if not present then
  return
end

comment.setup {
  comment_empty = false
}
