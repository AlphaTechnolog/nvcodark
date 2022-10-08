local M = {}

M.config = function ()
   local alpha = require 'alpha'
   local dashboard = require 'alpha.themes.dashboard'

   dashboard.section.header.val = {
      [[                                         ]],
      [[ ▗▄ ▗▖       ▄▄      ▗▄▄            ▗▖   ]],
      [[ ▐█ ▐▌      █▀▀▌     ▐▛▀█           ▐▌   ]],
      [[ ▐▛▌▐▌▐▙ ▟▌▐▛    ▟█▙ ▐▌ ▐▌ ▟██▖ █▟█▌▐▌▟▛ ]],
      [[ ▐▌█▐▌ █ █ ▐▌   ▐▛ ▜▌▐▌ ▐▌ ▘▄▟▌ █▘  ▐▙█  ]],
      [[ ▐▌▐▟▌ ▜▄▛ ▐▙   ▐▌ ▐▌▐▌ ▐▌▗█▀▜▌ █   ▐▛█▖ ]],
      [[ ▐▌ █▌ ▐█▌  █▄▄▌▝█▄█▘▐▙▄█ ▐▙▄█▌ █   ▐▌▝▙ ]],
      [[ ▝▘ ▀▘  ▀    ▀▀  ▝▀▘ ▝▀▀   ▀▀▝▘ ▀   ▝▘ ▀▘]],
      [[                                         ]]
   }

   dashboard.section.buttons.val = {
      dashboard.button("<leader>fn", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("<leader>ff", "  Find Files", "<cmd>Telescope find_files<CR>"),
      dashboard.button("<leader>fg", "  Find Words", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("<leader>fc", "  Find Commands", "<CMD>Telescope commands<CR>"),
      dashboard.button("<leader>fq", "  Quit NVIM" , ":qa<CR>"),
   }

   dashboard.section.footer.val = ""
   dashboard.config.opts.noautocmd = true

   alpha.setup(dashboard.config)
end

return M
