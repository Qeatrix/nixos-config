return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets",
                "L3MON4D3/LuaSnip",
                "hrsh7th/cmp-nvim-lsp",
                "onsails/lspkind.nvim",
            },
        },
        config = function()
            local ELLIPSIS_CHAR = '…'
            local MAX_LABEL_WIDTH = 25
            local MAX_KIND_WIDTH = 14

            local get_ws = function (max, len)
              return (" "):rep(max - len)
            end

            local format = function(_, item)
              local content = item.abbr
              -- local kind_symbol = symbols[item.kind]
              -- item.kind = kind_symbol .. get_ws(MAX_KIND_WIDTH, #kind_symbol)

              if #content > MAX_LABEL_WIDTH then
                item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
              else
                item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
              end

              return item
            end


            local cmp = require("cmp")
            local lspkind = require("lspkind")
            local status, lspkind = pcall(require, "lspkind")
            if not status then
                return
            end

            lspkind.init({

                symbol_map = {
                    Text = "󰦨 ",
                    Method = " ",
                    Function = " ",
                    Constructor = " ",
                    Field = " ",
                    Variable = " ",
                    Class = " ",
                    Interface = " ",
                    Module = " ",
                    Property = " ",
                    Unit = " ",
                    Value = "󰾡 ",
                    Enum = " ",
                    Keyword = "  ",
                    Snippet = " ",
                    Color = " ",
                    File = " ",
                    Reference = " ",
                    Folder = " ",
                    EnumMember = " ",
                    Constant = " ",
                    Struct = "  ",
                    Event = " ",
                    Operator = " ",
                    TypeParameter = " ",
                    Specifier = " ",
                    Statement = " ",
                    Recovery = " ",
                    TranslationUnit = " ",
                },
            })

            local function border(hl_name)
                return {
                    { "╭", hl_name },
                    { "─", hl_name },
                    { "╮", hl_name },
                    { "│", hl_name },
                    { "╯", hl_name },
                    { "─", hl_name },
                    { "╰", hl_name },
                    { "│", hl_name },
                }
            end

            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                preselect = "None",
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = {
                        border = border("CmpDocBorder"),
                        winhighlight = "Normal:CmpPmenu,Search:None",
                        scrollbar = false,
                    },
                    documentation = cmp.config.disable
                    --[[ documentation = {
						border = border("CmpDocBorder"),
						winhighlight = "Normal:CmpDoc",
					}, ]]
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "luasnip",  group_index = 1 },
                    { name = "nvim_lsp", max_item_count = 35, group_index = 1 },
                    {
                        name = "path",
                        group_index = 2,
                        trigger_characters = { "/", "./", "../" },
                    },
                    {
                        name = "buffer",
                        option = {
                            get_bufnrs = function()
                                return vim.api.nvim_list_bufs()
                            end,
                        },
                        keyword_length = 2,
                        max_item_count = 5,
                        group_index = 2,
                    },
                }),
                completion = {
                    keyword_length = 1,
                    completeopt = "menu,menuone,noinsert",
                },

                view = {
                    entries = "custom",
                },

                formatting = {
                    fields = {
                        "abbr",
                        "kind",
                    },

                    format = lspkind.cmp_format({
                        mode = 'symbol_text', -- show only symbol annotations
                        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                                     -- can also be a function to dynamically calculate max width such as 
                                     -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,

                        -- The function below will be called before any actual modifications from lspkind
                        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                        before = function (entry, item)
                            local menu_icon = {
                                nvim_lsp = "NLSP",
                                nvim_lua = "NLUA",
                                luasnip  = "LSNP",
                                buffer   = "BUFF",
                                path     = "PATH",
                            }
                            -- Set the menu "icon" to the shorthand for each completion source.
                            item.menu = menu_icon[entry.source.name]

                            -- Set the fixed width of the completion menu to 60 characters.
                            fixed_width = 35

                            -- Set 'fixed_width' to false if not provided.
                            fixed_width = fixed_width or false

                            -- Get the completion entry text shown in the completion window.
                            local content = item.abbr

                            -- Set the fixed completion window width.
                            if fixed_width then
                                vim.o.pumwidth = fixed_width
                            end

                            -- Get the width of the current window.
                            local win_width = vim.api.nvim_win_get_width(0)

                            -- Set the max content width based on either: 'fixed_width'
                            -- or a percentage of the window width, in this case 20%.
                            -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
                            local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

                            -- Truncate the completion entry text if it's longer than the
                            -- max content width. We subtract 3 from the max content width
                            -- to account for the "..." that will be appended to it.
                            if #content > max_content_width then
                                item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
                            else
                                item.abbr = content .. (" "):rep(max_content_width - #content)
                            end

                            return item
                        end
                    })
                },
                experimental = {
                    ghost_text = false,
                }
            })
        end,
    },
}
