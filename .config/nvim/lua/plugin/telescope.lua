local M = {}

local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}

require('telescope').load_extension('fzy_native')

M.project_files = function()
  local ok = pcall(require'telescope.builtin'.git_files)
  if not ok then require'telescope.builtin'.find_files() end
end

return M
