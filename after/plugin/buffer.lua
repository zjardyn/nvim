local bufferline = require("bufferline")
vim.opt.termguicolors = true
bufferline.setup{
  options = {
    mode = "buffers",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
            local icon = level:match("error") and "E:" or "W:"
            return " " .. icon .. count
        end,
    numbers = "ordinal",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer" ,
        text_align = "left",
        separator = false
      }
    },
  color_icons = true,
  separator_style = "thin",
  }
}
