return {
    {
        "tanvirtin/monokai.nvim",
        config = function()
            local monokai = require('monokai')

            monokai.setup {
                palette = require("monokai").ristretto
            }

            vim.cmd("colorscheme monokai")
        end,
    }
}
