return {
  {
    'EdenEast/nightfox.nvim',
    init = function()
      vim.cmd 'colorscheme nightfox'
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
    dependencies = {
      {
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
          require('luasnip.loaders.from_lua').load { './snippets/' }
        end,
      },
    },
  },
}
