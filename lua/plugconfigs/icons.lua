local present, icons = pcall(require, 'nvim-web-devicons')
local M = {}

if not present then
  error('[WARN/plugins/icons]: Cannot import nvim-web-devicons')
end

local all_icons = icons.get_icons()

function M.checkopt (obj, prop)
  if pcall(function() return obj[prop] end) then
    return true
  else
    return false
  end
end

function M.get_color (ext)
  if not M.checkopt(all_icons, ext) then
    print('[WARN/plugins/icons]: Cannot get a color for extension: ' .. ext)
    return "#fff"
  end
  return all_icons[ext].color
end

function M.get_opts ()
  return {
    override = {
      c = {
        icon = "",
        color = M.get_color('c'),
        name = "c",
      },
      css = {
        icon = "",
        color = M.get_color('css'),
        name = "css",
      },
      Dockerfile = {
        icon = "",
        color = M.get_color('Dockerfile'),
        name = "Dockerfile",
      },
      html = {
        icon = "",
        color = M.get_color('html'),
        name = "html",
      },
      jpeg = {
        icon = "",
        color = M.get_color('jpeg'),
        name = "jpeg",
      },
      jpg = {
        icon = "",
        color = M.get_color('jpg'),
        name = "jpg",
      },
      js = {
        icon = "",
        color = '#ebcb8b',
        name = "js",
      },
      kt = {
        icon = "󱈙",
        color = M.get_color('kt'),
        name = "kt",
      },
      lua = {
        icon = "",
        color = M.get_color('lua'),
        name = "lua",
      },
      png = {
        icon = "",
        color = M.get_color('png'),
        name = "png",
      },
      py = {
        icon = "",
        color = M.get_color('py'),
        name = "py",
      },
      toml = {
        icon = "",
        color = M.get_color('toml'),
        name = "toml",
      },
      ts = {
        icon = "ﯤ",
        color = M.get_color('ts'),
        name = "ts",
      },
      rb = {
        icon = "",
        color = M.get_color('rb'),
        name = "rb",
      },
      vue = {
        icon = "﵂",
        color = M.get_color('vue'),
        name = "vue",
      },
    },
  }
end

function M.setup ()
  icons.setup(M.get_opts())
end

return M
