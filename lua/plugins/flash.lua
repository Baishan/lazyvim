local function setupCustomHighlightGroup()
  vim.api.nvim_command("hi clear FlashMatch")
  vim.api.nvim_command("hi clear FlashCurrent")
  vim.api.nvim_command("hi clear FlashLabel")

  vim.api.nvim_command("hi FlashMatch guibg=#4A47A3 guifg=#B8B5FF") -- Emerald background
  vim.api.nvim_command("hi FlashCurrent guibg=#456268 guifg=#D0E8F2")
  vim.api.nvim_command("hi FlashLabel guibg=#A25772 guifg=#EEF5FF")
  vim.api.nvim_command("hi FlashBackdrop ctermfg=59")
end

return {
  "folke/flash.nvim",  
  ---@type Flash.Config
  opts = {
    rainbow = {
      enabled = true,
      shade = 5,
    },
    highlight = {
      backdrop = true,
      groups = {
        match = "FlashMatch",
        current = "FlashCurrent",
        backdrop = "FlashBackdrop",
        label = "FlashLabel",
      },
    },
    modes = {
      char = {
        enabled = true,
        multi_line = false,
        highlight = {matches = false},
        autohide = true
      },
      search = {
        enabled = false,
      }

    },
  },
  config = function(_, opts)
    setupCustomHighlightGroup()
    require("flash").setup(opts)
  end,
  keys = function(_, opts)
    return {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    }
  end
}
