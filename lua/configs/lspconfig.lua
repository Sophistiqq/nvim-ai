require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "svelte", "ts_ls", "emmet_language_server", "rust_analyzer", "jsonls", "yamlls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
