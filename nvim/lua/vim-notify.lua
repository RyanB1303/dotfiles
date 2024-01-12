local notify = require("notify")

notify.setup({
  background_colour = "#000000",
  timeout = 700
})

vim.api.nvim_set_keymap("n", "<a-p>",  "", { callback = require("notify").dismiss })

vim.notify = notify
