# Neovim

- OS: Windows 11
- Terminal: Wezterm
- Shell: PowerShell Core
- Editor: Neovim

## Setup

- Install `neovim`, `fd`, `ripgrep` & `rustup` via `scoop install neovim fd ripgrep rustup` @ PowerShell
- Install `Desktop development with C++` package with `Visual Studio Build Tools` installer
- Allow `cargo` SSL bypass with `setx CARGO_HTTP_CHECK_REVOKE false` @ PowerShell
- Clone this repository `git clone https://github.com/mezdelex/NeovimConfig $HOME/AppData/Local/nvim`

## Core

|   Name   |                   Source                   |                                         Uri                                          |
| :------: | :----------------------------------------: | :----------------------------------------------------------------------------------: |
| Autocmds |                    n/a                     | [autocmds](https://github.com/mezdelex/NeovimConfig/blob/main/lua/core/autocmds.lua) |
| Keymaps  |                    n/a                     |  [keymaps](https://github.com/mezdelex/NeovimConfig/blob/main/lua/core/keymaps.lua)  |
|   Lazy   | [repo](https://github.com/folke/lazy.nvim) |     [lazy](https://github.com/mezdelex/NeovimConfig/blob/main/lua/core/lazy.lua)     |
| Options  |                    n/a                     |  [options](https://github.com/mezdelex/NeovimConfig/blob/main/lua/core/options.lua)  |

## Plugins

|    Name    |                             Source                             |                                             Uri                                             |
| :--------: | :------------------------------------------------------------: | :-----------------------------------------------------------------------------------------: |
| Autopairs  |        [repo](https://github.com/windwp/nvim-autopairs)        |  [autopairs](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/autopairs.lua)  |
|  Autotags  |       [repo](https://github.com/windwp/nvim-ts-autotag)        |   [autotags](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/autotags.lua)   |
| Blankline  | [repo](https://github.com/lukas-reineke/indent-blankline.nvim) |  [blankline](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/blankline.lua)  |
|    Bqf     |        [repo](https://github.com/kevinhwang91/nvim-bqf)        |        [bqf](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/bqf.lua)        |
| Bufferline |       [repo](https://github.com/akinsho/bufferline.nvim)       | [bufferline](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/bufferline.lua) |
| Colorizer  |     [repo](https://github.com/norcalli/nvim-colorizer.lua)     |  [colorizer](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/colorizer.lua)  |
|    Dap     |        [repo](https://github.com/rcarriga/nvim-dap-ui)         |        [dap](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/dap.lua)        |
|  Devicons  |     [repo](https://github.com/nvim-tree/nvim-web-devicons)     |   [devicons](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/devicons.lua)   |
| Everforest |         [repo](https://github.com/sainnhe/everforest)          | [everforest](https://github.com/mezdelex/NeovimConfig/blob/main/lua/plugins/everforest.lua) |
|  Gitsigns  |       [repo](https://github.com/lewis6991/gitsigns.nvim)       |   [gitsigns](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/gitsigns.lua)   |
| Lspconfig  |        [repo](https://github.com/neovim/nvim-lspconfig)        |  [lspconfig](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/lspconfig.lua)  |
|  Lspsaga   |        [repo](https://github.com/nvimdev/lspsaga.nvim)         |    [lspsaga](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/lspsaga.lua)    |
|  Lualine   |      [repo](https://github.com/nvim-lualine/lualine.nvim)      |    [lualine](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/lualine.lua)    |
|  Markview  |        [repo](https://github.com/OXY2DEV/markview.nvim)        |   [markview](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/markview.lua)   |
|   Nonels   |       [repo](https://github.com/nvimtools/none-ls.nvim)        |     [nonels](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/nonels.lua)     |
|    Oil     |          [repo](https://github.com/stevearc/oil.nvim)          |        [oil](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/oil.lua)        |
| Registers  |      [repo](https://github.com/tversteeg/registers.nvim)       |  [registers](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/registers.lua)  |
|   Snacks   |          [repo](https://github.com/folke/snacks.nvim)          |     [snacks](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/snacks.lua)     |
| Treesitter |   [repo](https://github.com/nvim-treesitter/nvim-treesitter)   | [treesitter](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/treesitter.lua) |
|  Undotree  |           [repo](https://github.com/mbbill/undotree)           |   [undotree](https://github.com/mezdelex/NeovimConfig/tree/main/lua/plugins/undotree.lua)   |

## Images
![image](https://github.com/user-attachments/assets/3f59362b-5d91-4c20-a1fd-c880e8530fd2)
