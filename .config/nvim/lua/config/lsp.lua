-- install everything used
require("nvim-lsp-installer").setup({
    automatic_installation = true
})

local lspconfig = require 'lspconfig'
local util = require 'lspconfig/util'

-- start coq immediately with custom keymaps
vim.g.coq_settings = {
    auto_start = 'shut-up',
    keymap = {
        manual_complete = '<c-a>',
        jump_to_mark = '<c-l>',
    },
}

local coq = require 'coq'

--- publish diagnostics without virtual text
local publish = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

-- override the publish handler
vim.lsp.handlers['textDocument/publishDiagnostics'] = publish

-- show diagnostics in popup
local function on_attach(client, buf)
    vim.api.nvim_create_autocmd('CursorHold', {
        pattern = '<buffer>',
        command = 'lua vim.diagnostic.open_float({ scope = "cursor" })',
    })
end

-- language server configs
lspconfig.eslint.setup(coq.lsp_ensure_capabilities {
    on_attach = on_attach,
})

lspconfig.tsserver.setup(coq.lsp_ensure_capabilities {
    on_attach = on_attach,
    root_dir = function (pattern)
        local cwd  = vim.loop.cwd()
        local root = util.root_pattern(
            'package.json',
            'tsconfig.json',
            '.git'
        )(pattern)
        return root or cwd
    end,
    handlers = {
        ['textDocument/publishDiagnostics'] = function(_, result, ctx, config)
            if result.diagnostics ~= nil then
                local ignore = { [80001] = true }
                local current = 1
                while current <= #result.diagnostics do
                    if ignore[result.diagnostics[current].code] then
                        table.remove(result.diagnostics, current)
                    else
                        current = current + 1
                    end
                end
            end
            publish(_, result, ctx, config)
        end,
    },
})

lspconfig.pyright.setup(coq.lsp_ensure_capabilities {
    on_attach = on_attach,
})
