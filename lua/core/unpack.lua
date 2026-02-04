local unpack_path = vim.fn.stdpath("data") .. "/site/pack/managers/start/unpack"

if not vim.uv.fs_stat(unpack_path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/mezdelex/unpack.nvim",
        unpack_path,
    })
end
