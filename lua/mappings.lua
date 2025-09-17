require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

map("n", "<C-Left>", "<C-w>h", { silent = true })
map("n", "<C-Right>", "<C-w>l", { silent = true })
map("n", "<C-Up>", "<C-w>k", { silent = true })
map("n", "<C-Down>", "<C-w>j", { silent = true })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local cmp = require "cmp"

cmp.setup {
  mapping = {
    ["<Tab>"] = cmp.mapping.confirm { select = true, behavior = cmp.ConfirmBehavior.Replace },
    ["<S-Tab>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    -- next item using Down arrow
    ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    -- previous item using Up arrow
    ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
  },
  sources = {
    -- { name = "supermaven" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "async_path" },
    { name = "luasnip" },
    { name = "treesitter" },
    { name = "path" },
  },
}
