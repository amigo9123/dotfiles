local builtin = require('telescope.builtin')

vim.keymap.set('n', '<M-P>', function()
  local opts = {}   -- define here if you want to define something
  builtin.find_files(opts)

  -- vim.fn.system('git rev-parse --is-inside-work-tree')

  -- if vim.v.shell_error == 0 then
  --     builtin.git_files(opts)
  -- else
  --     builtin.find_files(opts)
  -- end
end)

vim.keymap.set('n', '<leader><M-P>', builtin.find_files, {})

vim.keymap.set('n', '<M-F>', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
