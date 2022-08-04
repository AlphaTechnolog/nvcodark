local M = {}
local map = vim.api.nvim_set_keymap

M.default_set_opts = {
   silent = true,
   noremap = true,
}

function M.cmd (cmd)
   return '<cmd>' .. cmd .. '<cr>'
end

function M.set (mode, mapping, to_exe, options)
   map(mode, mapping, to_exe, options or M.default_set_opts)
end

function M.bulk (mappings)
   for mode, maps in pairs(mappings) do
      for _, map in ipairs(maps) do
         local shortcut, cmd, opts = unpack(map)
         M.set(mode, shortcut, cmd, opts)
      end
   end
end

return M
