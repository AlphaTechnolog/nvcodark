local init_path = debug.getinfo(1, "S").source:sub(2)
local base_dir = init_path:match("(.*[/\\])"):sub(1, -2)

if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  vim.opt.rtp:append(base_dir)
end

pcall(require, "impatient")
require("nvcodark.bootstrap"):init(base_dir)
pcall(require("nvcodark.utils.start").run)
