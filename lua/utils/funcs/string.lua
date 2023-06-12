local M = {}

---Convert a snake_case string to camelCase
---@param str string?
---@return string?
function M.snake_to_camel(str)
  if not str then
    return nil
  end
  return (
    str:gsub('^%l', string.upper):gsub('_%l', string.upper):gsub('_', '')
  )
end

---Convert a camelCase string to snake_case
---@param str string
---@return string|nil
function M.camel_to_snake(str)
  if not str then
    return nil
  end
  return (str:gsub('%u', '_%1'):gsub('^_', ''):lower())
end

return M
