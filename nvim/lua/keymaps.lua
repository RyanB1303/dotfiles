local wk = require("which-key")
local mark = require("harpoon.mark")
local ntest = require("neotest")

local opts = {
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = false, -- use `nowait` when creating keymaps
}
vim.g.mapleader = ','
-- lsp go in lsp-config
wk.register({
        -- telescope
            ["<C-p>"] = { "<cmd>Telescope find_files<cr>", "Find File" },
            ["<space>o"] = { "<cmd>Telescope lsp_document_symbols<cr>", "List Symbols" },
            ["<leader>b"] = { "<cmd>Telescope buffers<cr>", "Buffer List" },
            ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Live grep all file" },
            ["<leader>d"] = { "<cmd>Dash<cr>", "dash search" },
            ["<space>h"] = { "<cmd>Telescope harpoon marks<cr>", "harpoon marks" },
        -- vim fugitive
            ["<leader>g"] = { "<cmd>0G<cr>", "Fugitive New buffer" },
            ["<leader>,"] = { "<cmd>w<cr>", "Save file" },
        -- run test
            ["<leader>tt"] = { function() ntest.run.run() end, "Test Nearest" },
            ["<leader>T"] = { function () ntest.run.run(vim.fn.expand("%")) end, "Test File" },
            ["<leader>tl"] = { function() ntest.run.run_last() end, "Test Last" },
        -- end
        -- buffer movements
            ["<a-w>"] = { "<cmd>BufferClose<cr>", "buffer close" },
            ["<a-.>"] = { "<cmd>BufferNext<cr>", "buffer next" },
            ["<a-,>"] = { "<cmd>BufferPrevious<cr>", "buffer previous" },
        -- move buffer location
            ["<a-<>"] = { "<cmd>BufferMovePrevious<cr>", "buffer move previous alt" },
            ["<a->>"] = { "<cmd>BufferMoveNext<cr>", "buffer move next alt" },
        -- alternative buffer movements
            ["<s-t>"] = { "<cmd>BufferPrevious<cr>", "buffer previous alt" },
            ["t"] = { "<cmd>BufferNext<cr>", "buffer next alt" },
        -- end
            ["<c-w>a"] = { "<cmd>wincmd h<cr>", "alt switch right pane" },
            ["<c-w>d"] = { "<cmd>wincmd l<cr>", "alt switch left pane" },
        -- sidebar toggler
            ["<c-b>b"] = { "<cmd>NvimTreeToggle<cr>", "Toggle navigation" },
            ["<c-b>g"] = { "<cmd>MerginalToggle<cr>", "Toggle merginal" },
        -- harpoon
            ["<leader>a"] = { mark.add_file, "Harpoon add file" },
            ["<leader>ar"] = { mark.clear_all, "Harpoon reset" }
}, opts)
