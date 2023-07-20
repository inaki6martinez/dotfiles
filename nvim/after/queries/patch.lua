local ts = require('nvim-treesitter.configs')
local parsers = require('nvim-treesitter.parsers')

local patch_query = [[
  (diff_change_add) @diff_add
  (diff_change_delete) @diff_delete
]]

parsers.get_parser_configs().patch = {
  install_info = {
    url = '~/repos/tree-sitter-diff',
    files = { 'src/parser.c' },
    branch = 'master'
  },
  filetype = 'patch',
  used_by = { 'commit' }
}

local query = ts.parse_query('patch', patch_query)
ts.set_query('patch', 'textobjects', query)

ts.highlighter.hl_map.diff_add = 'DiffAdd'
ts.highlighter.hl_map.diff_delete = 'DiffDelete'



