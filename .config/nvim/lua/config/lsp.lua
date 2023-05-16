-- install everything used
require('nvim-lsp-installer').setup({
    automatic_installation = true
})

-- third party stuff
require('coq_3p') {
    { src = 'nvimlua', short_name = 'nLUA', conf_only = true },
    { src = 'bc', short_name = 'MATH', precision = 6 },
    { src = 'vimtex', short_name = 'vTEX' },
}

-- formatting and stuff
require('null-ls').setup({
    debug = true,
    sources = {
        require('null-ls').builtins.formatting.prettier.with({
            extra_args = function(params)
                return {
                    '--config',
                    vim.fn.expand('~/.config/nvim/util/prettierrc.json'),
                }
            end,
        }),
        -- require('null-ls').builtins.diagnostics.codespell.with({
        --     extra_args = function(params)
        --         return {
        --             '--ignore-words',
        --             vim.fn.expand('~/.config/nvim/util/codespellignorewords'),
        --         }
        --     end,
        -- }),
    },
})

-- slow format
function format()
    vim.lsp.buf.format({ timeout_ms = 2000 })
end

vim.keymap.set('n', '<space>f', format, o)

local lspconfig = require 'lspconfig'
local util = require 'lspconfig/util'

vim.g.coq_settings = {
    auto_start = 'shut-up',
    clients = {
        tree_sitter = { path_sep = ' v' },
        tags = { parent_scope = ' v', path_sep = ' > ' },
    },
    display = {
        ghost_text = { enabled = false, },
        icons = { mode = 'none', },
        preview = {
            border = {
                { '', 'NormalFloat' },
                { '', 'NormalFloat' },
                { '', 'NormalFloat' },
                { ' ', 'NormalFloat' },
                { '', 'NormalFloat' },
                { '', 'NormalFloat' },
                { '', 'NormalFloat' },
                { ' ', 'NormalFloat' },
            },
        },
        pum = {
            kind_context = { ' <', '>' },
            source_context = { '[', ']' },
        },
    },
    keymap = {
        jump_to_mark = '<c-l>',
        manual_complete = '<c-a>',
        recommended = false,
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
                focusable = false, \z
                header = false, \z
                scope = "cursor", \z
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

    if vim.bo[buf].formatexpr == 'v:lua.vim.lsp.formatexpr()' then
      vim.bo[buf].formatexpr = nil
    end
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
    on_attach = function (client, buf)
        on_attach(client, buf)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
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

lspconfig.ccls.setup(coq.lsp_ensure_capabilities {
    on_attach = on_attach,
})

lspconfig.pyright.setup(coq.lsp_ensure_capabilities {
    on_attach = on_attach,
})

lspconfig.ltex.setup(coq.lsp_ensure_capabilities {
    on_attach = on_attach,
    filetypes = {
        'tex',
    },
})

lspconfig.hls.setup(coq.lsp_ensure_capabilities {
    on_attach = on_attach,
})

lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities {
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            procMacro = {
                enable = true,
            },
        },
    },
})

lspconfig.solidity_ls.setup(coq.lsp_ensure_capabilities {
    on_attach = on_attach,
})

lspconfig.gopls.setup(coq.lsp_ensure_capabilities {
    on_attach = on_attach,
})

lspconfig.jdtls.setup(coq.lsp_ensure_capabilities {
    on_attach = on_attach,
})

lspconfig.yamlls.setup(coq.lsp_ensure_capabilities {
    on_attach = on_attach,
    settings = {
        yaml = {
            schemas = {
                ['https://brown.ee/VxTTaRnr.yaml'] = '*.ikea'
            }
        }
    }
})
