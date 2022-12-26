require('nvim-treesitter.configs').setup {
    auto_install = true,
    ensure_installed = {
        'c_sharp',
        'cpp',
        'css',
        'dockerfile',
        'html',
        'javascript',
        'json',
        'json5',
        'jsonc',
        'lua',
        'markdown',
        'php',
        'python',
        'regex',
        'rust',
        'scss',
        'sql',
        'toml',
        'tsx',
        'typescript',
        'vue',
        'yaml'
    },
    highlight = {
        additional_vim_regex_highlighting = true,
        enable = true
    },
    sync_install = true
}
