local M = {}
local present, bufferline = pcall(require, 'bufferline')

function M.setup ()
   bufferline.setup({
      options = {
         offsets = {{
            filetype = 'NvimTree',
            text = '',
         }},
         buffer_close_icon = "",
         modified_icon = "",
         close_icon = "",
         show_close_icon = false,
         left_trunc_marker = " ",
         right_trunc_marker = " ",
         max_name_length = 20,
         max_prefix_length = 13,
         tab_size = 20,
         show_tab_indicators = true,
         enforce_regular_tabs = false,
         show_buffer_close_icons = true,
         separator_style = "thin",
         themable = true,
      },
   })
end

return M
