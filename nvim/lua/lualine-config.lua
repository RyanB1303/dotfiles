-- Color for highlights
local colors = {
        yellow = '#ECBE7B',
        cyan = '#008080',
        darkblue = '#081633',
        green = '#98be65',
        orange = '#FF8800',
        violet = '#a9a1e1',
        magenta = '#c678dd',
        blue = '#51afef',
        red = '#ec5f67'
}
-- Inserts a component in lualine_c at left section

local ins_left = {
        'lsp_progress',
        -- With spinner
        display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
        colors = {
                percentage      = colors.cyan,
                title           = colors.cyan,
                message         = colors.cyan,
                spinner         = colors.cyan,
                lsp_client_name = colors.magenta,
                use             = true,
        },
        separators = {
                component = ' ',
                progress = ' | ',
                percentage = { pre = '', post = '%% ' },
                title = { pre = '', post = ': ' },
                lsp_client_name = { pre = '[', post = ']' },
                spinner = { pre = '', post = '' },
                message = { commenced = 'In Progress', completed = 'Completed' },
        },
        timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
        spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
}

local function lsp_list()
        local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })

        if next(buf_clients) == nil then
                return 'No LSP attached'
        end

        local buf_client_names = {}

        for _, client in pairs(buf_clients) do
                if client.name ~= 'null-ls' then
                        table.insert(buf_client_names, client.name)
                end
        end

        return table.concat(buf_client_names, ', ')
end

local function formatters_list()
        local formatters = require('config.lsp.formatters')
        local buf_ft = vim.bo.filetype
        local supported_formatters = formatters.list_registered(buf_ft)
        return table.concat(supported_formatters, ', ')
end

local location = {
        'location',
        padding = { 0, 6 },
}

local lsp_servers = {
        lsp_list,
        icon = ' LSP:',
        icons_enabled = true,
}

local formatters = {
        formatters_list,
        icon = ' Formatter:',
        icons_enabled = true,
}

require('lualine').setup {
        options = {
                icons_enabled = true,
                theme = 'dracula',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                        statusline = {
                                'Packer',
                                'NvimTree',
                                'Merginal'
                        },
                        winbar = {},
                },
                ignore_focus = {
                        'Packer',
                        'NvimTree',
                        'Merginal'
                },
                always_divide_middle = true,
                globalstatus = vim.go.laststatus == 3,
                refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                },
        },
        sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { { 'filename', file_status = true, path = 1, shorting_target = 50 }, ins_left },
                lualine_x = {
                        { '%=', separator = '' },
                        lsp_servers,
                        formatters,
                },
                lualine_y = { 'filetype', 'encoding' },
                lualine_z = {
                        location
                }
        },
        inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { 'filename', file_status = true, path = 2 } },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
}
