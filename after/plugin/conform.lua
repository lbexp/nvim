local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        cpp = { "clang_format" },
        c = { "clang_format" }
    },
    formatters = {
        clang_format = {
            args = '--style="{IndentWidth: 4}"'
        },
        prettier = {
            single_quote = true,
            jsx_single_quote = true,
            prepend_args = {
                '--use-tabs',
                '--tab-width 2'
            }
        }
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 1000,
        lsp_format = "fallback",
    },
})
