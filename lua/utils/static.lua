local M = {}

local langs_mt = {}
langs_mt.__index = langs_mt

function langs_mt:list(field)
  local deduplist = {}
  local result = {}
  -- deduplication
  for _, info in pairs(self) do
    if type(info[field]) == 'string' then
      deduplist[info[field]] = true
    end
  end
  for name, _ in pairs(deduplist) do
    table.insert(result, name)
  end
  return result
end

M.langs = setmetatable({
  bash = {
    ft = 'sh',
    lsp_server = 'bashls',
    dap = 'bashdb',
    formatting = 'shfmt',
  },
  c = {
    ts = 'c',
    ft = 'c',
    lsp_server = 'clangd',
    dap = 'codelldb',
    formatting = 'clang-format',
  },
  cpp = {
    ts = 'cpp',
    ft = 'cpp',
    lsp_server = 'clangd',
    dap = 'codelldb',
    formatting = 'clang-format',
  },
  help = {
    ts = 'vimdoc',
    ft = 'help',
  },
  lua = {
    ts = 'lua',
    ft = 'lua',
    lsp_server = 'lua_ls',
    formatting = 'stylua',
  },
  rust = {
    ts = 'rust',
    ft = 'rust',
    lsp_server = 'rust_analyzer',
    formatting = 'rustfmt',
  },
  make = {
    ts = 'make',
    ft = 'make',
  },
  python = {
    ts = 'python',
    ft = 'python',
    lsp_server = 'pylsp',
    dap = 'debugpy',
    formatting = 'black',
  },
  vim = {
    ts = 'vim',
    ft = 'vim',
    lsp_server = 'vimls',
  },
  latex = {
    ft = 'tex',
    lsp_server = 'texlab',
    formatting = 'latexindent',
  },
}, langs_mt)

-- stylua: ignore start
M.borders = {
  rounded               = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
  single                = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
  double                = { '═', '║', '═', '║', '╔', '╗', '╝', '╚' },
  double_header         = { '═', '│', '─', '│', '╒', '╕', '┘', '└' },
  double_bottom         = { '─', '│', '═', '│', '┌', '┐', '╛', '╘' },
  double_horizontal     = { '═', '│', '═', '│', '╒', '╕', '╛', '╘' },
  double_left           = { '─', '│', '─', '│', '╓', '┐', '┘', '╙' },
  double_right          = { '─', '│', '─', '│', '┌', '╖', '╜', '└' },
  double_vertical       = { '─', '│', '─', '│', '╓', '╖', '╜', '╙' },
  vintage               = { '-', '|', '-', '|', '+', '+', '+', '+' },
  rounded_clc           = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
  single_clc            = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
  double_clc            = { '╔', '═', '╗', '║', '╝', '═', '╚', '║' },
  double_header_clc     = { '╒', '═', '╕', '│', '┘', '─', '└', '│' },
  double_bottom_clc     = { '┌', '─', '┐', '│', '╛', '═', '╘', '│' },
  double_horizontal_clc = { '╒', '═', '╕', '│', '╛', '═', '╘', '│' },
  double_left_clc       = { '╓', '─', '┐', '│', '┘', '─', '╙', '│' },
  double_right_clc      = { '┌', '─', '╖', '│', '╜', '─', '└', '│' },
  double_vertical_clc   = { '╓', '─', '╖', '│', '╜', '─', '╙', '│' },
  vintage_clc           = { '+', '-', '+', '|', '+', '-', '+', '|' },
  empty                 = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
}
-- stylua: ignore end

local icons_mt = {}

function icons_mt:__index(key)
  return self.debug[key]
    or self.diagnostics[key]
    or self.kinds[key]
    or self.ui[key]
    or icons_mt[key]
end

---Flatten the layered icons table into a single type-icon table.
---@return table<string, string>
function icons_mt:flatten()
  local result = {}
  for _, icons in pairs(self) do
    for type, icon in pairs(icons) do
      result[type] = icon
    end
  end
  return result
end

-- stylua: ignore start
M.icons = setmetatable({
  debug = {
    StackFrame          = ' ',
    StackFrameCurrent   = ' ',
  },
  diagnostics = {
    DiagnosticSignError = ' ',
    DiagnosticSignHint  = '󰌶 ',
    DiagnosticSignInfo  = '󰋽 ',
    DiagnosticSignOk    = ' ',
    DiagnosticSignWarn  = '󰀪 ',
  },
  kinds = {
    Array               = ' ',
    Boolean             = ' ',
    BreakStatement      = '󰙧 ',
    Calculator          = ' ',
    Call                = '󰃷 ',
    CaseStatement       = '󱃙 ',
    Class               = ' ',
    Color               = ' ',
    Constant            = ' ',
    Constructor         = ' ',
    ContinueStatement   = '→ ',
    Copilot             = ' ',
    Declaration         = '󰙠 ',
    Delete              = '󰩺 ',
    Desktop             = 'ﲾ ',
    DoStatement         = '󰑖 ',
    Enum                = ' ',
    EnumMember          = ' ',
    Event               = ' ',
    Field               = ' ',
    File                = '󰈔 ',
    Folder              = '󰉋 ',
    ForStatement        = '󰑖 ',
    Format              = '󰗈 ',
    Function            = '󰊕 ',
    GitBranch           = ' ',
    Identifier          = '󰀫 ',
    IfStatement         = '󰇉 ',
    Interface           = ' ',
    Keyword             = '󰌋 ',
    List                = ' ',
    Log                 = '󰦪 ',
    Lsp                 = ' ',
    Macro               = '󰁌 ',
    MarkdownH1          = '󰉫 ',
    MarkdownH2          = '󰉬 ',
    MarkdownH3          = '󰉭 ',
    MarkdownH4          = '󰉮 ',
    MarkdownH5          = '󰉯 ',
    MarkdownH6          = '󰉰 ',
    Method              = ' ',
    Module              = '󰏗 ',
    Namespace           = ' ',
    Null                = '󰢤 ',
    Number              = ' ',
    Object              = ' ',
    Operator            = ' ',
    Package             = '󰆦 ',
    Property            = ' ',
    Reference           = '󰦾 ',
    Regex               = ' ',
    Repeat              = '󰑖 ',
    Scope               = ' ',
    Snippet             = '󰩫 ',
    Specifier           = '󰦪 ',
    Statement           = ' ',
    String              = '󰉾 ',
    Struct              = ' ',
    SwitchStatement     = '󰺟 ',
    Terminal            = ' ',
    Text                = ' ',
    Type                = ' ',
    TypeParameter       = ' ',
    Unit                = ' ',
    Value               = ' ',
    Variable            = '󰀫 ',
    WhileStatement      = '󰑖 ',
  },
  ui = {
    AngleDown           = ' ',
    AngleLeft           = ' ',
    AngleRight          = ' ',
    AngleUp             = ' ',
    ArrowDown           = '↓ ',
    ArrowLeft           = '← ',
    ArrowRight          = '→ ',
    ArrowUp             = '↑ ',
    Cross               = ' ',
    Diamond             = '◆ ',
    Dot                 = '• ',
    DotLarge            = ' ',
    Ellipsis            = '… ',
    Indicator           = ' ',
    Pin                 = '󰐃 ',
    Separator           = ' ',
    TriangleDown        = '▼ ',
    TriangleLeft        = '◀ ',
    TriangleRight       = '▶ ',
    TriangleUp          = '▲ ',
  },
}, icons_mt)
-- stylua: ignore end

return M
