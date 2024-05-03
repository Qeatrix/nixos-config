return {
    {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
            {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
		'hrsh7th/vim-vsnip',

		"hrsh7th/cmp-nvim-lua",
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets",
                "L3MON4D3/LuaSnip",
                "onsails/lspkind.nvim",
            },
        },

	config = function()
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

	    require("luasnip.loaders.from_vscode").lazy_load()

	    local cmp = require("cmp")
	    cmp.setup({
		preselect = "None",
		snippet = {
		    expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
			--require("luasnip").lsp_expand(args.body)
		    end,
		},

		window = {
		    completion = cmp.config.window.bordered(),
		    documentation = cmp.config.window.bordered(),
		},

		mapping = {
	      	  ['<C-p>'] = cmp.mapping.select_prev_item(),
	      	  ['<C-n>'] = cmp.mapping.select_next_item(),
	      	  -- Add tab support
	      	  ['<S-Tab>'] = cmp.mapping.select_prev_item(),
	      	  ['<Tab>'] = cmp.mapping.select_next_item(),
	      	  ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
	      	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	      	  ['<C-Space>'] = cmp.mapping.complete(),
	      	  ['<C-e>'] = cmp.mapping.close(),
	      	  ['<CR>'] = cmp.mapping.confirm({
	      	    behavior = cmp.ConfirmBehavior.Insert,
	      	    select = true,
	      	  })
	      	},

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
		  { name = 'vsnip', keyword_length = 2 },
	      	  { name = 'calc' },
	      	}),

		formatting = {
		    fields = { 'menu', 'abbr', 'kind' },
		    format = lspkind.cmp_format({
                        maxwidth = 50,
                        mode = "symbol_text",
                    }),
		}
	    })
	end,
    }
}
