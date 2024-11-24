require("lint").linters_by_ft = {
	go = { "golangcilint" },
	gitcommit = { "gitlint" },
  html = { "htmlhint" },
}

local lint_progress = function()
	local linters = require("lint").get_running()
	if #linters == 0 then
		return "no linting"
	end
	return "linting " .. table.concat(linters, ", ")
end

vim.keymap.set("n", "<F7>", function()
	print(lint_progress())
end, { noremap = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		require("lint").try_lint()
	end,
})
