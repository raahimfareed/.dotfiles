-- local lsp = require('lsp-zero')
-- lsp.preset('recommended')
--
-- lsp.ensure_installed({
-- 	'tsserver',
-- 	'eslint',
-- 	'sumneko_lua',
-- 	'rust_analyzer'
-- })
--
-- lsp.setup()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})

require('mason-lspconfig').setup {
    ensure_installed = {
        'tsserver',
        'eslint',
        'rust_analyzer',
        'clangd'
    },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    },
}
