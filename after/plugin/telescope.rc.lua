local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
          ["<C-u>"] = false,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["n"] = fb_actions.create,
          ["x"] = fb_actions.remove,
          ["h"] = fb_actions.goto_parent_dir,
          ["l"] = fb_actions.change_cwd,
          ["."] = fb_actions.toggle_hidden,
          ["a"] = fb_actions.select_all,
          ["ua"] = fb_actions.toggle_all,
          ["p"] = fb_actions.copy,
          ["v"] = fb_actions.move,
          ["sd"] = fb_actions.sort_by_date,
          ["ss"] = fb_actions.sort_by_size,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    }
  },
}

telescope.load_extension("file_browser")

vim.keymap.set('n', ';f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', ';r', function()
  builtin.live_grep()
end)
vim.keymap.set('n', '\\\\', function()
  builtin.buffers()
end)
vim.keymap.set('n', ';t', function()
  builtin.help_tags()
end)
vim.keymap.set('n', ';;', function()
  builtin.resume()
end)
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)
vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = true,
    initial_mode = "normal",
    layout_config = { height = 60 }
  })
end)
