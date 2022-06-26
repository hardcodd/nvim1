local autocmd = vim.api.nvim_create_autocmd
local api = vim.api

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

vim.t.bufs = vim.api.nvim_list_bufs()

-- thx to https://github.com/ii14 & stores buffer per tab -> table
autocmd('BufAdd', {
  callback = function(args)
    if vim.t.bufs == nil then
      vim.t.bufs = { args.buf }
    else
      local bufs = vim.t.bufs

      -- check for duplicates
      if not vim.tbl_contains(bufs, args.buf) then
        table.insert(bufs, args.buf)
        vim.t.bufs = bufs
      end
    end
  end,
})

autocmd('BufDelete', {
  callback = function(args)
    for _, tab in ipairs(api.nvim_list_tabpages()) do
      local bufs = vim.t[tab].bufs
      if bufs then
        for i, bufnr in ipairs(bufs) do
          if bufnr == args.buf then
            table.remove(bufs, i)
            vim.t[tab].bufs = bufs
            break
          end
        end
      end
    end
  end,
})

-- Return to last edit position when opening files
autocmd('BufReadPost', {
  pattern = '*',
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
})

-- Delete trailing white space on save, useful for some filetypes
autocmd('BufWritePre', {
  pattern = '*',
  command = [[
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
  ]]
})
