local lsp = require("lsp-zero")
local lsp_conf = require("lspconfig")

require('mason.settings').set({
  ui = {
    border = 'rounded'
  }
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})

lsp.ensure_installed({
    'elixirls',
    'solargraph',
    'intelephense',
    'tsserver',
    'rust_analyzer'
})

lsp.setup_nvim_cmp({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 2},
    {name = 'buffer', keyword_length = 2},
  }
})

local on_attach = lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>p", "<cmd>LspZeroFormat<cr>", opts)
end)

lsp_conf.elixirls.setup{
    cmd = { "/Users/ry/.config/elixir-ls/language_server.sh" },
    on_attach = on_attach
}

lsp_conf.intelephense.setup{
  licenceKey = "00RHJ8DSNYWJNR8"
}

lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  float = true,
})
