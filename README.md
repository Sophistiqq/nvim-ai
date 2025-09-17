# My NvChad Configuration

This is my personal Neovim configuration based on NvChad.

## Plugins

This configuration uses the following plugins:

- LuaSnip
- NvChad
- base46
- cmp-async-path
- cmp-buffer
- cmp-nvim-lsp
- cmp-nvim-lua
- cmp_luasnip
- conform.nvim
- friendly-snippets
- gitsigns.nvim
- indent-blankline.nvim
- lazy.nvim
- mason.nvim
- menu
- minty
- nvim-autopairs
- nvim-cmp
- nvim-lspconfig
- nvim-tree.lua
- nvim-treesitter
- nvim-web-devicons
- plenary.nvim
- smear-cursor.nvim
- supermaven-nvim
- telescope.nvim
- ui
- volt
- which-key.nvim
- windsurf.vim

## Installation

1.  Clone this repository to your `~/.config/nvim` directory.
2.  Run `nvim` and `Lazy` will automatically install the plugins.

## Key Mappings

| Keybinding | Description |
|---|---|
| `;` | Enter command mode |
| `jk` | Escape from insert mode |
| `<leader>ca` | Code Action |
| `<C-Left>` | Move to left window |
| `<C-Right>` | Move to right window |
| `<C-Up>` | Move to upper window |
| `<C-Down>` | Move to lower window |
| `<C-s>` | Save file |
| `<Tab>` | Confirm completion |
| `<S-Tab>` | Select previous completion |
| `<Down>` | Select next completion |
| `<Up>` | Select previous completion |

## Plugin Configuration

### Conform

- Format on save is enabled.
- `stylua` is used for formatting Lua files.

### Supermaven

- Inline completion is enabled.
- Keymap for accepting suggestion is `<A-CR>`.

### Smear Cursor

- This plugin is enabled to give a 'smear' effect to the cursor.

## LSP Servers

The following LSP servers are configured:

- html
- cssls
- svelte
- ts_ls
- emmet_language_server
- rust_analyzer
- jsonls
- yamlls

## Theme and UI

- **Theme:** `material-deep-ocean`
- **Highlight Overrides:**
    - Comments are italicized.
    - Variables are bold.
- **Termguicolors:** Enabled

## Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!