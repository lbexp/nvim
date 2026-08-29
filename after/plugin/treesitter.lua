-- nvim-treesitter was rewritten (incompatible with the old API):
-- it now only manages parser/query installation. Highlighting is handled
-- by Neovim core via `vim.treesitter.start()` (see `:h treesitter-highlight`).

local parsers = {
    "javascript",
    "typescript",
    "go",
    "cpp",
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
}

-- setup() is only needed to override the install_dir
-- (default: stdpath('data') .. '/site').
-- require("nvim-treesitter").setup({})

-- Install parsers asynchronously; no-op if already installed.
require("nvim-treesitter").install(parsers)

-- Enable treesitter highlighting (core feature).
vim.api.nvim_create_autocmd("FileType", {
    pattern = parsers,
    callback = function()
        vim.treesitter.start()
    end,
})

