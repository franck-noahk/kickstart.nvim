return {
  'nvim-tree/nvim-tree.lua',
  lazy = false,
  config = function()
    require('nvim-tree').setup {
      sort = {
        sorter = 'case_sensitive',
      },
      view = {
        width = 180,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    }
    vim.keymap.set('n', '<leader>ee', require('nvim-tree.api').tree.toggle, { desc = 'Toggle the file explorer' })
    vim.keymap.set('n', '<leader>e1', ':NvimTreeResize 30<CR>', { desc = 'Set size to 30' })
    vim.keymap.set('n', '<leader>e2', ':NvimTreeResize 50<CR>', { desc = 'Set size to 50' })
    vim.keymap.set('n', '<leader>e3', ':NvimTreeResize 80<CR>', { desc = 'Set size to 80' })
  end,
}
