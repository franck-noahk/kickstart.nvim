--[[ return {
  { -- This is the part that shows the start up streen
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('custom.plugins.themes.dashboard').config()
    end,
  },
}
]]
--
return {}
