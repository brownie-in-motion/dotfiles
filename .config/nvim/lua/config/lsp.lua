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
        command = '\z
            lua vim.diagnostic.open_float({ \z
                scope = "cursor", \z
                focusable = false \z
            }) \z
        ',
    })

      local o = { noremap = true, silent = true, buffer = buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, o)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, o)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, o)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, o)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, o)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, o)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, o)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, o)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, o)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, o)
      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, o)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, o)
      vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, o)
end

-- keybinds before lsp load
local o = { noremap = true, silent = true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, o)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, o)

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
