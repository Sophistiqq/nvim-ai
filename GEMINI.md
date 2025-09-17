# .stylua.toml

```toml
column_width = 120
line_endings = "Unix"
indent_type = "Spaces"
indent_width = 2
quote_style = "AutoPreferDouble"
call_parentheses = "None"

```

# init.lua

```lua
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

```

# lazy-lock.json

```json
{
  "LuaSnip": { "branch": "master", "commit": "21f74f7ba8c49f95f9d7c8293b147c2901dd2d3a" },
  "NvChad": { "branch": "v2.5", "commit": "29ebe31ea6a4edf351968c76a93285e6e108ea08" },
  "base46": { "branch": "v3.0", "commit": "0094095ed60aa55f7148bc1e783b0156f3e7f4f8" },
  "cmp-async-path": { "branch": "main", "commit": "0ed1492f59e730c366d261a5ad822fa37e44c325" },
  "cmp-buffer": { "branch": "main", "commit": "b74fab3656eea9de20a9b8116afa3cfc4ec09657" },
  "cmp-nvim-lsp": { "branch": "main", "commit": "bd5a7d6db125d4654b50eeae9f5217f24bb22fd3" },
  "cmp-nvim-lua": { "branch": "main", "commit": "f12408bdb54c39c23e67cab726264c10db33ada8" },
  "cmp_luasnip": { "branch": "master", "commit": "98d9cb5c2c38532bd9bdb481067b20fea8f32e90" },
  "conform.nvim": { "branch": "master", "commit": "b4aab989db276993ea5dcb78872be494ce546521" },
  "friendly-snippets": { "branch": "main", "commit": "572f5660cf05f8cd8834e096d7b4c921ba18e175" },
  "gitsigns.nvim": { "branch": "main", "commit": "6e3c66548035e50db7bd8e360a29aec6620c3641" },
  "indent-blankline.nvim": { "branch": "master", "commit": "005b56001b2cb30bfa61b7986bc50657816ba4ba" },
  "lazy.nvim": { "branch": "main", "commit": "6c3bda4aca61a13a9c63f1c1d1b16b9d3be90d7a" },
  "mason.nvim": { "branch": "main", "commit": "7dc4facca9702f95353d5a1f87daf23d78e31c2a" },
  "menu": { "branch": "main", "commit": "7a0a4a2896b715c066cfbe320bdc048091874cc6" },
  "minty": { "branch": "main", "commit": "aafc9e8e0afe6bf57580858a2849578d8d8db9e0" },
  "nvim-autopairs": { "branch": "master", "commit": "23320e75953ac82e559c610bec5a90d9c6dfa743" },
  "nvim-cmp": { "branch": "main", "commit": "b5311ab3ed9c846b585c0c15b7559be131ec4be9" },
  "nvim-lspconfig": { "branch": "master", "commit": "c8b90ae5cbe21d547b342b05c9266dcb8ca0de8f" },
  "nvim-tree.lua": { "branch": "master", "commit": "fefa335f1c8f690eb668a1efd18ee4fc6d64cd3e" },
  "nvim-treesitter": { "branch": "master", "commit": "42fc28ba918343ebfd5565147a42a26580579482" },
  "nvim-web-devicons": { "branch": "master", "commit": "6e51ca170563330e063720449c21f43e27ca0bc1" },
  "plenary.nvim": { "branch": "master", "commit": "b9fd5226c2f76c951fc8ed5923d85e4de065e509" },
  "smear-cursor.nvim": { "branch": "main", "commit": "4b86df8a0c5f46e708616b21a02493bb0e47ecbd" },
  "supermaven-nvim": { "branch": "main", "commit": "07d20fce48a5629686aefb0a7cd4b25e33947d50" },
  "telescope.nvim": { "branch": "master", "commit": "b4da76be54691e854d3e0e02c36b0245f945c2c7" },
  "ui": { "branch": "v3.0", "commit": "4852e04faefbba3a18cb197b76ac00f4bc2e615f" },
  "volt": { "branch": "main", "commit": "7b8c5e790120d9f08c8487dcb80692db6d2087a1" },
  "which-key.nvim": { "branch": "main", "commit": "370ec46f710e058c9c1646273e6b225acf47cbed" },
  "windsurf.vim": { "branch": "main", "commit": "a8d47ec54fe82df920b2545559f767003e8a7f8d" }
}

```

# lua/autocmds.lua

```lua
require "nvchad.autocmds"

```

# lua/chadrc.lua

```lua
-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "material-deep-ocean",
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    Variable = { bold = true },
    ["@variable"] = { bold = true },
  },
  termguicolors = true,
  -- transparency = true,
}

-- M.nvdash = { load_on_startup = true }

M.term = {
  sizes = { sp = 0.2, float = 0.8, vsplit = 0.2 },
}
return M

```

# lua/configs/conform.lua

```lua
local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options

```

# lua/configs/lazy.lua

```lua
return {
  defaults = { lazy = true },
  install = { colorscheme = { "nvchad" } },

  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}

```

# lua/configs/lspconfig.lua

```lua
require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "svelte", "ts_ls", "emmet_language_server", "rust_analyzer", "jsonls", "yamlls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

```

# lua/mappings.lua

```lua
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

```

# lua/options.lua

```lua
require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

```

# lua/plugins/init.lua

```lua
return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}

```

# lua/plugins/smear.lua

```lua
return {
  "sphamba/smear-cursor.nvim",
  lazy = false,
  opts = {},
}

```

# lua/plugins/supermaven.lua

```lua
return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "BufRead",
    config = function()
      require("supermaven-nvim").setup({
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false,           -- disables built in keymaps for more manual control
        keymaps = {
          -- using alt + enter
          -- accept_suggestion = "<M-Tab>",
          accept_suggestion = "<A-CR>",
        },
      })
    end,
  },
}

```

# README.md

```md
**This repo is supposed to be used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

```

