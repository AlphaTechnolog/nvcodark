local nvim_web_devicons = require 'nvim-web-devicons'

local icons = {}

function icons.setup()
   nvim_web_devicons.setup {
      override = {
         jquery = {
            icon = "",
            color = "#1B75BB",
            require = 'jquery',
         },
         angular = {
            icon = "",
            color = "#E23237",
            require = 'angular',
         },
         backbone = {
            icon = "",
            color = "#0071B5",
            require = 'backbone',
         },
         requirejs = {
            icon = "",
            color = "#F44A41",
            name = 'requirejs',
         },
         materialize = {
            icon = "",
            color = "#EE6E73",
            name = 'materialize',
         },
         mootools = {
            icon = "",
            color = "#ECECEC",
            name = 'mootools',
         },
         js = {
            icon = '',
            color = '#ecd3a0',
            name = 'js',
         },
         ts = {
            icon = 'ﯤ',
            color = '#86aaec',
            name = 'ts',
         },
         nim = {
            icon = '',
            color = '#ecd3a0',
            name = 'nim',
         },
      }
   }
end

return icons
