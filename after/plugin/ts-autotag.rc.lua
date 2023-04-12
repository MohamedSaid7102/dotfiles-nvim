local status, autotag = pcall(require, "nvim-ts-autotag")
if (not status) then return end

autotag.setup({
  autotag = {
    enable = true,
    filetypes = {
      'js', 'tsx', 'jsx', 'rescript', 'php', 'markdown', 'glimmer', 'handlebars', 'hbs',
      "html", "xml", 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue',
    },
  }
})
