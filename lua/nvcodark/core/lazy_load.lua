local M = {}
local autocmd = vim.api.nvim_create_autocmd

function M.lazy_load(payload)
  autocmd(payload.events, {
    pattern = "*",
    group = vim.api.nvim_create_augroup(payload.augroup_name, {}),
    callback = function()
      if payload.cond() then
        vim.api.nvim_del_augroup_by_name(payload.augroup_name)

        if payload.plugins ~= "nvim-treesitter" then
          vim.defer_fn(function()
            vim.cmd("PackerLoad " .. payload.plugins)
          end, 0)
        else
          vim.cmd("PackerLoad " .. payload.plugins)
        end
      end
    end,
  })
end

function M.colorizer()
  M.lazy_load {
    events = { "BufRead", "BufNewFile" },
    augroup_name = "ColorizerLazyLoading",
    plugins = "nvim-colorizer.lua",
    cond = function()
      local items = { "#", "rgb", "hsl", "rgba", "hsla" }
      for _, val in ipairs(items) do
        if vim.fn.search(val) ~= 0 then
          return true
        end
      end
    end,
  }
end

function M.on_file_open(plugname)
  M.lazy_load {
    events = { "BufRead", "BufWinEnter", "BufNewFile" },
    augroup_name = "BeLazyOnFileOpen" .. plugname,
    plugins = plugname,
    cond = function()
      local file = vim.fn.expand "%"
      return file ~= "NvimTree_1" and file ~= "[packer]" and file ~= ""
    end,
  }
end

function M.bufferline()
  M.lazy_load {
    events = { "BufNewFile", "BufRead", "TabEnter" },
    augroup_name = "BufferLineLazy",
    plugins = "bufferline.nvim",

    cond = function()
      return #vim.fn.getbufinfo { buflisted = 1 } >= 1
    end,
  }
end

return M
