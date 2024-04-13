vim.cmd [[set completeopt=menu,menuone,noselect]]

vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP action',
        callback = function()
            local bufmap = function(mode, lhs, rhs)
                local opts = { buffer = true }
                vim.keymap.set(mode, lhs, rhs, opts)
            end

            bufmap('n', '<leader>fi', '<cmd>lua vim.lsp.buf.hover()<cr>')
            bufmap('n', '<c-]>',
                   '<cmd>lua vim.lsp.buf.definition()<cr>')
            bufmap('n', '<leader>fd',
                   '<cmd>lua vim.lsp.buf.definition()<cr>')
            bufmap('n', '<leader>fs',
                   '<cmd>lua vim.lsp.buf.references()<cr>')
            bufmap('n', '<leader>fI',
                   '<cmd>lua vim.lsp.buf.implementation()<cr>')
            bufmap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
            bufmap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<cr>')
        end
    }
)

-- CurrentLine = -1

vim.api.nvim_create_autocmd('CursorHold', {
    callback = function()
        vim.diagnostic.open_float()
        -- if unpack(vim.api.nvim_win_get_cursor(0)) ~= CurrentLine
        -- then
        --     vim.diagnostic.open_float()
        --     CurrentLine = unpack(vim.api.nvim_win_get_cursor(0))
        -- end
    end
})

-- Set up nvim-cmp.
local cmp = require('cmp')
if not cmp
then
    return
end

local ELLIPSIS_CHAR = '…'
-- FIXME this prevents the completion menu from the command line to be as large as the
-- command line prompt
local MAX_LABEL_WIDTH = 35
local MIN_LABEL_WIDTH = 35

cmp.setup({ ---@diagnostic disable-line: redundant-parameter
    view = {
        entries = "custom",
        selection_order = "near_curor",
        docs = {
            auto_open = true,
        }
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    formatting = {
        format = function(entry, vim_item)
            local label = vim_item.abbr
            local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
            if truncated_label ~= label then
                vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
            elseif string.len(label) < MIN_LABEL_WIDTH then
                local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
                vim_item.abbr = label .. padding
            end
            return vim_item
        end,
    },
    window = {
        completion = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
            side_padding = 2,
            col_offset = -3,
            max_width = 20
        }),
        documentation = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
            side_padding = 2,
            col_offset = -3,
            max_width = 20
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(
        { behavior = cmp.SelectBehavior.Insert }),{'i','c'}),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(
        { behavior = cmp.SelectBehavior.Insert }),{'i','c'}),
        ['<C-e>'] = cmp.mapping.abort(),
        -- Accept currently selected item. Set `select` to `false` to only
        -- confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'neorg' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        -- You can specify the `cmp_git` source if you were installed it.
        { name = 'cmp_git' },
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't
-- work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't
-- work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['lua_ls'].setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

require('lspconfig')['kotlin_language_server'].setup {
    cmd = { "/home/guillaume/dev/clone/kotlin-language-server/server/build/install/server/bin/kotlin-language-server" }
}

require('lspconfig')['pyright'].setup {
    capabilities = capabilities,
}

require('lspconfig')['clangd'].setup {
    capabilities = capabilities
}
-- Setup rust_analyzer via rust-tools.nvim
require("rust-tools").setup({
    server = {
        capabilities = capabilities,
        on_attach = lsp_attach,
    }
})

require("lspconfig")['tsserver'].setup {
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
}

require("lspconfig")['zls'].setup {
}
