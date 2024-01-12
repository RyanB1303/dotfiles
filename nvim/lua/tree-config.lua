require("nvim-tree").setup({
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  auto_reload_on_write = true,
  diagnostics = {
    enable = true,
    icons = {
      error = "x",
      warning = "!",
    }
  },
  sync_root_with_cwd = true,
  view = {
    adaptive_size = false,
    centralize_selection = true,
    side = "left",
    relativenumber = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
    width = 50
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    full_name = false,
    highlight_opened_files = "all",
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      }, 
    }
  },
  filters = {
    dotfiles = false,
    custom = { "^.git$", "^.vscode$", "node_modules", "tmp", "_build", "deps", ".elixir_ls" }
  },
  update_focused_file = {
    enable = true
  },
  hijack_cursor = true,
  disable_netrw = true,
  hijack_directories = {
    enable = false,
    auto_open = false
  },
  git = {
    enable = false
  },
  live_filter = {
    always_show_folders = false
  }
})
