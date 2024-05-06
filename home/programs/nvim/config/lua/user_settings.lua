PREF = {
    common = {
        textwidth = 130,
        tabwidth = 4,
    },

    lsp = {
        diagnostic = {
            underline = false,
            format_on_save = false,
            signs = true,
            virtual_text = false,
            severity_sort = true,
        },
        install_servers = {
            "clangd",
            "cmake",
            "lua_ls",
            "jsonls",
            "nil_ls",
            "gopls",
	    "rust_analyzer",
        },
    },

    ui = {
        signs = {
            Error = "🤮",
            Warn  = "🤢",
            Hint  = "🤯",
            Info  = "🤓",
        },
        colorscheme = "monokai",
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    }
}
