> [!NOTE]
>
> - OS: Windows 11
> - Terminal: Wezterm
> - Shell: PowerShell
> - Editor: Neovim

---

> [!IMPORTANT]
>
> - Install `neovim-nightly`, `fd`, `grpcurl`, `mingw-winlibs-llvm-msvcrt`, `ripgrep`, `rustup` & `tree-sitter` via `scoop install neovim-nightly fd grpcurl mingw-winlibs-llvm-msvcrt ripgrep rustup tree-sitter` @ PowerShell.
> - Install `roslyn-language-server` via `dotnet tool install -g roslyn-language-server --prerelease` @ PowerShell.
> - Install `Desktop development with C++` package with `Visual Studio Build Tools` installer.
> - Allow `cargo` SSL bypass with `setx CARGO_HTTP_CHECK_REVOKE false` @ PowerShell (corporate environments).
> - Allow `curl` SSL bypass with `--ssl-no-revoke` inside `$HOME/_curlrc` (corporate environments).
> - Set `codecompanion` adapter API key with `setx <ADAPTER>_API_KEY <API_KEY>` @ PowerShell.
>   - Ollama Cloud requires _Device Key_ instead; use `ollama signin` to generate it.
> - Clone this repository `git clone https://github.com/mezdelex/neovim $HOME/AppData/Local/nvim`.

---

### Core

|       Name        |                                            Source                                            |                                      Uri                                       |
| :---------------: | :------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------: |
|      keymaps      |                                             n/a                                              |  [keymaps](https://github.com/mezdelex/neovim/blob/main/lua/core/keymaps.lua)  |
|      options      |                                             n/a                                              |  [options](https://github.com/mezdelex/neovim/blob/main/lua/core/options.lua)  |
| vim.pack + UnPack | [repo](https://neovim.io/doc/user/pack.html)/[repo](https://github.com/mezdelex/unpack.nvim) |   [unpack](https://github.com/mezdelex/neovim/blob/main/lua/core/unpack.lua)   |
|     autocmds      |                                             n/a                                              | [autocmds](https://github.com/mezdelex/neovim/blob/main/lua/core/autocmds.lua) |

### Plugins

|     Name      |                                                                                                                         Source                                                                                                                          |                                             Uri                                             |
| :-----------: | :-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------: |
|   autopairs   |                                                                                                    [repo](https://github.com/windwp/nvim-autopairs)                                                                                                     |     [autopairs](https://github.com/mezdelex/neovim/tree/main/lua/plugins/autopairs.lua)     |
|    autotag    |                                                                                                    [repo](https://github.com/windwp/nvim-ts-autotag)                                                                                                    |       [autotag](https://github.com/mezdelex/neovim/tree/main/lua/plugins/autotag.lua)       |
|   blankline   |                                                                                             [repo](https://github.com/lukas-reineke/indent-blankline.nvim)                                                                                              |     [blankline](https://github.com/mezdelex/neovim/tree/main/lua/plugins/blankline.lua)     |
|     blink     |                                                                                                       [repo](https://github.com/Saghen/blink.cmp)                                                                                                       |         [blink](https://github.com/mezdelex/neovim/tree/main/lua/plugins/blink.lua)         |
|      bqf      |                                                                                                    [repo](https://github.com/kevinhwang91/nvim-bqf)                                                                                                     |           [bqf](https://github.com/mezdelex/neovim/tree/main/lua/plugins/bqf.lua)           |
|  bufferline   |                                                                                                   [repo](https://github.com/akinsho/bufferline.nvim)                                                                                                    |    [bufferline](https://github.com/mezdelex/neovim/tree/main/lua/plugins/bufferline.lua)    |
|  codeaction   |                                                                                               [repo](https://github.com/rachartier/tiny-code-action.nvim)                                                                                               |    [codeaction](https://github.com/mezdelex/neovim/tree/main/lua/plugins/codeaction.lua)    |
| codecompanion |                                                                                                 [repo](https://github.com/olimorris/codecompanion.nvim)                                                                                                 | [codecompanion](https://github.com/mezdelex/neovim/tree/main/lua/plugins/codecompanion.lua) |
|   colorizer   |                                                                                                 [repo](https://github.com/norcalli/nvim-colorizer.lua)                                                                                                  |     [colorizer](https://github.com/mezdelex/neovim/tree/main/lua/plugins/colorizer.lua)     |
|      dap      | [repo](https://github.com/mfussenegger/nvim-dap)/[repo](https://github.com/leoluz/nvim-dap-go)/[repo](https://github.com/mfussenegger/nvim-dap-python)/[repo](https://github.com/nvim-neotest/nvim-nio)/[repo](https://github.com/rcarriga/nvim-dap-ui) |           [dap](https://github.com/mezdelex/neovim/tree/main/lua/plugins/dap.lua)           |
|   devicons    |                                                                                                 [repo](https://github.com/nvim-tree/nvim-web-devicons)                                                                                                  |      [devicons](https://github.com/mezdelex/neovim/tree/main/lua/plugins/devicons.lua)      |
|  everforest   |                                                                                                   [repo](https://github.com/neanias/everforest-nvim)                                                                                                    |    [everforest](https://github.com/mezdelex/neovim/blob/main/lua/plugins/everforest.lua)    |
|   gitsigns    |                                                                                                   [repo](https://github.com/lewis6991/gitsigns.nvim)                                                                                                    |      [gitsigns](https://github.com/mezdelex/neovim/tree/main/lua/plugins/gitsigns.lua)      |
|    kulala     |                                                                                                   [repo](https://github.com/mistweaverco/kulala.nvim)                                                                                                   |        [kulala](https://github.com/mezdelex/neovim/tree/main/lua/plugins/kulala.lua)        |
|    lazydev    |                                                                                                      [repo](https://github.com/folke/lazydev.nvim)                                                                                                      |       [lazydev](https://github.com/mezdelex/neovim/tree/main/lua/plugins/lazydev.lua)       |
|   lspconfig   |                        [repo](https://github.com/neovim/nvim-lspconfig)/[repo](https://github.com/seblyng/roslyn.nvim)/[repo](https://github.com/mason-org/mason-lspconfig.nvim)/[repo](https://github.com/mason-org/mason.nvim)                        |     [lspconfig](https://github.com/mezdelex/neovim/tree/main/lua/plugins/lspconfig.lua)     |
| lspsignature  |                                                                                                   [repo](https://github.com/ray-x/lsp_signature.nvim)                                                                                                   |  [lspsignature](https://github.com/mezdelex/neovim/tree/main/lua/plugins/lspsignature.lua)  |
|    lualine    |                                                                                                  [repo](https://github.com/nvim-lualine/lualine.nvim)                                                                                                   |       [lualine](https://github.com/mezdelex/neovim/tree/main/lua/plugins/lualine.lua)       |
|   markdown    |                                                                                          [repo](https://github.com/MeanderingProgrammer/render-markdown.nvim)                                                                                           |      [markdown](https://github.com/mezdelex/neovim/tree/main/lua/plugins/markdown.lua)      |
|    nonels     |                                                                                                    [repo](https://github.com/nvimtools/none-ls.nvim)                                                                                                    |        [nonels](https://github.com/mezdelex/neovim/tree/main/lua/plugins/nonels.lua)        |
|      oil      |                                                                              [repo](https://github.com/stevearc/oil.nvim)/[repo](https://github.com/nvim-lua/plenary.nvim)                                                                              |           [oil](https://github.com/mezdelex/neovim/tree/main/lua/plugins/oil.lua)           |
|    quicker    |                                                                                                    [repo](https://github.com/stevearc/quicker.nvim)                                                                                                     |       [quicker](https://github.com/mezdelex/neovim/tree/main/lua/plugins/quicker.lua)       |
|   registers   |                                                                                                   [repo](https://github.com/tversteeg/registers.nvim)                                                                                                   |     [registers](https://github.com/mezdelex/neovim/tree/main/lua/plugins/registers.lua)     |
|   telescope   |                               [repo](https://github.com/nvim-telescope/telescope.nvim)/[repo](https://github.com/nvim-telescope/telescope-fzf-native.nvim)/[repo](https://github.com/fdschmidt93/telescope-egrepify.nvim)                               |     [telescope](https://github.com/mezdelex/neovim/tree/main/lua/plugins/telescope.lua)     |
|  treesitter   |                                                            [repo](https://github.com/nvim-treesitter/nvim-treesitter)/[repo](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)                                                            |    [treesitter](https://github.com/mezdelex/neovim/tree/main/lua/plugins/treesitter.lua)    |
|   undotree    |                                                                                                       [repo](https://github.com/mbbill/undotree)                                                                                                        |      [undotree](https://github.com/mezdelex/neovim/tree/main/lua/plugins/undotree.lua)      |

### Utils

|    Name    | Source |                                         Uri                                         |
| :--------: | :----: | :---------------------------------------------------------------------------------: |
|    dap     |  n/a   |        [dap](https://github.com/mezdelex/neovim/tree/main/lua/utils/dap.lua)        |
| treesitter |  n/a   | [treesitter](https://github.com/mezdelex/neovim/tree/main/lua/utils/treesitter.lua) |

### Lsp

| Name  |                                      Source                                      |                                    Uri                                    |
| :---: | :------------------------------------------------------------------------------: | :-----------------------------------------------------------------------: |
| ts_ls | [repo](https://github.com/typescript-language-server/typescript-language-server) | [ts_ls](https://github.com/mezdelex/neovim/blob/main/after/lsp/ts_ls.lua) |

### Images

<img width="1919" height="1028" alt="image" src="https://github.com/user-attachments/assets/6e572d9d-ede4-4491-aa44-bcda066888ed" />
<img width="1919" height="1028" alt="image" src="https://github.com/user-attachments/assets/e0025139-0bfe-4af0-bff3-556fd998422b" />
<img width="1919" height="1025" alt="image" src="https://github.com/user-attachments/assets/33fd2437-ffe4-4a44-9291-4eeecbff52cf" />
<img width="1919" height="1023" alt="image" src="https://github.com/user-attachments/assets/a90ce40b-370f-4218-9891-aaa2abb104cc" />
