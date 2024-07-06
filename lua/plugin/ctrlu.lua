local M = {}

-- Helper function to determine if we should add a semicolon
local function should_add_semicolon(filetype)
	local semicolon_filetypes = {
		"javascript", "typescript", "java", "c", "cpp", "php", "dart"
	}
	return vim.tbl_contains(semicolon_filetypes, filetype)
end

-- Helper function to find the start of the current argument
local function find_argument_start(line, col)
	local start = col
	local paren_count = 0
	while start > 1 do
		local char = line:sub(start - 1, start - 1)
		if char == ")" then
			paren_count = paren_count + 1
		elseif char == "(" then
			paren_count = paren_count - 1
			if paren_count < 0 then
				break
			end
		elseif char == "," and paren_count == 0 then
			break
		end
		start = start - 1
	end
	return start
end

-- Helper function to find the end of the current argument
local function find_argument_end(line, col)
	local ending = col
	local paren_count = 0
	while ending <= #line do
		local char = line:sub(ending, ending)
		if char == "(" then
			paren_count = paren_count + 1
		elseif char == ")" then
			paren_count = paren_count - 1
			if paren_count < 0 then
				break
			end
		elseif (char == "," or char == ";") and paren_count == 0 then
			break
		end
		ending = ending + 1
	end
	return ending - 1
end

-- Main function to handle parentheses completion
function M.ctrlu()
	local line = vim.api.nvim_get_current_line()
	local _, col = unpack(vim.api.nvim_win_get_cursor(0))
	col = col + 1 -- Convert to 1-based index
	local filetype = vim.bo.filetype

	-- Case 1: Cursor at the end of the line
	if col > #line then
		local suffix = "(" .. (should_add_semicolon(filetype) and ");" or ")")
		vim.api.nvim_set_current_line(line .. suffix)
		vim.api.nvim_win_set_cursor(0, { vim.fn.line('.'), #line + 1 })
		return
	end

	-- Case 2: Cursor inside existing parentheses
	if line:sub(col, col) == "(" and line:sub(col + 1, col + 1) == ")" then
		vim.api.nvim_win_set_cursor(0, { vim.fn.line('.'), col })
		return
	end

	-- Case 3: Wrap existing content in parentheses
	local arg_start = find_argument_start(line, col)
	local arg_end = find_argument_end(line, col)
	local content_to_wrap = line:sub(arg_start, arg_end):gsub("^%s*(.-)%s*$", "%1")

	if content_to_wrap ~= "" then
		local new_line = line:sub(1, arg_start - 1) .. "(" .. content_to_wrap .. ")" .. line:sub(arg_end + 1)
		vim.api.nvim_set_current_line(new_line)
		vim.api.nvim_win_set_cursor(0, { vim.fn.line('.'), arg_start })
	else
		-- If no content to wrap, just insert empty parentheses
		local new_line = line:sub(1, col - 1) .. "()" .. line:sub(col)
		vim.api.nvim_set_current_line(new_line)
		vim.api.nvim_win_set_cursor(0, { vim.fn.line('.'), col })
	end
end

return M
