local M = {}

---Check if the current line is a markdown code block
---@param lines string[]
function M.in_code_block(lines)
  local result = false
  for _, line in ipairs(lines) do
    if line:match('^```') then
      result = not result
    end
  end
  return result
end

return M
