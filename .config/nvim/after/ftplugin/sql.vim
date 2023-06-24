" nnoremap <F3> :%!sqlformat -k "lower" --reindent --comma_first True -<CR>
nnoremap <F3> :%!pg_format 2>/dev/null --type-case 1 --keyword-case 1 --comma-start --wrap-comment<CR>
