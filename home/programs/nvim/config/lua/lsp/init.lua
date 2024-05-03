local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
    return
end

require('lsp.handler').diagnostic()

for _, server in pairs(PREF.lsp.install_servers) do
    local opts = {
        on_attach = require('lsp.handler').on_attach,
        capabilities = require('lsp.handler').capabilities,
    }
    local has_server_opts, server_opts = pcall(require, "lsp.lang." .. server)
    if has_server_opts then
        opts = vim.tbl_deep_extend("force", server_opts, opts)
    end
    lsp[server].setup(opts)
end

