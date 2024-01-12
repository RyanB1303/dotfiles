  vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
  vim.keymap.set.map('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set.map('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set.map('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set.map('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set.map('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set.map('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

  -- Allow clipboard copy paste in neovim
  vim.g.neovide_input_use_logo = 1
  vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })
