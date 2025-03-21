local lspconfig = require("lspconfig")
local common_on_attach = function(client, bufnr)
  -- 無効状態のほうがインスタンス変数などが、見やすいハイライトになるため
  -- see: https://www.reddit.com/r/neovim/comments/109vgtl/how_to_disable_highlight_from_lsp/
  -- see: :help vim.lsp.semantic_tokens.start
  client.server_capabilities.semanticTokensProvider = nil

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gR", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>re", vim.lsp.buf.rename)
  vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, bufopts)
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rubocop
lspconfig.rubocop.setup({
  on_attach = common_on_attach,
})

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruby_lsp
lspconfig.ruby_lsp.setup({
  on_attach = common_on_attach,
})

lspconfig.lua_ls.setup({
  on_attach = common_on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

lspconfig.jsonls.setup({
  on_attach = common_on_attach,
})

lspconfig.volar.setup({
  on_attach = common_on_attach,
})

lspconfig.svelte.setup({
  on_attach = common_on_attach,
})

-- MEMO: Project root に tsconfig.json or jsconfig.json を配置する必要がある
lspconfig.ts_ls.setup({
  on_attach = common_on_attach,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = require("mason-registry").get_package("vue-language-server"):get_install_path() .. "/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
})

lspconfig.tailwindcss.setup({
  on_attach = common_on_attach,
})

lspconfig.pylsp.setup({
  on_attach = common_on_attach,
})
