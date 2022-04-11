
-- Lsp Installer

local lsp_installer = require('nvim-lsp-installer')

lsp_installer.on_server_ready(function(server)

  local capabilities = require('cmp_nvim_lsp')
    .update_capabilities(
      vim.lsp.protocol.make_client_capabilities())

  local opts = {capabilities = capabilities}
  if server.name == "sumneko_lua" then
    opts = vim.tbl_deep_extend("force", {
      settings = {
        Lua = {
          runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
          diagnostics = {globals = {'vim'}},
          workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
          telemetry = {enable = false}
        }
      }

    }, opts)
  elseif server.name == "sourcekit" then
    opts = vim.tbl_deep_extend("force", {
        filetypes = {"swift", "objective-c", "objective-cpp"},
        single_file_support = true
    }, opts)
  end

  server:setup(opts)

end)

-- Lsp Config for system installed servers

local lspconf = require('lspconfig')

lspconf.clangd.setup{
  filetypes = {"c", "cpp"},
}

lspconf.rust_analyzer.setup{}

lspconf.denols.setup{}

