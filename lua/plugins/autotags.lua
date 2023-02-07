return {
    'windwp/nvim-ts-autotag',
    config = function()
        require('nvim-ts-autotag').setup({
            filetypes = {
                'glimmer',
                'handlebars',
                'hbs',
                'html',
                'javascript',
                'javascriptreact',
                'jsx',
                'markdown',
                'php',
                'rescript',
                'svelte',
                'tsx',
                'typescript',
                'typescriptreact',
                'vue',
                'xml'
            },
            skip_tags = {
                'area',
                'base',
                'br',
                'col',
                'command',
                'embed',
                'hr',
                'img',
                'input',
                'keygen',
                'link',
                'menuitem',
                'meta',
                'param',
                'slot',
                'source',
                'track',
                'wbr'
            }
        })
    end
}
