return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
        pattern = { '*' },
        callback = function()
          local merge_unique = function(t1, t2)
            local result = {}
            local seen_values = {}
            for _, value in ipairs(vim.tbl_flatten { t1, t2 }) do
              if not seen_values[value] then
                seen_values[value] = true
                table.insert(result, value)
              end
            end

            return result
          end

          -- Fetch project.nvim projects
          local project = require 'project_nvim.project'
          local history = require 'project_nvim.utils.history'
          local recent = history.recent_projects or {}
          local session = history.session_projects or {}
          local recent_plus_session = merge_unique(recent, session)

          -- Fetch dashboard-nvim projects
          local utils = require 'dashboard.utils'
          local path = utils.path_join(vim.fn.stdpath 'cache', 'dashboard/cache')
          local projects = utils.read_project_cache(path) or {}

          -- Add any projects that project.nvim uniquely knows about to dashboard-nvim
          local all_projects = merge_unique(recent_plus_session, projects)
          vim.fn.writefile({ 'return ' .. vim.inspect(all_projects) }, path)

          -- Add any projects that dashboard-nvim uniquely knows about to project.nvim
          local should_save = false
          for _, value in ipairs(projects) do
            if not vim.tbl_contains(recent_plus_session, value) then
              pcall(project.set_pwd, value, 'manual') -- skip non-existent directories, dont error
              should_save = true
            end
          end
          --if should_save then
          --  history.write_projects_to_history()
          --end -- < remove this line
        end,
      })
      require('dashboard').setup {
        theme = 'hyper',
        shortcut_type = 'number',
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Projects',
              group = 'DiagnosticHint',
              action = 'Telescope projects',
              key = 'p',
            },
            {
              desc = ' quit',
              group = 'Letter',
              action = ':q',
              key = 'q',
            },
          },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' }, { 'nvim-telescope/telescope.nvim' } },
  },
}
