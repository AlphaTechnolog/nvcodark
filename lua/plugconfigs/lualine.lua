local M = {}
local present, lualine = pcall(require, 'lualine')
local tables = require('utils.tables')
local config = require('config')

if not present then
  error('[WARN/plugins/lualine]: Disabling lualine because i cannot import it')
end

function M.get_options()
  local default_config = {}
  return tables.extend(default_config, config.lualine.options or {})
end

function M.get_default_sections ()
  -- prehooks
  local texts = {
    n = 'Normal',
    i = 'Insert',
    v = 'Visual',
    [''] = 'Visual',
    V = 'VBlock',
    c = 'Command',
    no = 'No',
    s = 'S',
    S = 'S',
    [''] = 'S',
    ic = 'IC',
    R = 'Replace',
    Rv = 'RV',
    cv = 'CV',
    ce = 'CE',
    r = 'R',
    rm = 'RM',
    ['r?'] = 'R',
    ['!'] = '!',
    t = 'T',
  }

  local function get_text()
    local txt = texts[vim.fn.mode()]
    if config.lualine.custom.mode.normal_txt then
      return txt
    else
      return string.upper(txt)
    end
  end

  return {
    lualine_a = {
      {
        function ()
          return config.lualine.custom.mode.icon_fmt or ' '
        end
      }
    },
    lualine_z = {
      {
        function ()
          return '舘' .. get_text()
        end
      }
    }
  }
end

function M.get_sections ()
  local default_sections = M.get_default_sections()
  return tables.extend(default_sections, config.lualine.sections or {})
end

function M.get_tabline_config ()
  if config.tabbar.backend == 'lualine' then
    return tables.extend({
      lualine_a = {'buffers'},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {'branch'},
      lualine_z = {'tabs'}
    }, config.tabbar.options)
  else
    return {}
  end
end

M.setup = function ()
  local sections = config.lualine.sections or nil
  if config.lualine.custom.customized_sections then
    sections = M.get_sections()
  end
  lualine.setup(tables.extend(config.lualine, {
    options = M.get_options(),
    sections = sections,
    tabline = M.get_tabline_config()
  }))
end

return M
