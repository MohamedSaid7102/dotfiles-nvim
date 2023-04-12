local status, closetag = pcall(require, "vim-closetag")
if (not status) then return end

vim.g.closetag_filenames =
"*.html,*.xhtml,*.phtml,*.jsx,*.tsx,*.js,*.jsx,*.vue,*.svelte,*.php,*.md,*.glimmer,*.handlebars,*.hbs"

vim.g.closetag_xhtml_filenames = "*.xhtml,*.jsx,*.tsx,*.js,*.jsx,*.vue,*.svelte,*.php,*.md,*.glimmer,*.handlebars,*.hbs"

vim.g.closetag_filetypes = "html,xhtml,jsx,tsx,js,jsx,vue,svelte,php,md,glimmer,handlebars,hbs"

vim.g.closetag_emptyTags_caseSensitive = 1

vim.g.closetag_enable_react_fragment = 1

vim.g.closetag_shortcut = ">"

vim.g.closetag_close_shortcut = "<C-c>"

vim.g.closetag_xhtml = 1
