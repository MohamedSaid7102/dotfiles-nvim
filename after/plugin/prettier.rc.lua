local function read_prettier_config()
  local project_root = vim.fn.getcwd()
  local prettier_config_file = project_root .. "/.prettierrc"
  local config_file = io.open(prettier_config_file, "r")

  if not config_file then
    return {}
  end

  local config_json = config_file:read("*all")
  config_file:close()

  return vim.fn.json_decode(config_json)
end


-- Prettier configuration
local prettier = pcall(require, "prettier")
if (not prettier) then return end

local prettier_config = read_prettier_config()

prettier.setup({
  tab_width = prettier_config.tabWidth or 2,
  single_quote = prettier_config.singleQuote or false,
  trailing_comma = prettier_config.trailingComma or "none",
  print_width = prettier_config.printWidth or 80,
})

-- Enable Prettier for certain filetypes
vim.api.nvim_exec([[
  autocmd FileType typescript,json,yaml,html,css,scss,md,markdown,jsx,javascript,tsx let g:prettier#autoformat = 1
]], false)
