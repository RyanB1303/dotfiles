local set = vim.opt
local au = require('au')


-- idk
au.BufRead = {
        '*.ex,*.exs',
        function()
                vim.bo.filetype = 'elixir'
        end
}
au.BufRead = {
        '*.eex,*.heex,*.leex,*.sface,*.lexs',
        function ()
                vim.bo.filetype = 'html_eex'
        end
}
-- settings
set.syntax = 'on'
set.expandtab = true
-- set.shiftwidth = 2
set.smarttab = true
set.tabstop = 2
set.softtabstop = 2
set.scrolloff = 20
set.smartindent = true
set.cursorline = true
-- set.autochdir = true

-- set.wrap = false
set.scrolloff = 5
set.fileencoding = 'utf-8'
set.termguicolors = true
set.foldenable = false
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.list = false
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

set.number = true
set.relativenumber = true
set.cursorline = true
set.guifont = { "MesloLGS NF", ":h12" }
-- set.guifont = { "Meslo LG S Regular Nerd Font", ":h12" }

vim.g['loaded_perl_provider'] = 0
-- python thing
vim.g.python3_host_prog = '/Users/ry/opt/anaconda3/bin/python3'
--neovide

if vim.g.neovide then
        require('neovide-config')
end
--plugins
require('barbar-config')
require('codicon-config')
require('harpoon-config')
require('keymaps')
require('lsp-config')
require('lualine-config')
require('neotest-config')
require('plugins')
require('telescope-config')
-- require('transparent')
require('tree-config')
require('tree-sitter-config')
require('vim-notify')
--themes
-- set.background = 'dark'
vim.g.gruvbox_material_better_performance = 1
vim.cmd [[colorscheme catppuccin-mocha]]
