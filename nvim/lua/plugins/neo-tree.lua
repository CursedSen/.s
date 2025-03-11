return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            window = {
            position = "left",
            width = 30,
            border = nil
            }
        })
        vim.keymap.set('n', '<C-t>', ':Neotree filesystem left<CR>', {})
    end
}
