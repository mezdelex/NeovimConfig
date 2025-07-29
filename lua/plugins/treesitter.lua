return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        local fallback = vim.filetype.get_option
        local options = { remap = true }
        local textobjects = {
            ci = "@class.inner",
            co = "@class.outer",
            fi = "@function.inner",
            fo = "@function.outer",
            ii = "@conditional.inner",
            io = "@conditional.outer",
            li = "@loop.inner",
            lo = "@loop.outer",
        }

        require("nvim-treesitter.configs").setup({
            auto_install = true,
            highlight = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<cr>",
                    node_decremental = "<bs>",
                    node_incremental = "<cr>",
                },
            },
            textobjects = {
                move = {
                    enable = true,
                    goto_next_end = {
                        ["]C"] = textobjects.co,
                        ["]F"] = textobjects.fo,
                        ["]I"] = textobjects.io,
                        ["]L"] = textobjects.lo,
                    },
                    goto_next_start = {
                        ["]c"] = textobjects.co,
                        ["]f"] = textobjects.fo,
                        ["]i"] = textobjects.io,
                        ["]l"] = textobjects.lo,
                    },
                    goto_previous_end = {
                        ["[C"] = textobjects.co,
                        ["[F"] = textobjects.fo,
                        ["[I"] = textobjects.io,
                        ["[L"] = textobjects.lo,
                    },
                    goto_previous_start = {
                        ["[c"] = textobjects.co,
                        ["[f"] = textobjects.fo,
                        ["[i"] = textobjects.io,
                        ["[l"] = textobjects.lo,
                    },
                    set_jumps = true,
                },
                select = {
                    enable = true,
                    keymaps = {
                        ["ac"] = textobjects.co,
                        ["af"] = textobjects.fo,
                        ["ai"] = textobjects.io,
                        ["al"] = textobjects.lo,
                        ["ic"] = textobjects.ci,
                        ["if"] = textobjects.fi,
                        ["ii"] = textobjects.ii,
                        ["il"] = textobjects.li,
                    },
                    lookahead = true,
                },
            },
        })
        require("ts_context_commentstring").setup({
            enable_autocmd = false,
        })

        vim.filetype.get_option = function(filetype, option)
            return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
                or fallback(filetype, option)
        end

        vim.keymap.set("n", "<a-/>", "gcc", options)
        vim.keymap.set("v", "<a-/>", "gc", options)
    end,
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", "nvim-treesitter/nvim-treesitter-textobjects" },
}
