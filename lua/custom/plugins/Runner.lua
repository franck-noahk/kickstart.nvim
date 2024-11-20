return {
  {
    'MarcHamamji/runner.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
    config = {},
    --require('runner').run(),
    --require('runner').autorun(),
    --require('runner').autorun_stop(),

    -- Can also be called with the buffer number where the code is:
    -- require('runner').run( <buffer_number> )
    -- require('runner').autorun( <buffer_number> )

    -- To set a mapping
    vim.keymap.set('n', '<leader>R', ':Runner<CR>'),
  },
}
