local M = {}

---Compute project directory for given path.
---@param fpath string?
---@param patterns string[]? root patterns
---@return string? nil if not found
function M.proj_dir(fpath, patterns)
  if not fpath or fpath == '' then
    return nil
  end
  patterns = patterns
    or {
      '.git',
      '.svn',
      '.bzr',
      '.hg',
      '.project',
      '.pro',
      '.sln',
      '.vcxproj',
      '.editorconfig',
    }
  local dirpath = vim.fs.dirname(fpath)
  local root = vim.fs.find(patterns, {
    path = dirpath,
    upward = true,
  })[1]
  if root and vim.loop.fs_stat(root) then
    return vim.fs.dirname(root)
  end
end

return M
