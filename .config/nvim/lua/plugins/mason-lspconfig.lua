require("mason-lspconfig").setup({
  ensure_installed = {
    "dockerls",
    "jsonls",
    "lua_ls",
    "rubocop",
    "ruby_lsp",
    "tsserver",
    "volar",
  },
})
