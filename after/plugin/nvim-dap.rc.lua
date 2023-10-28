local dap = require('dap')

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {
    os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'
  }
}

dap.configurations.javascript = {
  {
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
    skipFiles = { '<node_internals>/**/*.js' },
  },
}

-- DebugHelper file start
local function attach()
  print("attaching")
  dap.run({
    type = 'node2',
    request = 'attach',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = { '<node_internals>/**/*.js' },
  })
end
-- DebugHelper file end


-- nvim-dap-ui
local dapui = require("dapui")

dapui.setup()
-- Listen to dap events and open/close the UI accordingly
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-- nvim-dap-virtual-text. Show virtual text for current frame
vim.g.dap_virtual_text = true

require("nvim-dap-virtual-text").setup {
  enabled = true,                     -- enable this plugin (the default)
  enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
  highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
  highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
  show_stop_reason = true,            -- show stop reason when stopped for exceptions
  commented = false,                  -- prefix virtual text with comment string
  only_first_definition = true,       -- only show virtual text at first definition (if there are multiple)
  all_references = false,             -- show virtual text on all all references of the variable (not only definitions)
  display_callback = function(variable, _buf, _stackframe, _node) return variable.name .. ' = ' .. variable.value end,
  -- experimental features:
  -- virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
  -- all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
  -- virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
  -- virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
}
-- Dap virtual text end



dap.defaults.fallback.terminal_win_cmd = '20split new'
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '⭐️', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '', texthl = '', linehl = '', numhl = '' })

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>b', function() require "dap".toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dD', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")

-- enable dapui
vim.keymap.set('n', '<leader>dui', function() require "dapui".toggle() end)

vim.keymap.set('n', '<leader>dt', function() require "dap".terminate() end)
vim.keymap.set('n', '<leader>dr', function() require "dap".clear_breakpoints() end)
vim.keymap.set('n', '<leader>de', function() require "dap".set_exception_breakpoints({ "all" }) end)
vim.keymap.set('n', '<leader>da', function() attach() end)

vim.keymap.set('n', '<leader>dh', function() require "dap.ui.widgets".hover() end)
vim.keymap.set('n', '<leader>d?',
  function()
    local widgets = require "dap.ui.widgets";
    widgets.centered_float(widgets.scopes)
  end)

-- new

vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function() require('dap.ui.widgets').hover() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function() require('dap.ui.widgets').preview() end)
-- navigating up and down in the call stack
vim.keymap.set('n', '<Leader>dgu', function() require('dap').up() end)
vim.keymap.set('n', '<Leader>dgd', function() require('dap').down() end)

vim.keymap.set('n', '<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')
vim.keymap.set('n', '<Leader>ds',
  function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
  end)


-- telescope-dap
vim.keymap.set('n', '<leader>dcc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
vim.keymap.set('n', '<leader>dco', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
vim.keymap.set('n', '<leader>dlb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
vim.keymap.set('n', '<leader>dvr', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')

-- vim.keymap.set('n', '<leader>dvs', '<cmd>lua require"dap.ui.variables".scopes()<CR>')
-- vim.keymap.set('n', '<leader>dvh', '<cmd>lua require"dap.ui.variables".hover()<CR>')
-- vim.keymap.set('v', '<leader>dvv', '<cmd>lua require"dap.ui.variables".visual_hover()<CR>')
