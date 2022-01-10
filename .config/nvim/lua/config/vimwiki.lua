vim.cmd([[
  let personal = {}
  let personal.path = "~/notes/wikis/personal"
  let personal.nested_syntaxes = {"go": "go", "python": "python"}
  let g:vimwiki_list = [personal]
]])
