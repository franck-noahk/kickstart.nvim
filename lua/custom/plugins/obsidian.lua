return {
  {
    'epwalsh/obsidian.nvim',
    tag = 'latest', -- recommended, use latest release instead of latest commit
    requires = {
      -- Required.
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',

      -- see below for full list of optional dependencies 👇
    },
    config = function()
      vim.opt.conceallevel = 2
      require('obsidian').setup {
        -- keymappings and whichkey
        vim.keymap.set('n', '<leader>on', ':ObsidianNew ', { desc = '[O]bsidian [N]ew File' }),
        vim.keymap.set('n', '<leader>os', ':ObsidianSearch ', { desc = 'Search Obsidian' }),
        vim.keymap.set('n', '<leader>so', ':ObsidianSearch ', { desc = 'Search Obsidian' }),
        vim.keymap.set('n', '<leader>ot', ':ObsidianNewFromTemplate ', { desc = '[O]bsidian New [T]emplate File' }),
        vim.keymap.set('n', '<leader>or', ':ObsidianRename ', { desc = '[O]bsidian [R]ename' }),

        vim.keymap.set('n', '<leader>o<cr>', function()
          return require('obsidian').util.gf_passthrough()
        end, { desc = '[O]bsidian New [T]emplate File' }),
        vim.keymap.set('n', '<leader>oct', function()
          return require('obsidian').util.toggle_checkbox()
        end, { desc = '[O]bsidian [C]heckbox [T]oggle' }),

        ui = {
          enable = true, -- set to false to disable all additional syntax features
          update_debounce = 200, -- update delay after a text change (in milliseconds)
          max_file_length = 5000, -- disable UI features for files with more than this many lines
          -- Define how various check-boxes are displayed
          checkboxes = {
            -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
            [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
            ['x'] = { char = '', hl_group = 'ObsidianDone' },
            ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
            ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
            ['!'] = { char = '', hl_group = 'ObsidianImportant' },
            -- Replace the above with this if you don't have a patched font:
            -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
            -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

            -- You can also add more custom ones...
          },
          -- Use bullet marks for non-checkbox lists.
          bullets = { char = '•', hl_group = 'ObsidianBullet' },
          external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
          -- Replace the above with this if you don't have a patched font:
          -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
          reference_text = { hl_group = 'ObsidianRefText' },
          highlight_text = { hl_group = 'ObsidianHighlightText' },
          tags = { hl_group = 'ObsidianTag' },
          block_ids = { hl_group = 'ObsidianBlockID' },
          hl_groups = {
            -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
            ObsidianTodo = { bold = true, fg = '#f78c6c' },
            ObsidianDone = { bold = true, fg = '#89ddff' },
            ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
            ObsidianTilde = { bold = true, fg = '#ff5370' },
            ObsidianImportant = { bold = true, fg = '#d73128' },
            ObsidianBullet = { bold = true, fg = '#89ddff' },
            ObsidianRefText = { underline = true, fg = '#c792ea' },
            ObsidianExtLinkIcon = { fg = '#c792ea' },
            ObsidianTag = { italic = true, fg = '#89ddff' },
            ObsidianBlockID = { italic = true, fg = '#89ddff' },
            ObsidianHighlightText = { bg = '#75662e' },
          },
        },
        workspaces = {
          {
            name = 'work',
            path = '~/Documents/Obsidian-Vaults/LEI-Work',
          },
        },
      }
    end,
  },
}
