setl tabstop=2
setl softtabstop=2
setl shiftwidth=2
setl smarttab
setl expandtab
nnoremap <F3> :%!stylua --indent-width 2 --indent-type "Spaces" --line-endings "Unix" --column-width 99 --quote-style "AutoPreferDouble" --stdin-filepath % -<CR>
