> [!NOTE]
>
> - OS: Windows 11
> - Terminal: Wezterm
> - Shell: PowerShell Core
> - Editor: Neovim

---

> [!IMPORTANT]
>
> - Install `neovim-nightly`, `fd`, `grpcurl`, `ripgrep`, `rustup` & `tree-sitter` via `scoop install neovim-nightly fd grpcurl ripgrep rustup tree-sitter` @ PowerShell
> - Install `Desktop development with C++` package with `Visual Studio Build Tools` installer
> - Allow `cargo` SSL bypass with `setx CARGO_HTTP_CHECK_REVOKE false` @ PowerShell
> - Allow `curl` SSL bypass with `--ssl-no-revoke` inside `$HOME/_curlrc`
> - Set `codecompanion` adapter API key with `setx <ADAPTER>_API_KEY <API_KEY>` @ PowerShell
> - Clone this repository `git clone https://github.com/mezdelex/NeovimConfig $HOME/AppData/Local/nvim`

---

### Core

|    Name    | Source |                                           Uri                                            |
| :--------: | :----: | :--------------------------------------------------------------------------------------: |
|  autocmds  |  n/a   |   [autocmds](https://github.com/mezdelex/NeovimConfig/blob/main/lua/core/autocmds.lua)   |
| extensions |  n/a   | [extensions](https://github.com/mezdelex/NeovimConfig/blob/main/lua/core/extensions.lua) |
|  keymaps   |  n/a   |    [keymaps](https://github.com/mezdelex/NeovimConfig/blob/main/lua/core/keymaps.lua)    |
|  options   |  n/a   |    [options](https://github.com/mezdelex/NeovimConfig/blob/main/lua/core/options.lua)    |
|    pack    |  n/a   |       [pack](https://github.com/mezdelex/NeovimConfig/blob/main/lua/core/pack.lua)       |

### Plugins

|     Name      |                                Source                                |                                                Uri                                                |
| :-----------: | :------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------: |
|   autopairs   |           [repo](https://github.com/windwp/nvim-autopairs)           |     [autopairs](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/autopairs.lua)     |
|    autotag    |          [repo](https://github.com/windwp/nvim-ts-autotag)           |       [autotag](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/autotag.lua)       |
|   blankline   |    [repo](https://github.com/lukas-reineke/indent-blankline.nvim)    |     [blankline](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/blankline.lua)     |
|     blink     |             [repo](https://github.com/Saghen/blink.cmp)              |         [blink](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/blink.lua)         |
|      bqf      |           [repo](https://github.com/kevinhwang91/nvim-bqf)           |           [bqf](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/bqf.lua)           |
|  bufferline   |          [repo](https://github.com/akinsho/bufferline.nvim)          |    [bufferline](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/bufferline.lua)    |
|  codeaction   |     [repo](https://github.com/rachartier/tiny-code-action.nvim)      |    [codeaction](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/codeaction.lua)    |
| codecompanion |       [repo](https://github.com/olimorris/codecompanion.nvim)        | [codecompanion](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/codecompanion.lua) |
|   colorizer   |        [repo](https://github.com/norcalli/nvim-colorizer.lua)        |     [colorizer](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/colorizer.lua)     |
|      dap      |           [repo](https://github.com/rcarriga/nvim-dap-ui)            |           [dap](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/dap.lua)           |
|   devicons    |        [repo](https://github.com/nvim-tree/nvim-web-devicons)        |      [devicons](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/devicons.lua)      |
|  diagnostic   |  [repo](https://github.com/rachartier/tiny-inline-diagnostic.nvim)   |    [diagnostic](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/diagnostic.lua)    |
|  everforest   |          [repo](https://github.com/neanias/everforest-nvim)          |    [everforest](https://github.com/mezdelex/NeovimConfig/blob/main/lua/plugins/everforest.lua)    |
|      fzf      |             [repo](https://github.com/ibhagwan/fzf-lua)              |           [fzf](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/fzf.lua)           |
|   gitsigns    |          [repo](https://github.com/lewis6991/gitsigns.nvim)          |      [gitsigns](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/gitsigns.lua)      |
|    kulala     |         [repo](https://github.com/mistweaverco/kulala.nvim)          |        [kulala](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/kulala.lua)        |
|    lazydev    |            [repo](https://github.com/folke/lazydev.nvim)             |       [lazydev](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/lazydev.lua)       |
|   lspconfig   |           [repo](https://github.com/neovim/nvim-lspconfig)           |     [lspconfig](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/lspconfig.lua)     |
| lspsignature  |         [repo](https://github.com/ray-x/lsp_signature.nvim)          |  [lspsignature](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/lspsignature.lua)  |
|    lualine    |         [repo](https://github.com/nvim-lualine/lualine.nvim)         |       [lualine](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/lualine.lua)       |
|   markdown    | [repo](https://github.com/MeanderingProgrammer/render-markdown.nvim) |      [markdown](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/markdown.lua)      |
|    nonels     |          [repo](https://github.com/nvimtools/none-ls.nvim)           |        [nonels](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/nonels.lua)        |
|      oil      |             [repo](https://github.com/stevearc/oil.nvim)             |           [oil](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/oil.lua)           |
|    quicker    |           [repo](https://github.com/stevearc/quicker.nvim)           |       [quicker](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/quicker.lua)       |
|   registers   |         [repo](https://github.com/tversteeg/registers.nvim)          |     [registers](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/registers.lua)     |
|  treesitter   |      [repo](https://github.com/nvim-treesitter/nvim-treesitter)      |    [treesitter](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/treesitter.lua)    |
|   undotree    |              [repo](https://github.com/mbbill/undotree)              |      [undotree](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/undotree.lua)      |

### Utils

> [!TIP]
>
> To profile non deferred plugins use `vim.g.start_time = vim.uv.hrtime()` @ [init.lua](https://github.com/mezdelex/NeovimConfig/tree/main/init.lua)
>
> ![image](https://github.com/user-attachments/assets/9fec944f-ca82-4d78-a017-284698c77fce)

|    Name    | Source |                                            Uri                                            |
| :--------: | :----: | :---------------------------------------------------------------------------------------: |
|    dap     |  n/a   |        [dap](https://github.com/mezdelex/NeovimConfig/tree/main/lua/utils/dap.lua)        |
|    pack    |  n/a   |       [pack](https://github.com/mezdelex/NeovimConfig/tree/main/lua/utils/pack.lua)       |
|  profiler  |  n/a   |   [profiler](https://github.com/mezdelex/NeovimConfig/tree/main/lua/utils/profiler.lua)   |
|   shared   |  n/a   |     [shared](https://github.com/mezdelex/NeovimConfig/tree/main/lua/utils/shared.lua)     |
| treesitter |  n/a   | [treesitter](https://github.com/mezdelex/NeovimConfig/tree/main/lua/utils/treesitter.lua) |

### Lsp

| Name  |                                      Source                                      |                                       Uri                                       |
| :---: | :------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------: |
| ts_ls | [repo](https://github.com/typescript-language-server/typescript-language-server) | [ts_ls](https://github.com/mezdelex/NeovimConfig/blob/main/after/lsp/ts_ls.lua) |

### Images

![image](https://github.com/user-attachments/assets/dbe09968-a341-4214-a034-fa4954aa4554)
![image](https://github.com/user-attachments/assets/04789f4d-5481-40a3-8f7a-aee89b026273)
![image](https://github.com/user-attachments/assets/4d77fb01-9be6-478b-8b11-07408bf67f9d)


